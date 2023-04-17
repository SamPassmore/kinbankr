
download_kinbank(destination = "tests/testthat/")

testthat::expect(file.exists("tests/testthat/kinbank-1.1/kinbank/cldf/forms.csv"),
                 failure_message = "Kinbank has not downloaded correctly")
