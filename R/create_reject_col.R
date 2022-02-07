#' Update the Reject column based on the approve column
#'
#' @param df the batch data frame provided from the create_approve_col() function
#' @param keep The keep character that gets returned from the discard_list function
#' @param fail character vector of participants that failed the attention check
#'
#' @return a data frame with the reject column that has been updated" it will inform that they either failed the attention check or that the mturk code does not match.
#' If both are not the case then participants will be comnpensated and the reponse coloum willl have an epmty string
#'
#' @export
#'
#' @examples
#' create_reject_col(batch_data, keep, fail)
create_reject_col <- function(df, keep, fail) {
  df |>
    dplyr::mutate(Reject = dplyr::case_when(Approve == "" & !(Answer.surveycode %in% keep) ~ "MTurk code does not match.",
                                            Approve == "" & Answer.surveycode %in% fail ~ "Failed the attention check.",
                                            TRUE ~ ""))
}
