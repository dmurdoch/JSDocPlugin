.onLoad <- function(libname, pkgname) {
  if (is.null(getOption("JSDoc.tags")))
    options(JSDoc.tags = c("@memberof ?", "@returns { ? }"))
}
