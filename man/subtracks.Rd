% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/subtracks.R
\name{subtracks}
\alias{subtracks}
\title{Decompose Track(s) into Subtracks}
\usage{
subtracks(x, i, overlap = i - 1)
}
\arguments{
\item{x}{a single track or a \code{tracks} object.}

\item{i}{subtrack length. A single integer, lists are not supported.}

\item{overlap}{the number of segments in which each subtrack shall overlap
with the previous and next subtrack. The default \code{i - 1} returns all
subtracks. Can be negative, which means that space will be left between
subtracks.}
}
\value{
A \emph{tracks} object is returned which contains all the subtracks
of any track in the input \emph{tracks} object that consist of exactly `i`
segments and overlap adjacent subtracks in `overlap` segments.
}
\description{
Creates a \emph{tracks} object consisting of all subtracks of `x`
with `i` segments (i.e., `i`+1 positions).
}
\details{
The output is always a single \emph{tracks} object, which is
convenient for many common analyses. If subtracks are to be considered separately
for each track, use the function \code{\link{staggered}} together with
\code{lapply}. Subtrack extraction always starts at the first position of the
input track.
}
\seealso{
\code{\link{prefixes}} to extract all subtracks of a given length starting
from the first coordinate in each track, \code{\link{subtracksByTime}} to extract
all subtracks of a given length  starting at some fixed timepoint,
and \code{\link{selectSteps}} to extract single steps starting at a fixed timepoint
from a subset of trackids.
}
