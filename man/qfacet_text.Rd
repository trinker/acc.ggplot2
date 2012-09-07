\name{qfacet_text}
\alias{qfacet_text}
\title{Add Text to a Faceted ggplot2 Plot}
\usage{
  qfacet_text(ggplot2.object, x.coord = NULL,
    y.coord = NULL, labels = NULL, ...)
}
\arguments{
  \item{ggplot2.object}{a faceted ggplot2 object or an
  object returned from qfacet_text}

  \item{x.coord}{a single x coordinate to be repeated or a
  vector of x coordinates equal to the number of facets}

  \item{y.coord}{a single y coordinate to be repeated or a
  vector of y coordinates equal to the number of facets}

  \item{labels}{a vector of labels to place on each facet}

  \item{\ldots}{additional arguments accepted by geom_text}
}
\value{
  Returns a plot of class "gg" "ggplot" with annotations.
  Also invisibly returns a list object of the class qfacet
  with the following items: \item{original } {the Original
  ggplot2 object} \item{new } {the new ggplot object}
  \item{dat } {the mini data frame created for the text}
}
\description{
  A ggplot2 wrapper for adding text to facets
}
\examples{
#alter mtcars to make some variables factors
 mtcars[, c("cyl", "am", "gear")] <- lapply(mtcars[,
     c("cyl", "am", "gear")], as.factor)

 p <- ggplot(mtcars, aes(mpg, wt, group = cyl)) +
     geom_line(aes(color=cyl)) +
     geom_point(aes(shape=cyl)) +
     facet_grid(gear ~ am) +
     theme_bw()

 z <- qfacet_text(ggplot2.object = p, x.coor = 33, y.coor = 2.2,
     labels = 1:6, color="red")
 #approach 1 (alter the text data frame and pass the qfacet object)
 z$dat[5, 1:2] <- c(15, 5)
 qfacet_text(z, color="red")

 #approach 2 (alter the original ggplot object)
 qfacet_text(p, x = c(33, 33, 33, 33, 15, 33),
     y = c(2.2, 2.2, 2.2, 2.2, 5, 2.2), 1:6, color="red")

 #all the same things you can pass to geom_text qfacet_text takes
 qfacet_text(z, labels = paste("beta ==", 1:6),
     size = 3, color = "grey50", parse = TRUE)
}
\seealso{
  \code{\link[ggplot2]{geom_text}}
}
\keyword{facet}
\keyword{ggplot2}
\keyword{text}

