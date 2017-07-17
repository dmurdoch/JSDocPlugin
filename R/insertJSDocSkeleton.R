insertJSDocSkeleton <- function(args = getArgList(), tags = getOption("JSDoc.tags"),
                                addWhitespace = TRUE,
                                start = attr(args, "start"),
                                id = attr(args, "id")) {
  if (is.null(start) || is.null(id))
    stop("Need to know where to insert markup.  The Javascript must be in a named file.")
  result <- c(
     "/**",
     " * ?",
     if (!is.null(tags)) paste(" *", tags),
     if (length(args)) paste(" * @param { ? }", args, "- ?"),
     " */")
  if (addWhitespace) {
    ctxt <- rstudioapi::getSourceEditorContext()
    firstline <- ctxt$contents[start[1]]
    whitespace <- sub("^([[:blank:]]*).*", "\\1", firstline)
    result <- paste0(whitespace, result)
  }
  result <- paste(c(result, ""), collapse = "\n")
  start[2] <- 1
  rstudioapi::insertText(location = start, text = result, id = id)
  start[1] <- start[1] + 1
  start[2] <- Inf
  rstudioapi::setCursorPosition(start, id = id)
  invisible(result)
}

insertJSDocAddin <- function() {
  insertJSDocSkeleton()
}
