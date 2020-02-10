library(testthat)

testthat::test_that("Hydrate package from specifications", {
  tempdir <- tempdir()
  studySpecs <- getTestEstimationSpecification()
  hydrate(studySpecs, tempdir)
  packageCreated <- dir.exists(tempdir)
  testthat::expect_true(packageCreated)
})

testthat::test_that("Test load of hydra generated package", {
  tempdir <- tempdir(check = TRUE)
  studySpecs <- getTestEstimationSpecification()
  hydrate(studySpecs, tempdir)
  packageCreated <- dir.exists(tempdir)
  #system("R CMD INSTALL --build UnitTestPackage.tar.gz")
  devtools::load_all(tempdir)
  testthat::expect_true(packageCreated)
})
