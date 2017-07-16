getSource <- function(len = 100) {
  ctxt <- rstudioapi::getSourceEditorContext()
  if (length(ctxt$selection) > 1)
    stop("Can only handle one selection at a time.")
  text <- ctxt$selection[[1]]$text
  start <- ctxt$selection[[1]]$range$start
  if (!nchar(text)) {
    text <- ctxt$contents[start[1]:min(length(ctxt$contents), start[1] + len - 1)]
    text[1] <- substr(text[1], start[2], nchar(text[1]))
  }
  structure(text, start = start)
}
