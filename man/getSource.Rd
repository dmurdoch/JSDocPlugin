\name{getSource}
\alias{getSource}
\title{
Get current source lines
}
\description{
Gets either the selected text, or up to \code{len} lines
of text from the current cursor position in the RStudio editor.
}
\usage{
getSource(len = 100)
}
\arguments{
  \item{len}{
How many lines to get if none are selected.
}
}
\value{
A character vector containing the text, with attribute
named \code{"start"} holding the starting position of
the section in the source editor.
}

\examples{
if (rstudioapi::isAvailable())
  getSource()
}
