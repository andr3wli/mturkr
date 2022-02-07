#' Update the approve column if keep is in the Answer.surveycode and if the Answer.surverycode is not in the fail vector (failed attention check)
#'
#' @param df the batch data set provided by amazon
#' @param keep the keep character vector that gets returned from the discard_list function
#' @param fail character vector of participants that failed the attention check
#'
#' @return a data frame with the approve column manipulated: will have X is valid, empty character if not
#' @export
#'
#' @examples
#' create_approve_col(batch_data, keep, failed)
create_approve_col <- function(df, keep, fail) {
  df |>
    dplyr::mutate(Approve = dplyr::case_when(Answer.surveycode %in% keep & !(Answer.surveycode %in% fail) ~ "X",
                                             TRUE ~ ""))
}
