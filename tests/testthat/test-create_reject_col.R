# create the keep and the failed attention check vectors needed for this function
keep <- discard_list(df1 = batch, df2 = mturk)
attention_question <- "This is an attention check. Please select ‘strongly agree’ to pass this check. You will not be compensated if you fail this check."
failed <- failed_attention_check(df = analysis, question = attention_question)

# create the approve column
clean_batch <- create_approve_col(batch, keep = keep, fail = failed)

# create the reject column
clean_reject_batch <- create_reject_col(clean_batch, keep = keep, fail = failed)

# tests
test_that("the approve column exists", {
  expect_true("Reject" %in% colnames(clean_batch))
})

test_that("The Reject column contains the correct contents", {
  expect_true("MTurk code does not match." %in% clean_reject_batch$Reject)
  expect_true("" %in% clean_reject_batch$Reject)
})
