## code to prepare `kinbank` dataset goes here

parameters = read.csv('data-raw/kinbank-1.1/kinbank/cldf/parameters.csv')

kin_terms = read.csv('data-raw/kinbank-1.1/kinbank/cldf/forms.csv')

languages = read.csv('data-raw/kinbank-1.1/kinbank/cldf/languages.csv')

# This should be the last line.
# Note that names are unquoted.
# I like using overwrite = T so everytime I run the script the
# updated objects are saved, but the default is overwrite = F
usethis::use_data(parameters, kin_terms, languages, overwrite = T)
