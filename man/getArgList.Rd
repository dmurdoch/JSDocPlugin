\name{getArgList}
\alias{getArgList}
\title{
Get argument list for next function in Javascript source.
}
\description{
This looks through the \code{text} (by default current source
in the RStudio editor) for the next function header, and
extracts the argument names.
}
\usage{
getArgList(text = getSource(), start = attr(text, "start"), id = attr(text, "id"))
}
\arguments{
  \item{text}{
Javascript source code, perhaps with \code{"start"} and \code{"file"} attributes
to indicate its starting location in a file.
}
  \item{start}{
Where is the function definition?
}
  \item{id}{
The id of the source file containing the Javascript.
}
}
\value{
A character vector containing all of the argument names for
the first function found in the text.  The vector has an
attribute \code{"start"} indicating where the \code{function}
keyword was found for the function header.  If the
text had such an attribute, the location is relative to the
original file; otherwise, just within the current text.
}
\note{Currently default values for parameters are ignored.}
\examples{
getArgList("function(a, b = 3)")
}
