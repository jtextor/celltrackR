% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cluster-functions.R
\name{trackFeatureMap}
\alias{trackFeatureMap}
\title{Dimensionality Reduction on Track Features}
\usage{
trackFeatureMap(tracks, measures, scale = TRUE, labels = NULL,
  method = "PCA", return.mapping = FALSE, ...)
}
\arguments{
\item{tracks}{the tracks that are to be clustered.}

\item{measures}{a function, or a vector of functions (see \link{TrackMeasures}).
Each function is expected to
return a single number given a single track.}

\item{scale}{logical indicating whether the measures values shall be scaled
using the function \code{\link[base]{scale}} before the mapping is performed.}

\item{labels}{optional: a vector of labels of the same length as the track object.
These are used to color points in the visualization.}

\item{method}{\code{"PCA"} for a
scatterplot along principal components, \code{"MDS"} for multidimensional scaling,
\code{"UMAP"} for a UMAP. Note that for
\code{"UMAP"}, the \code{uwot} package must be installed.}

\item{return.mapping}{logical: return the mapping object instead of only the plot?
(defaults to \code{FALSE}).}

\item{...}{additional parameters to be passed to the corresponding
function: \code{\link[stats]{prcomp}} (for \code{method="PCA"}),
  \code{\link[stats]{cmdscale}} (for \code{method="MDS"}),
  or  \code{\link[umap]{umap}} (for \code{method="UMAP"}).}
}
\value{
By default, only returns a plot. If \code{return.clust=TRUE}, also returns
a clustering object as returned by \code{\link[stats]{hclust}},  \code{\link[stats]{kmeans}},
 \code{\link[stats]{prcomp}} (returns \code{$x}), \code{\link[stats]{cmdscale}},
  or  \code{\link[uwot]{umap}} (returns \code{$layout}). See the documentation of those functions for details on the
  output object.
}
\description{
Perform a quick dimensionality reduction visualization of a set of tracks according to a given vector
of track measures.
}
\details{
The measures are applied to each of the tracks in the given
\emph{tracks} object. According to the resulting values, the tracks are
mapped to fewer dimensions using the chosen method.
If \code{scale} is \code{TRUE}, the measure values are scaled to mean value
\eqn{0} and standard deviation \eqn{1} (per measure) before the mapping.

The dimensionality reduction methods PCA, MDS, and UMAP each produce a
scatterplot of all tracks as points, plotted along the principal component
axes generated by the corresponding method.
}
\examples{
## Map tracks according to speed, mean turning angle, straightness, and asphericity
## using multidimensional scaling, and store output.

cells <- c(TCells,Neutrophils)
real.celltype <- rep(c("T","N"),c(length(TCells),length(Neutrophils)))
## Prefix each track ID with its cell class to evaluate the clustering visually
names(cells) <- paste0(real.celltype,seq_along(cells))
map <- trackFeatureMap( cells, c(speed,meanTurningAngle,straightness, asphericity),
 method = "MDS",  return.mapping = TRUE  )

}
\seealso{
\code{\link{getFeatureMatrix}} to obtain a feature matrix that can be
used for manual clustering and plotting, and \code{\link{clusterTracks}} to
perform hierarchical or k-means clustering on a tracks dataset.
}
