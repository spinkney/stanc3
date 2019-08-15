open Core_kernel
open Frontend

let%expect_test "matrix array multi indexing " =
  Frontend_utils.typed_ast_of_string_exn
    {|
transformed data {
  int arr[3] = {2, 3, 1};
  matrix[3,4] mat[5];
  print(mat[2, arr, 2]);
} |}
  |> Desugar.desugar_prog
  |> Fmt.pr "@[<v>%a@]\n" Pretty_printing.pp_program ;
  [%expect
    {|
    transformed data {
      int arr[3] = {2, 3, 1};
      matrix[3, 4] mat[5];
      print(mat[2, arr, 2]);
    } |}]

let%expect_test "matrix array multi indexing " =
  Frontend_utils.typed_ast_of_string_exn
    {|
transformed data {
  int arr[3] = {2, 3, 1};
  matrix[3,4] mat[5];
  print(mat[2][arr][2]);
} |}
  |> Desugar.desugar_prog
  |> Fmt.pr "@[<v>%a@]\n" Pretty_printing.pp_program ;
  [%expect
    {|
    transformed data {
       int arr[3] = {2, 3, 1};
       matrix[3, 4] mat[5];
       print(mat[2][arr[2]]);
     }
 |}]

let%expect_test "matrix array multi indexing " =
  Frontend_utils.typed_ast_of_string_exn
    {|
transformed data {
  int arr[3] = {2, 3, 1};
  matrix[3,4] mat[5];
  print(mat[2, arr, arr][2, 2]);
} |}
  |> Desugar.desugar_prog
  |> Fmt.pr "@[<v>%a@]\n" Pretty_printing.pp_program ;
  [%expect
    {|
    transformed data {
        int arr[3] = {2, 3, 1};
        matrix[3, 4] mat[5];
        print(mat[2, arr[2], arr[2]]);
      }
 |}]

let%expect_test "matrix array multi indexing " =
  Frontend_utils.typed_ast_of_string_exn
    {|
transformed data {
  int arr[3] = {2, 3, 1};
  matrix[3,4] mat[5];
  print(mat[3:, 2:3][2, 1]);
} |}
  |> Desugar.desugar_prog
  |> Fmt.pr "@[<v>%a@]\n" Pretty_printing.pp_program ;
  [%expect
    {|
    transformed data {
         int arr[3] = {2, 3, 1};
         matrix[3, 4] mat[5];
         print(mat[3 + 2 - 1, 2 + 1 - 1]);
       }
 |}]

let%expect_test "matrix array multi indexing " =
  Frontend_utils.typed_ast_of_string_exn
    {|
transformed data {
  int arr[3] = {2, 3, 1};
  matrix[3,4] mat[5];
  print(mat[:3, 1, :]);
} |}
  |> Desugar.desugar_prog
  |> Fmt.pr "@[<v>%a@]\n" Pretty_printing.pp_program ;
  [%expect
    {|
    transformed data {
          int arr[3] = {2, 3, 1};
          matrix[3, 4] mat[5];
          print(mat[ : 3, 1]);
        }
 |}]

let%expect_test "matrix array multi indexing " =
  Frontend_utils.typed_ast_of_string_exn
    {|
transformed data {
  int arr[3] = {2, 3, 1};
  matrix[3, 4] mat[5];
  print(mat[4:, 2:3, 1]);
  print(mat[:, arr][2, 1, 1]);
  print(mat[:, arr, :][2, 1, 1]);
  print(mat[2, :, arr][2, 1]);
  print(mat[:, 2, arr][2, 1]);
} |}
  |> Desugar.desugar_prog
  |> Fmt.pr "@[<v>%a@]\n" Pretty_printing.pp_program ;
  [%expect
    {|
    transformed data {
           int arr[3] = {2, 3, 1};
           matrix[3, 4] mat[5];
           print(mat[4 : , 2 : 3, 1]);
           print(mat[2, arr[1]][1]);
           print(mat[2, arr[1], 1]);
           print(mat[2, 2, arr[1]]);
           print(mat[2, 2, arr[1]]);
         } |}]