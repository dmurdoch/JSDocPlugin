getArgList = function(text = getSource(),
                      start = attr(text, "start"),
                      id = attr(text, "id")) {
  if (is.null(start))
    start <- rstudioapi::document_position(1,1)
  tokens <- try(js::esprima_tokenize(text, loc = TRUE))
  if (inherits(tokens, "try-error"))
    stop("Failed to get tokens")
  fn <- which(tokens$type == "Keyword" & tokens$value == "function")
  if (!length(fn))
    stop("No function definition found.")
  fn <- fn[1]
  start[1] <- start[1] - 1 + tokens$loc$start$line[fn]
  start[2] <- if (tokens$loc$start$line[fn] == 1)
                start[2] + tokens$loc$start$column[fn]
              else
                tokens$loc$start$column[fn] + 1

  tokens <- tokens[-seq_len(fn),]
  tokens$depth <- cumsum( tokens$type == "Punctuator" & tokens$value %in% c("(", "[") ) -
           cumsum( tokens$type == "Punctuator" & tokens$value %in% c(")", "]") )
  open <- which(tokens$depth > 0)
  if (!length(open))
    stop("No argument list found.")
  open <- open[1]
  tokens <- tokens[-seq_len(open),]

  close <- which(tokens$depth == 0)
  if (!length(close))
    stop("End of argument list not found.")
  close <- close[1]
  tokens <- tokens[-seq.int(close, nrow(tokens)),]

  tokens$varname <- tokens$depth == 1 & tokens$type == "Identifier"
  tokens$comma <- tokens$depth == 1 & tokens$type == "Punctuator" & tokens$value == ","
  argname <- tokens$varname
  drop <- FALSE
  for (i in seq_along(argname)) {
    if (argname[i]) {
      if (drop)
        argname[i] <- FALSE
      else
        drop <- TRUE
    }
    if (tokens$comma[i])
      drop <- FALSE
  }
  structure(tokens$value[argname], start = start, id = id)
}
# function(m = 1 + v)
