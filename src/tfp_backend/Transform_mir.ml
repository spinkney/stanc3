open Core_kernel
open Middle

let dist_prefix = "tfd__."

let remove_stan_dist_suffix s =
  let s = Utils.stdlib_distribution_name s in
  List.filter_map
    (("_rng" :: Utils.distribution_suffices) @ [""])
    ~f:(fun suffix -> String.chop_suffix ~suffix s)
  |> List.hd_exn

let capitalize_fnames = String.Set.of_list ["normal"; "cauchy"]

let map_functions fname args =
  match fname with
  | "multi_normal_cholesky" -> ("MultivariateNormalTriL", args)
  | f when Operator.of_string_opt f |> Option.is_some -> (fname, args)
  | _ ->
      if Set.mem capitalize_fnames fname then (String.capitalize fname, args)
      else raise_s [%message "Not sure how to handle " fname " yet!"]

let rec translate_funapps e =
  let pattern =
    match e.Expr.Fixed.pattern with
    | FunApp (StanLib, fname, args) ->
        let prefix =
          if Utils.is_distribution_name fname then dist_prefix else ""
        in
        let fname = remove_stan_dist_suffix fname in
        let fname, args = map_functions fname args in
        Expr.Fixed.Pattern.FunApp (StanLib, prefix ^ fname, args)
    | x -> Expr.Fixed.Pattern.map translate_funapps x
  in
  {e with pattern}

let%expect_test "nested dist prefixes translated" =
  let open Expr.Fixed.Pattern in
  let e pattern = {Expr.Fixed.pattern; meta= ()} in
  let f =
    FunApp
      ( Fun_kind.StanLib
      , "normal_lpdf"
      , [FunApp (Fun_kind.StanLib, "normal_lpdf", []) |> e] )
    |> e |> translate_funapps
  in
  print_s [%sexp (f : unit Expr.Fixed.t)] ;
  [%expect
    {|
    ((pattern
      (FunApp StanLib tfd__.Normal
       (((pattern (FunApp StanLib normal_lpdf ())) (meta ())))))
     (meta ())) |}]

(* temporary until we get rid of these from the MIR *)
let rec remove_unused_stmts s =
  let pattern =
    match s.Stmt.Fixed.pattern with
    | Assignment (_, {Expr.Fixed.pattern= FunApp (CompilerInternal, f, _); _})
      when Internal_fun.to_string FnConstrain = f
           || Internal_fun.to_string FnUnconstrain = f ->
        Stmt.Fixed.Pattern.Skip
    | Decl _ -> Stmt.Fixed.Pattern.Skip
    | x -> Stmt.Fixed.Pattern.map Fn.id remove_unused_stmts x
  in
  {s with pattern}

let trans_prog (p : Program.Typed.t) =
  let rec map_stmt {Stmt.Fixed.pattern; meta} =
    { Stmt.Fixed.pattern=
        Stmt.Fixed.Pattern.map translate_funapps map_stmt pattern
    ; meta }
  in
  Program.map translate_funapps map_stmt p
  |> Program.map Fn.id remove_unused_stmts
  |> Program.Helpers.(map_stmts cleanup_empty_stmts)
