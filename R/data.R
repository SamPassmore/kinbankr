#' @title Kin types available within Kinbank
#' @description This file contains descriptions of each kin type used in the dataset. Some kin types are used only once, others are used often. For the template set of kinterms, see the Kinbank publication.
#' @format A data frame with 943 rows and 7 variables:
#' \describe{
#'   \item{\code{ID}}{character The unique identifier for the parameter. Often the same as Parameter, but without special characters.}
#'   \item{\code{Name}}{character A written description of ID}
#'   \item{\code{Concepticon_ID}}{integer A numeric identifier to align with Concepticon (https://concepticon.clld.org/)}
#'   \item{\code{Concepticon_Gloss}}{character A description of the concepticon identifier}
#'   \item{\code{Parameter}}{character The parameter used when coding Kinbank. Usually, this is built from primitive kinship abbreviations, such as: B (brother), Z (sister), F (father), M (mother), S (son), D (daughter), C (child), H (husband), W (wife). As well as using modifiers such as e (elder), y (younger), m (male speaker), f (female speaker)}
#'   \item{\code{Group}}{character Broader categorisation of the parameter (e.g. The parameter B (brother) is categorised more broadly as Sibling)}
#'   \item{\code{Dataset}}{character Describes which Kinbank collaborator project collected the data}
#'}
#' @source \url{http://www.kinbank.net/}
"parameters"

#' @title Language Metadata
#' @description This file contains metadata on each language including: glottocode, geographic coordinates, ISO639P3 code, and Language family.
#' @format A data frame with 1229 rows and 17 variables:
#' \describe{
#'   \item{\code{ID}}{character Unique identifier consisting of the first letter of the project of origin, the langauge name, and the glottocode.}
#'   \item{\code{Name}}{character The language name.}
#'   \item{\code{Glottocode}}{character The glottocode associated with this language.}
#'   \item{\code{Glottolog_Name}}{character The name of this language in Glottolog (https://glottolog.org/).}
#'   \item{\code{ISO639P3code}}{character ISO 639-P3 language code.}
#'   \item{\code{Macroarea}}{character An area of the globe of roughly continent size. The division of the inhabited landmass into the macro-areas defined here is optimal in the following sense. It is the division into 6 areas, for which there are at least 250 languages in each area, such that the distance between the component parts inside each area is minimized, and the length of intersections between pairs of macro-areas is minimized. See Harald Hammarström and Mark Donohue 2014.}
#'   \item{\code{Latitude}}{double The latitude of a language according to Glottolog.}
#'   \item{\code{Longitude}}{double The longitude of a language according to Glottolog.}
#'   \item{\code{Family}}{character The name of the language family a langauge belongs to.}
#'   \item{\code{Label}}{character The concatentation of language name and glottocode.}
#'   \item{\code{Project}}{character The name of the project which collected a language.}
#'   \item{\code{ProjectFile}}{character The file name of the kinterm data for a language.}
#'   \item{\code{ProjectName}}{logical <ignore>}
#'   \item{\code{EntryDate}}{double The date of collection (largely incomplete).}
#'   \item{\code{Comment}}{character Comments or notes about the collection of the data.}
#'   \item{\code{Link}}{character URLs to information on a language. Often unused.}
#'   \item{\code{Set}}{character The name of the project which collected a language.}
#'}
#' @references Harald Hammarström and Mark Donohue. 2014. Some Principles on the use of Macro-Areas in Typological Comparison. In Harald Hammarström and Lev Michael (eds.), Quantitative Approaches to Areal Linguistic Typology, 167-187. Leiden: Brill.
#' @source \url{http://somewhere.important.com/}
"languages"

#' @title Kin terms
#' @description This contains the forms, or kinterms, for each language. This file links to the languages file by the Languages_ID column, parameters file by the Parameters_ID column, and the sources file by the sources_bibtex column.
#' @format A data frame with 210903 rows and 13 variables:
#' \describe{
#'   \item{\code{ID}}{character A unique identifier.}
#'   \item{\code{Local_ID}}{logical <To be removed>}
#'   \item{\code{Language_ID}}{character ID from the langauges datatable.}
#'   \item{\code{Parameter_ID}}{character ID from the parameters datatable.}
#'   \item{\code{Value}}{character Contains the original transcription of the data. May include multiple terms per row (e.g. "brother; bro). Please verify.}
#'   \item{\code{Form}}{character Contains a cleaned transcription of the data, splitting data into one term per row. Please check the data has been correctly parsed.}
#'   \item{\code{Segments}}{logical <ignore>}
#'   \item{\code{Comment}}{character Comments on a kinterm, usually offering more detail or considerations.}
#'   \item{\code{Source}}{character Bibtex code for the source of the kinterm.}
#'   \item{\code{Cognacy}}{logical <future column for cognates>}
#'   \item{\code{Loan}}{logical <future column for labelling loans>}
#'   \item{\code{Graphemes}}{logical <future column for labelling graphemes>}
#'   \item{\code{Profile}}{logical =ignore>}
#'}
#' @source \url{http://www.kinbank.net}
"kin_terms"
