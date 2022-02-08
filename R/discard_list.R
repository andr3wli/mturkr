#' Create a list with participant numbers that are both in the batch data set and the mturk data set
#'
#' @param df1 the batch data set provided by amazon
#' @param df2 the mturk data set that we created locally
#'
#' @return a character vector
#' @export
#'
#' @examples
#' discard_list(batch_data, mturk_data)
discard_list <- function(df1, df2) {
  keep <- vector("character", nrow(df1))

  for (i in df1$Answer.surveycode) {
    for (j in df2$Code) {
      ps <- i
      if(i %in% j) {
        keep[[i]] <- ps
      }
    }
  }
  return(keep)
}
