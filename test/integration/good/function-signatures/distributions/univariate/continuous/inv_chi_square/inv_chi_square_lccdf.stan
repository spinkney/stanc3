data { 
  int d_int;
  int d_int_array[d_int];
  real d_real;
  real d_real_array[d_int];
  vector[d_int] d_vector;
  row_vector[d_int] d_row_vector;
}
transformed data {
  real transformed_data_real;

  transformed_data_real = inv_chi_square_lccdf(d_int| d_int);
  transformed_data_real = inv_chi_square_lccdf(d_int| d_real);
  transformed_data_real = inv_chi_square_lccdf(d_int| d_real_array);
  transformed_data_real = inv_chi_square_lccdf(d_int| d_vector);
  transformed_data_real = inv_chi_square_lccdf(d_int| d_row_vector);
  transformed_data_real = inv_chi_square_lccdf(d_real| d_int);
  transformed_data_real = inv_chi_square_lccdf(d_real| d_real);
  transformed_data_real = inv_chi_square_lccdf(d_real| d_real_array);
  transformed_data_real = inv_chi_square_lccdf(d_real| d_vector);
  transformed_data_real = inv_chi_square_lccdf(d_real| d_row_vector);
  transformed_data_real = inv_chi_square_lccdf(d_real_array| d_int);
  transformed_data_real = inv_chi_square_lccdf(d_real_array| d_real);
  transformed_data_real = inv_chi_square_lccdf(d_real_array| d_real_array);
  transformed_data_real = inv_chi_square_lccdf(d_real_array| d_vector);
  transformed_data_real = inv_chi_square_lccdf(d_real_array| d_row_vector);
  transformed_data_real = inv_chi_square_lccdf(d_vector| d_int);
  transformed_data_real = inv_chi_square_lccdf(d_vector| d_real);
  transformed_data_real = inv_chi_square_lccdf(d_vector| d_real_array);
  transformed_data_real = inv_chi_square_lccdf(d_vector| d_vector);
  transformed_data_real = inv_chi_square_lccdf(d_vector| d_row_vector);
  transformed_data_real = inv_chi_square_lccdf(d_row_vector| d_int);
  transformed_data_real = inv_chi_square_lccdf(d_row_vector| d_real);
  transformed_data_real = inv_chi_square_lccdf(d_row_vector| d_real_array);
  transformed_data_real = inv_chi_square_lccdf(d_row_vector| d_vector);
  transformed_data_real = inv_chi_square_lccdf(d_row_vector| d_row_vector);
}
parameters {
  real p_real;
  real p_real_array[d_int];
  vector[d_int] p_vector;
  row_vector[d_int] p_row_vector;
  
  real y_p;
}
transformed parameters {
  real transformed_param_real;

  transformed_param_real = inv_chi_square_lccdf(d_int| d_int);
  transformed_param_real = inv_chi_square_lccdf(d_int| d_real);
  transformed_param_real = inv_chi_square_lccdf(d_int| d_real_array);
  transformed_param_real = inv_chi_square_lccdf(d_int| d_vector);
  transformed_param_real = inv_chi_square_lccdf(d_int| d_row_vector);
  transformed_param_real = inv_chi_square_lccdf(d_int| p_real);
  transformed_param_real = inv_chi_square_lccdf(d_int| p_real_array);
  transformed_param_real = inv_chi_square_lccdf(d_int| p_vector);
  transformed_param_real = inv_chi_square_lccdf(d_int| p_row_vector);
  transformed_param_real = inv_chi_square_lccdf(d_real| d_int);
  transformed_param_real = inv_chi_square_lccdf(d_real| d_real);
  transformed_param_real = inv_chi_square_lccdf(d_real| d_real_array);
  transformed_param_real = inv_chi_square_lccdf(d_real| d_vector);
  transformed_param_real = inv_chi_square_lccdf(d_real| d_row_vector);
  transformed_param_real = inv_chi_square_lccdf(d_real| p_real);
  transformed_param_real = inv_chi_square_lccdf(d_real| p_real_array);
  transformed_param_real = inv_chi_square_lccdf(d_real| p_vector);
  transformed_param_real = inv_chi_square_lccdf(d_real| p_row_vector);
  transformed_param_real = inv_chi_square_lccdf(d_real_array| d_int);
  transformed_param_real = inv_chi_square_lccdf(d_real_array| d_real);
  transformed_param_real = inv_chi_square_lccdf(d_real_array| d_real_array);
  transformed_param_real = inv_chi_square_lccdf(d_real_array| d_vector);
  transformed_param_real = inv_chi_square_lccdf(d_real_array| d_row_vector);
  transformed_param_real = inv_chi_square_lccdf(d_real_array| p_real);
  transformed_param_real = inv_chi_square_lccdf(d_real_array| p_real_array);
  transformed_param_real = inv_chi_square_lccdf(d_real_array| p_vector);
  transformed_param_real = inv_chi_square_lccdf(d_real_array| p_row_vector);
  transformed_param_real = inv_chi_square_lccdf(d_vector| d_int);
  transformed_param_real = inv_chi_square_lccdf(d_vector| d_real);
  transformed_param_real = inv_chi_square_lccdf(d_vector| d_real_array);
  transformed_param_real = inv_chi_square_lccdf(d_vector| d_vector);
  transformed_param_real = inv_chi_square_lccdf(d_vector| d_row_vector);
  transformed_param_real = inv_chi_square_lccdf(d_vector| p_real);
  transformed_param_real = inv_chi_square_lccdf(d_vector| p_real_array);
  transformed_param_real = inv_chi_square_lccdf(d_vector| p_vector);
  transformed_param_real = inv_chi_square_lccdf(d_vector| p_row_vector);
  transformed_param_real = inv_chi_square_lccdf(d_row_vector| d_int);
  transformed_param_real = inv_chi_square_lccdf(d_row_vector| d_real);
  transformed_param_real = inv_chi_square_lccdf(d_row_vector| d_real_array);
  transformed_param_real = inv_chi_square_lccdf(d_row_vector| d_vector);
  transformed_param_real = inv_chi_square_lccdf(d_row_vector| d_row_vector);
  transformed_param_real = inv_chi_square_lccdf(d_row_vector| p_real);
  transformed_param_real = inv_chi_square_lccdf(d_row_vector| p_real_array);
  transformed_param_real = inv_chi_square_lccdf(d_row_vector| p_vector);
  transformed_param_real = inv_chi_square_lccdf(d_row_vector| p_row_vector);
  transformed_param_real = inv_chi_square_lccdf(p_real| d_int);
  transformed_param_real = inv_chi_square_lccdf(p_real| d_real);
  transformed_param_real = inv_chi_square_lccdf(p_real| d_real_array);
  transformed_param_real = inv_chi_square_lccdf(p_real| d_vector);
  transformed_param_real = inv_chi_square_lccdf(p_real| d_row_vector);
  transformed_param_real = inv_chi_square_lccdf(p_real| p_real);
  transformed_param_real = inv_chi_square_lccdf(p_real| p_real_array);
  transformed_param_real = inv_chi_square_lccdf(p_real| p_vector);
  transformed_param_real = inv_chi_square_lccdf(p_real| p_row_vector);
  transformed_param_real = inv_chi_square_lccdf(p_real_array| d_int);
  transformed_param_real = inv_chi_square_lccdf(p_real_array| d_real);
  transformed_param_real = inv_chi_square_lccdf(p_real_array| d_real_array);
  transformed_param_real = inv_chi_square_lccdf(p_real_array| d_vector);
  transformed_param_real = inv_chi_square_lccdf(p_real_array| d_row_vector);
  transformed_param_real = inv_chi_square_lccdf(p_real_array| p_real);
  transformed_param_real = inv_chi_square_lccdf(p_real_array| p_real_array);
  transformed_param_real = inv_chi_square_lccdf(p_real_array| p_vector);
  transformed_param_real = inv_chi_square_lccdf(p_real_array| p_row_vector);
  transformed_param_real = inv_chi_square_lccdf(p_vector| d_int);
  transformed_param_real = inv_chi_square_lccdf(p_vector| d_real);
  transformed_param_real = inv_chi_square_lccdf(p_vector| d_real_array);
  transformed_param_real = inv_chi_square_lccdf(p_vector| d_vector);
  transformed_param_real = inv_chi_square_lccdf(p_vector| d_row_vector);
  transformed_param_real = inv_chi_square_lccdf(p_vector| p_real);
  transformed_param_real = inv_chi_square_lccdf(p_vector| p_real_array);
  transformed_param_real = inv_chi_square_lccdf(p_vector| p_vector);
  transformed_param_real = inv_chi_square_lccdf(p_vector| p_row_vector);
  transformed_param_real = inv_chi_square_lccdf(p_row_vector| d_int);
  transformed_param_real = inv_chi_square_lccdf(p_row_vector| d_real);
  transformed_param_real = inv_chi_square_lccdf(p_row_vector| d_real_array);
  transformed_param_real = inv_chi_square_lccdf(p_row_vector| d_vector);
  transformed_param_real = inv_chi_square_lccdf(p_row_vector| d_row_vector);
  transformed_param_real = inv_chi_square_lccdf(p_row_vector| p_real);
  transformed_param_real = inv_chi_square_lccdf(p_row_vector| p_real_array);
  transformed_param_real = inv_chi_square_lccdf(p_row_vector| p_vector);
  transformed_param_real = inv_chi_square_lccdf(p_row_vector| p_row_vector);
}
model {  
  y_p ~ normal(0,1); // in case anyone tries to run it
}
