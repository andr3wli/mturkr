# get list from function
keep <- discard_list(df1 = batch, df2 = mturk)

# get the values form the code columns
batch_code <- batch$Answer.surveycode
mturk_code <- mturk$Code

# get elements from the mturk code vector that are not in the batch vector
not_in_list <- setdiff(mturk_code, batch_code)

# get all the false values
false_test <- not_in_list %in% keep

test_that("There are not NA values in the keep vector", {
  expect_false(any(is.na(keep)))
})

test_that("elements from not_in_list vector are not present in the keep vector", {
  expect_true(!("16888608" %in% keep))
  expect_true("99575490" %in% keep)
  expect_true("04799377" %in% not_in_list)
  expect_equal(false_test, not_in_list %in% keep)
})
