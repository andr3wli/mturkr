#' To check whether or not the batch code provided by Amazon matches with the mturk code we provided to them
#'
#' @param df1 the batch data set provided by amazon
#' @param df2 the muturk data set that we created
#' @param df2 the data to be analyzed - must contain the attention check question
#' @param attention_check the attention check question - should be a string
#'
#' @return
#' @export
#'
#' @examples
#' # create variables for the data path and the attention question
#' batch_df <- readr::read_csv("data/exp6/Batch_4646160_batch_results.csv")
#' mturk_df <- readr::read_csv("data/exp6/mturkcode.csv")
#' analysis_df <- readr::read_csv("data/exp6/petition.csv")
#'
#' attention_question <- "This is an attention check. Please select ‘strongly agree’ to pass this check. You will not be compensated if you fail this check."
#'
#' clean_batch_data <- mturkr(df1 = batch_df, df2 = mturk_df, df3 = analysis_df, attention_check = attention_question)
#'
#' # save the data file
#' readr::write_csv(clean_batch_data, file = here::here("output", "batch_data.csv"))
mturkr <- function(df1, df2, df2, attention_check) {

  # read in the data sets
  batch_data <- df1
  mturk_data <- df2
  analysis_data <- df3

  # this is to see if the batch code matches the code that the participants provided
  keep <- discard_list(batch_data, mturk_data)

  # this is for the attention check
  attention_question <- attention_check
  failed <- failed_attention_check(analysis_data, attention_question)

  # Create the approve column based the keep and the failed variables
  clean_batch <- create_approve_col(batch_data, keep, failed)

  # Create the reject column based on the failed attention checks and the mismatch batch code
  clean_batch <- create_reject_col(clean_batch, keep, failed)

  return(clean_batch)
}
