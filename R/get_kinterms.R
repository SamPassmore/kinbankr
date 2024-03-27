#' Extract Kinterms from Kinbank into a matrix
#'
#' @description
#' This function will output a matrix of kinterms, where columns are kin types, and rows are languages.
#' Some languages have more than one kin term per kin type. Duplicates is an argument that allows us how to decide how to deal with these.
#'
#' @param kin_types a character list of kintypes to extract. See kin_types() for a list of possibilities.
#' @param duplicates In some cases, languages have more than one kinterm per category.
#' @param languages a vector of Language IDs for which to calculate structural vectors for.
#' @param method the method for which to calculate the structural vectory. Options: binary (more to come).
#'
#' @return a matrix with columns of kin types, and rows with languages. Each cell contains a kinterm.
#' @export
#'
#' @examples
get_structural_vectors = function(kin_types, duplicates, languages = NULL, method = "binary"){
  require(dplyr)
  require(tidyr)
  require(numbers)
  data("kin_terms")

  if(!all(kin_types %in% kin_terms$Parameter_ID)){
    stop("Could not find some parameters in Kinbank. Check show_kin_types() for all available parameters.")
  }

  # Subset (ss) to the kinterms we want
  kinterms_ss = kin_terms[kin_terms$Parameter_ID %in% kin_types,]

  # Remove occasions where the kin terms is NA
  kinterms_ss = kinterms_ss[!is.na(kinterms_ss$Form),]

  if(!is.null(languages))
    kinterms_ss = subset(kinterms_ss, subset = kinterms_ss$Language_ID %in% languages)

  # only keep languages that contains all kin types
  kinterms_bylanguage = split(kinterms_ss$Parameter_ID, kinterms_ss$Language_ID)
  all_kintypes = sapply(kinterms_bylanguage, function(xx) all(kin_types %in% xx))
  keep_languages = names(all_kintypes)[all_kintypes]

  kinterms_ss = kinterms_ss[kinterms_ss$Language_ID %in% keep_languages,]

  # List of all languages that will be converted
  listed_languages = unique(kinterms_ss$Language_ID)

  if(duplicates == "random"){

    random_slice = c()
    for(i in seq_along(listed_languages)){
      cat("Language:", listed_languages[i], "\n")
      language_terms = kinterms_ss[kinterms_ss$Language_ID == listed_languages[i],]
      unique_kinterms = select_kinterms(language_terms)
      language_terms = language_terms[language_terms$Form %in% unique_kinterms,]
      random_slice = rbind(random_slice, language_terms)
    }

    random_slice = kinterms_ss %>%
      group_by(Language_ID, Parameter_ID, Form) %>%
      slice_sample(n = 1) %>%
      ungroup()

    random_slice$Parameter_ID = factor(random_slice$Parameter_ID, levels = kin_types)
    random_slice = random_slice[order(random_slice$Parameter_ID),]

    # make wide
    random_w = tidyr::spread(random_slice[,c("Language_ID", "Parameter_ID", "Form")], key = "Parameter_ID", value = "Form")

    # remove missing data
    random_w = random_w[complete.cases(random_w),]

    # remove Language Id for making structural vectors
    random_w_sv = subset(random_w, select = -c(Language_ID))

    # make it a matrix
    random_w_sv = as.matrix(random_w_sv)

    # make structural vectors
    structural_vectors = apply(random_w_sv, 1, FUN = get_vector, method = method)

    # transpose
    structural_vectors = t(structural_vectors)

    # name
    possible_names = outer(colnames(random_w_sv), colnames(random_w_sv), paste0)
    vector_names = possible_names[lower.tri(possible_names)]
    dimnames(structural_vectors) = list(random_w$Language_ID, vector_names)
  }

  if(duplicates == "any"){

    # how many comparisons will there be?
    n_comparisons = choose(length(kin_types), 2)

    structural_vectors = matrix(NA, nrow = length(listed_languages), ncol = n_comparisons)

    for(i in seq_along(listed_languages)){
      # subset to one language
      kinterm_language = subset(kinterms_ss, subset = kinterms_ss$Language_ID == listed_languages[i])

      # sort dataset by the order of the kin types given
      kinterm_language$Parameter_ID = factor(kinterm_language$Parameter_ID, levels = kin_types)
      kinterm_language = kinterm_language[order(kinterm_language$Parameter_ID),]

      # split dataset by kin type
      kinterms_list = split(kinterm_language$Form, kinterm_language$Parameter_ID)

      comparison_matrix = outer(kinterms_list, kinterms_list, Vectorize(\(x , y) any(x %in% y)))

      if(!all(colnames(comparison_matrix) == kin_types)){
        stop("There has been a sorting problem. Please raise an issue at github.com/SamPassmore/kinbankr")
      }

      structural_vectors[i,] = comparison_matrix[lower.tri(comparison_matrix)]
    }

    # name the matrix
    possible_names = outer(colnames(comparison_matrix), colnames(comparison_matrix), paste0)
    vector_names = possible_names[lower.tri(comparison_matrix)]
    dimnames(structural_vectors) = list(listed_languages, vector_names)

  }

  structural_vectors
}

#' Extrapolate the structural properties of a kin term subset.
#'
#' @description
#' This is an internally used function.
#'
#'
#' @param kin_data The list of kinterms and kindata
#' @param method How should comparisons be calculated? Usually binary.
#'
#' @return
#' @export
#'
#' @examples
get_vector = function(kin_data, method = "binary"){
  max_char = sapply(kin_data, nchar) %>% max(.)
  ## compare all values to each other, then take the lower triangle of the matrix
  ## i.e. we don't need every comparison twice.
  m = outer(kin_data, kin_data, get_dist, method = method, max_char = max_char) %>%
    .[lower.tri(.)] %>%
    c(.)

  new_colnames = outer(names(kin_data), names(kin_data), paste0)
  names(m) = new_colnames[lower.tri(new_colnames)]
  m
}

#' Randomly select kinterms
#'
#' @description
#' This function ensures that we randomly select kinterms to determine a system, rather than select a kinterm at random for each kin type.
#'
#'
#' @param df data frame from Kinbank
#'
#' @return
#' @export
#'
#' @examples
select_kinterms = function(df){
  tt = table(df$Form, df$Parameter_ID) # table of all kinterms
  tt2 = tt # Duplicate object for random deletions
  c_names = colnames(tt)[colSums(tt) > 1] # identify columns where there are multiple possibilities
  rr = which(rowSums(tt[,c_names]) == 1)
  while(!all(colSums(tt2) == 1)){

    # randomly delete a kinterm and see if all kin types are still present
    rm = sample(rr, 1)
    tt2 = tt[-rm,]
    # remove that row once you've tried it.
    rr = rr[rr != rm]
  }
  rownames(tt2)
}

#' Calculate distances within a language
#'
#' @description
#' Only for internal use.
#'
#'
#' @param x a kinterm
#' @param y a kinterm to compare to
#' @param max_char the longest kinterm in the langauge
#' @param method the comparison type to be used (binary or string distance)
#'
#' @return a distance between two kin terms.
#' @export
#'
#' @examples
get_dist = function(x, y, max_char, method = "osa"){
  if(method == "binary"){
    ifelse(x == y, 1, 0)
  } else {
    stringdist::stringdist(x, y, method = method) / max_char
  }
}
