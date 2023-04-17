### This script contains functions for looking at kinbank descriptive statistics and information

#' List all parameters used in Kinbank.
#'
#' @return A data.frame of all kin types in the Kinbank dataset show the parameter and written description.
#' @export
#'
#' @examples
#' show_kin_types()

show_kin_types = function(){
  data("parameters")
  parameters[,c("Parameter", "Name")]
}

#' List all languages in Kinbank
#'
#' @return a character vector of all languages in Kinbank
#' @export
#'
#' @examples
#' show_languages()
show_languages = function(){
  data("languages")
  languages[,c("Name")]
}
