library(testthat)

testthat::test_that("Hydrate package from specifications", {
  tempdir <- tempdir()
  studySpecs <- getTestEstimationSpecification()
  hydrate(studySpecs, tempdir)
  packageCreated <- dir.exists(tempdir)
  testthat::expect_true(packageCreated)
})

testthat::test_that("Test library installation of hydra generated package", {
  tempdir <- tempdir(check = TRUE)
  studySpecs <- getTestEstimationSpecification()
  hydrate(studySpecs, tempdir)
  #system("R CMD INSTALL --build UnitTestPackage.tar.gz")
  devtools::load_all(tempdir)
  packageLoads <- exists('execute', where='package:UnitTestPackage', mode='function') 
  testthat::expect_true(packageLoads)
})


testthat::test_that("Ru hydra generated package", {
  # Load up Eunomia
  # Provide connection to Enumoia
  # Run package
  # Run without error - PASS
  tempdir <- tempdir(check = TRUE)
  cdmDatabaseSchema <- "main"
  cohortDatabaseSchema <- "main"
  oracleTempSchema <- NULL
  cohortTable <- "my_cohort"
  connectionDetails <-   Eunomia::getEunomiaConnectionDetails()
  #connection <- DatabaseConnector::connect(connectionDetails)
  
  # Eunomia::createCohorts(connectionDetails = connectionDetails,
  #                        cdmDatabaseSchema = cdmDatabaseSchema,
  #                        cohortDatabaseSchema = cohortDatabaseSchema,
  #                        cohortTable = cohortTable)
  UnitTestPackage::execute(connectionDetails = connectionDetails,
                           cdmDatabaseSchema = cdmDatabaseSchema,
                           cohortDatabaseSchema = cohortDatabaseSchema,
                           cohortTable = cohortTable,
                           oracleTempSchema = oracleTempSchema,
                           outputFolder = tempdir,
                           databaseId = "Eunomia",
                           databaseName = "Eunomia",
                           databaseDescription = "Eunomia",
                           createCohorts = TRUE,
                           synthesizePositiveControls = FALSE, # Might not be enough power?
                           runAnalyses = TRUE,
                           runDiagnostics = TRUE,
                           packageResults = TRUE,
                           maxCores = 1,
                           minCellCount = 1)
  
  #DatabaseConnector::disconnect(connection)
  
})
