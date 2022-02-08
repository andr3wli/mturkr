#' Create a vector with all the participants that failed the attention check
#'
#' @param df data frame with the attention check question
#' @param question the attention check question as a string
#'
#' @return a vector of all the participants that failed the attention check
#' @export
#'
#' @examples
#' attention_question <- "This is an attention check"
#' failed_attention_check <- (petition_data, attention_question)
failed_attention_check <- function(df, question) {

  failed_vector <- df |>
    dplyr::filter(Question == question & Rawresponse !=5) |>
    dplyr::pull(MTurk)
  return(failed_vector)
}
