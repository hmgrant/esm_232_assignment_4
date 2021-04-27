#' Almond Model
#' 
#' This model calculates the statistical yield 
#' of almonds given certain inputs (Tn_2 and P_1, see below) and parameters (coefficients and intercept, see below).
#' @param Tn_2 minimum temperature for second month of year (°C); numeric input
#' @param P_1 precipitation for first month of year (mm); numeric input
#' @param Tn_2_coeff coefficient for the minimum temperature for second month of year; default value: -0.015
#' @param Tn_2_2_coeff coefficient for the second degree of the minimum temperature for second month of year; default value: -0.0046 
#' @param P_1_coeff coefficient for precipitation for first month of year; default value: -0.07
#' @param P_1_2_coeff coefficient for the second degree of the precipitation for first month of year; default value: 0.0043
#' @param intercept intercept of the model; default value: 0.28
#' @return Yield anomaly per ton acre
#' @example almond_model(Tn_2 = 8, P_1 = 2.8) 
#' @example almond_model(Tn_2 = c(8, 8.1, 7.6, 6.9), P_1 = c(3, 2.2, 3.1, 2.9))
#' @example almond_model(Tn_2 = 8, P_1 = 2.8, Tn_2_coeff = -0.02)


almond_model = function(Tn_2, P_1, Tn_2_coeff = -0.015, Tn_2_2_coeff = -0.0046, P_1_coeff = -0.07, P_1_2_coeff = 0.0043, intercept = 0.28){
  
  # calculate yield
  result = (Tn_2_coeff * Tn_2) + (Tn_2_2_coeff * (Tn_2)^2) + (P_1_coeff * P_1) + (P_1_2_coeff * (P_1)^2) + intercept
  
  return(result)
  
}