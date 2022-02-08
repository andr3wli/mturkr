# create the keep and the failed attention check vectors needed for this function
keep <- discard_list(df1 = batch, df2 = mturk)
attention_question <- "This is an attention check. Please select ‘strongly agree’ to pass this check. You will not be compensated if you fail this check."
failed <- failed_attention_check(df = analysis, question = attention_question)

# create the approve column
clean_batch <- create_approve_col(batch, keep = keep, fail = failed)

# test
test_that("the approve column exists", {
  expect_true("Approve" %in% colnames(clean_batch))
})

test_that("The approve column only contains space or x values", {
  expect_equal(unique(clean_batch$Approve), c("X", ""))
  expect_equal(length(which(clean_batch$Approve == "X")), 97)
  expect_equal(length(which(clean_batch$Approve == "")), 2)
})
