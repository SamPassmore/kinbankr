% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{languages}
\alias{languages}
\title{Language Metadata}
\format{
A data frame with 1229 rows and 17 variables:
\describe{
  \item{\code{ID}}{character Unique identifier consisting of the first letter of the project of origin, the langauge name, and the glottocode.}
  \item{\code{Name}}{character The language name.}
  \item{\code{Glottocode}}{character The glottocode associated with this language.}
  \item{\code{Glottolog_Name}}{character The name of this language in Glottolog (https://glottolog.org/).}
  \item{\code{ISO639P3code}}{character ISO 639-P3 language code.}
  \item{\code{Macroarea}}{character An area of the globe of roughly continent size. The division of the inhabited landmass into the macro-areas defined here is optimal in the following sense. It is the division into 6 areas, for which there are at least 250 languages in each area, such that the distance between the component parts inside each area is minimized, and the length of intersections between pairs of macro-areas is minimized. See Harald Hammarström and Mark Donohue 2014.}
  \item{\code{Latitude}}{double The latitude of a language according to Glottolog.}
  \item{\code{Longitude}}{double The longitude of a language according to Glottolog.}
  \item{\code{Family}}{character The name of the language family a langauge belongs to.}
  \item{\code{Label}}{character The concatentation of language name and glottocode.}
  \item{\code{Project}}{character The name of the project which collected a language.}
  \item{\code{ProjectFile}}{character The file name of the kinterm data for a language.}
  \item{\code{ProjectName}}{logical <ignore>}
  \item{\code{EntryDate}}{double The date of collection (largely incomplete).}
  \item{\code{Comment}}{character Comments or notes about the collection of the data.}
  \item{\code{Link}}{character URLs to information on a language. Often unused.}
  \item{\code{Set}}{character The name of the project which collected a language.}
}
}
\source{
\url{http://somewhere.important.com/}
}
\usage{
languages
}
\description{
This file contains metadata on each language including: glottocode, geographic coordinates, ISO639P3 code, and Language family.
}
\references{
Harald Hammarström and Mark Donohue. 2014. Some Principles on the use of Macro-Areas in Typological Comparison. In Harald Hammarström and Lev Michael (eds.), Quantitative Approaches to Areal Linguistic Typology, 167-187. Leiden: Brill.
}
\keyword{datasets}
