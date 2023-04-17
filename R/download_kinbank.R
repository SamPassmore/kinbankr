

#' Downloading a version of Kinbank
#'
#' @param version the version of kinbank to download. Currently you can only download the latest version
#' @param destination the destination for the dataset to be saved to
#'
#' @return This function returns folder containing the raw and cldf versino of kinbank.
#' @export
#'
#' @examples
#' ## not tested
#' # download_kinbank()

download_kinbank = function(version="latest", destination = "."){
  url = "https://github.com/kinbank/kinbank/archive/refs/tags/v1.1.zip"
  if(version != "latest"){
    stop("Still in preperation")
  }
  usethis::use_course(url, destdir = destination)
}
