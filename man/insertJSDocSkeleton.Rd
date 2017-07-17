\name{insertJSDocSkeleton}
\alias{insertJSDocSkeleton}
\title{
Insert JSDoc skeleton into Javascript source file in RStudio
}
\description{
With a Javascript source file open in RStudio, this function
will insert a JSDoc skeleton for the documentation.
}
\usage{
insertJSDocSkeleton(args = getArgList(),
                    tags = getOption("JSDoc.tags"),
                    addWhitespace = TRUE,
                    start = attr(args, "start"),
                    id = attr(args, "id"))
}
\arguments{
  \item{args}{
The arguments that will need documenting.
}
  \item{tags}{
Extra tags (e.g. \code{@memberof}) or other markup to
embed in the generated text.
}
  \item{addWhitespace}{
Should leading whitespace be added, to match the line
containing the function definition?
}
  \item{start}{
Where is the function definition?
}
  \item{id}{
The id of the source file containing the Javascript.
}
}
\value{
Mainly called for the side effect of inserting the
markup comments, but does return the insertion invisibly.
}
\details{
If an option named \code{"JSDoc.memberof"} is set using the
\code{\link{options}} function, it will be inserted
as the \code{@memberof} tag when the skeleton is created.

If no such option is present when this package is loaded, it
will be initialized to \code{c("@memberof ?", "@returns { ? }")}.
}
