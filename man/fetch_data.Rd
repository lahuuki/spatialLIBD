% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fetch_data.R
\name{fetch_data}
\alias{fetch_data}
\title{Download the Human DLPFC Visium data from LIBD}
\usage{
fetch_data(
  type = c("sce", "sce_layer", "modeling_results", "sce_example", "spe",
    "spatialDLPFC_Visium", "spatialDLPFC_Visium_pseudobulk",
    "spatialDLPFC_Visium_modeling_results", "spatialDLPFC_Visium_SPG",
    "spatialDLPFC_snRNAseq"),
  destdir = tempdir(),
  eh = ExperimentHub::ExperimentHub(),
  bfc = BiocFileCache::BiocFileCache()
)
}
\arguments{
\item{type}{A \code{character(1)} specifying which file you want to download. It
can either be: \code{sce} for the
\linkS4class{SingleCellExperiment}
object containing the spot-level data that includes the information for
visualizing the clusters/genes on top of the Visium histology, \code{sce_layer}
for the
\linkS4class{SingleCellExperiment}
object containing the layer-level data (pseudo-bulked from the spot-level),
or \code{modeling_results} for the list of tables with the \code{enrichment},
\code{pairwise}, and \code{anova} model results from the layer-level data. It can also
be \code{sce_example} which is a reduced version of \code{sce} just for example
purposes. As of BioC version 3.13 \code{spe} downloads a
\link[SpatialExperiment:SpatialExperiment]{SpatialExperiment-class}  object.
As of version 1.11.6 this function also allows downloading data from the
\url{http://research.libd.org/spatialDLPFC/} project.}

\item{destdir}{The destination directory to where files will be downloaded
to in case the \code{ExperimentHub} resource is not available. If you already
downloaded the files, you can set this to the current path where the files
were previously downloaded to avoid re-downloading them.}

\item{eh}{An \code{ExperimentHub} object
\link[ExperimentHub:ExperimentHub-class]{ExperimentHub-class}.}

\item{bfc}{A \code{BiocFileCache} object
\link[BiocFileCache:BiocFileCache-class]{BiocFileCache-class}. Used when
\code{eh} is not available.}
}
\value{
The requested object: \code{sce}, \code{sce_layer}, \code{ve} or \code{modeling_results} that
you have to assign to an object. If you didn't you can still avoid
re-loading the object by using \code{.Last.value}.
}
\description{
This function downloads from \code{ExperimentHub} the dorsolateral prefrontal
cortex (DLPFC) human Visium data and results analyzed by LIBD. If
\code{ExperimentHub} is not available, it will download the files from Dropbox
using \code{\link[utils:download.file]{utils::download.file()}} unless the files are present already at
\code{destdir}. Note that \code{ExperimentHub} will cache the data and automatically
detect if you have previously downloaded it, thus making it the preferred
way to interact with the data.
}
\details{
The data was initially prepared by scripts at
https://github.com/LieberInstitute/HumanPilot and further refined by
https://github.com/LieberInstitute/spatialLIBD/blob/master/inst/scripts/make-data_spatialLIBD.R.
}
\examples{

## Download the SingleCellExperiment object
## at the layer-level
if (!exists("sce_layer")) sce_layer <- fetch_data("sce_layer")

## Explore the data
sce_layer
}
