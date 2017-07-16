\name{insertJSDocAddin}
\alias{insertJSDocAddin}
\title{
RStudio add-in function
}
\description{
This function is not normally called by users; it is detected
by RStudio when the package is used, and the add-in is installed
into the Tools menu.
}
\usage{
insertJSDocAddin()
}
\details{
Calls \code{\link{insertJSDocSkeleton}} with default parameters.

Use the \dQuote{Tools | Addins | Browse Addins... | Keyboard Shortcuts} menu
to set a shortcut to add a keyboard shortcut to "Insert JSDoc Skeleton" if desired.
}
\value{
Same as \code{\link{insertJSDocSkeleton}}.
}
