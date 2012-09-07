\name{qfacet_text}
\alias{qfacet_text}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
qfacet_text(ggplot2.object, x.coord = NULL, y.coord = NULL, labels = NULL, parse = FALSE, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{ggplot2.object}{
%%     ~~Describe \code{ggplot2.object} here~~
}
  \item{x.coord}{
%%     ~~Describe \code{x.coord} here~~
}
  \item{y.coord}{
%%     ~~Describe \code{y.coord} here~~
}
  \item{labels}{
%%     ~~Describe \code{labels} here~~
}
  \item{parse}{
%%     ~~Describe \code{parse} here~~
}
  \item{\dots}{
%%     ~~Describe \code{\dots} here~~
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (ggplot2.object, x.coord = NULL, y.coord = NULL, labels = NULL, 
    parse = FALSE, ...) 
{
    dat <- ggplot2.object$data
    rows <- ggplot2.object$facet[[1]][[1]]
    cols <- ggplot2.object$facet[[2]][[1]]
    fcol <- dat[, as.character(cols)]
    frow <- dat[, as.character(rows)]
    len <- length(levels(fcol)) * length(levels(frow))
    vars <- data.frame(expand.grid(levels(frow), levels(fcol)))
    colnames(vars) <- c(as.character(rows), as.character(cols))
    if (any(class(ggplot2.object) \%in\% c("ggplot", "gg"))) {
        if (is.null(labels)) {
            labels <- LETTERS[1:len]
        }
        if (length(x.coord) == 1) {
            x.coord <- rep(x.coord, len)
        }
        if (length(y.coord) == 1) {
            y.coord <- rep(y.coord, len)
        }
        text.df <- data.frame(x = x.coord, y = y.coord, vars, 
            labs = labels)
    }
    else {
        if (class(ggplot2.object) == "qfacet") {
            text.df <- ggplot2.object$dat
            if (!is.null(x.coord)) {
                text.df$x.coord <- x.coord
            }
            if (!is.null(y.coord)) {
                text.df$y.coord <- y.coord
            }
            if (!is.null(labels)) {
                text.df$labs <- labels
            }
            ggplot2.object <- ggplot2.object$original
        }
    }
    p <- ggplot2.object + geom_text(aes(x, y, label = labs, group = NULL), 
        data = text.df, parse = parse, ...)
    print(p)
    v <- list(original = ggplot2.object, new = p, dat = text.df)
    class(v) <- "qfacet"
    invisible(v)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
