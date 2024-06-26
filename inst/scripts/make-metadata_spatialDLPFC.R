library("here")
library("sessioninfo")


outdir <- "spatialLIBD_files"
pkgname <- "spatialLIBD"


meta <- data.frame(
    Title = c(
        "spatialDLPFC_Visium_spe",
        "spatialDLPFC_Visium_pseudobulk_spe",
        "spatialDLPFC_Visium_modeling_results",
        "spatialDLPFC_Visium_SPG",
        "spatialDLPFC_snRNAseq"
    ),
    Description = c(
        "SpatialExperiment object at the spot-level for the spatialDLPFC human brain (DLPFC) spatial transcriptomics data (n = 30) from the Visium platform from 10x Genomics generated by the Lieber Institute for Brain Development (LIBD) and available through the spatialLIBD Bioconductor package.",
        "Pseudo-bulked SingleCellExperiment object (SpatialExperiment object without spatial data) at the Sp09D spatial domain resolution for the spatialDLPFC human brain (DLPFC) spatial transcriptomics data (n = 30) from the Visium platform from 10x Genomics generated by the Lieber Institute for Brain Development (LIBD) and available through the spatialLIBD Bioconductor package.",
        "List of modeling results at the Sp09D spatial domain resolution for the spatialDLPFC human brain (DLPFC) spatial transcriptomics data (n = 30) from the Visium platform from 10x Genomics generated by the Lieber Institute for Brain Development (LIBD) and available through the spatialLIBD Bioconductor package.",
        "SpatialExperiment object at the spot-level for the spatialDLPFC human brain (DLPFC) spatial transcriptomics data (n = 4) from the Visium Spatial Proteogenomics (Visium-SPG) platform from 10x Genomics generated by the Lieber Institute for Brain Development (LIBD) and available through the spatialLIBD Bioconductor package.",
        "SingleCellExperiment object for the spatialDLPFC human brain (DLPFC) single nucleus transcriptomics data (snRNA-seq, n = 19) from the Chromium platform from 10x Genomics generated by the Lieber Institute for Brain Development (LIBD) and available through the spatialLIBD Bioconductor package."
    ),
    BiocVersion = "3.17",
    Genome = "GRCh38",
    SourceType = "GTF",
    SourceUrl = "https://bioconductor.org/packages/spatialLIBD",
    SourceVersion = "Feb 13 2022",
    Species = "Homo sapiens",
    TaxonomyId = 9606,
    Coordinate_1_based = TRUE,
    DataProvider = "LIBD",
    Maintainer = "Leonardo Collado-Torres <lcolladotor@gmail.com>",
    RDataClass = c(
        "SpatialExperiment",
        "SpatialExperiment",
        "list",
        "SpatialExperiment",
        "SingleCellExperiment"
    ),
    DispatchClass = c("Rds", "Rds", "Rda", "Rds", "Rds"),
    RDataPath = file.path(
        pkgname,
        outdir,
        c(
            "spe_filtered_final_with_clusters_and_deconvolution_results.rds",
            "sce_pseudo_BayesSpace_k09.rds",
            "modeling_results_BayesSpace_k09.Rdata",
            "spe.rds",
            "TBD.rds"
        )
    ),
    Tags = "spatialDLPFC_Visium_VisiumSPG_snRNAseq_spatialLIBD",
    row.names = NULL,
    stringsAsFactors = FALSE
)

write.csv(
    meta,
    file = here::here("inst", "extdata", "metadata_spatialDLPFC.csv"),
    row.names = FALSE
)

## Check
if (FALSE) {
    AnnotationHubData::makeAnnotationHubMetadata(here::here(), fileName = "metadata_spatialDLPFC.csv")
}

## Reproducibility information
print("Reproducibility information:")
Sys.time()
proc.time()
options(width = 120)
session_info()

# ─ Session info ───────────────────────────────────────────────────────────────────────────────────────────────────────
#  setting  value
#  version  R version 4.2.2 (2022-10-31)
#  os       macOS Ventura 13.0.1
#  system   aarch64, darwin20
#  ui       RStudio
#  language (EN)
#  collate  en_US.UTF-8
#  ctype    en_US.UTF-8
#  tz       America/Mexico_City
#  date     2023-02-13
#  rstudio  2022.12.0+353 Elsbeth Geranium (desktop)
#  pandoc   2.19.2 @ /Applications/RStudio.app/Contents/Resources/app/quarto/bin/tools/ (via rmarkdown)
#
# ─ Packages ───────────────────────────────────────────────────────────────────────────────────────────────────────────
#  package                * version   date (UTC) lib source
#  AnnotationDbi            1.60.0    2022-11-01 [1] Bioconductor
#  AnnotationForge          1.40.0    2022-11-01 [1] Bioconductor
#  AnnotationHub            3.6.0     2022-11-01 [1] Bioconductor
#  AnnotationHubData        1.28.0    2022-11-01 [1] Bioconductor
#  assertthat               0.2.1     2019-03-21 [1] CRAN (R 4.2.0)
#  Biobase                  2.58.0    2022-11-01 [1] Bioconductor
#  BiocCheck                1.34.2    2022-11-20 [1] Bioconductor
#  BiocFileCache            2.6.0     2022-11-01 [1] Bioconductor
#  BiocGenerics             0.44.0    2022-11-01 [1] Bioconductor
#  BiocIO                   1.8.0     2022-11-01 [1] Bioconductor
#  BiocManager              1.30.19   2022-10-25 [1] CRAN (R 4.2.0)
#  BiocParallel             1.32.5    2022-12-25 [1] Bioconductor
#  BiocVersion              3.16.0    2022-09-20 [1] Bioconductor
#  biocViews                1.66.2    2022-12-25 [1] Bioconductor
#  biomaRt                  2.54.0    2022-11-01 [1] Bioconductor
#  Biostrings               2.66.0    2022-11-01 [1] Bioconductor
#  bit                      4.0.5     2022-11-15 [1] CRAN (R 4.2.2)
#  bit64                    4.0.5     2020-08-30 [1] CRAN (R 4.2.0)
#  bitops                   1.0-7     2021-04-24 [1] CRAN (R 4.2.0)
#  blob                     1.2.3     2022-04-10 [1] CRAN (R 4.2.0)
#  brio                     1.1.3     2021-11-30 [1] CRAN (R 4.2.0)
#  cachem                   1.0.6     2021-08-19 [1] CRAN (R 4.2.0)
#  callr                    3.7.3     2022-11-02 [1] CRAN (R 4.2.2)
#  cli                      3.6.0     2023-01-09 [1] CRAN (R 4.2.0)
#  codetools                0.2-19    2023-02-01 [1] CRAN (R 4.2.0)
#  colorout                 1.2-2     2022-03-01 [1] Github (jalvesaq/colorout@79931fd)
#  crayon                   1.5.2     2022-09-29 [1] CRAN (R 4.2.0)
#  curl                     5.0.0     2023-01-12 [1] CRAN (R 4.2.0)
#  data.table               1.14.6    2022-11-16 [1] CRAN (R 4.2.0)
#  DBI                      1.1.3     2022-06-18 [1] CRAN (R 4.2.0)
#  dbplyr                   2.3.0     2023-01-16 [1] CRAN (R 4.2.0)
#  DelayedArray             0.24.0    2022-11-01 [1] Bioconductor
#  devtools               * 2.4.5     2022-10-11 [1] CRAN (R 4.2.0)
#  digest                   0.6.31    2022-12-11 [1] CRAN (R 4.2.0)
#  dplyr                    1.1.0     2023-01-29 [1] CRAN (R 4.2.0)
#  ellipsis                 0.3.2     2021-04-29 [1] CRAN (R 4.2.0)
#  evaluate                 0.20      2023-01-17 [1] CRAN (R 4.2.0)
#  fansi                    1.0.4     2023-01-22 [1] CRAN (R 4.2.0)
#  fastmap                  1.1.0     2021-01-25 [1] CRAN (R 4.2.0)
#  filelock                 1.0.2     2018-10-05 [1] CRAN (R 4.2.0)
#  formatR                  1.14      2023-01-17 [1] CRAN (R 4.2.0)
#  fs                       1.6.0     2023-01-23 [1] CRAN (R 4.2.0)
#  futile.logger          * 1.4.3     2016-07-10 [1] CRAN (R 4.2.0)
#  futile.options           1.0.1     2018-04-20 [1] CRAN (R 4.2.0)
#  generics                 0.1.3     2022-07-05 [1] CRAN (R 4.2.0)
#  GenomeInfoDb             1.34.9    2023-02-02 [1] Bioconductor
#  GenomeInfoDbData         1.2.9     2022-11-02 [1] Bioconductor
#  GenomicAlignments        1.34.0    2022-11-01 [1] Bioconductor
#  GenomicFeatures          1.50.4    2023-01-25 [1] Bioconductor
#  GenomicRanges            1.50.2    2022-12-18 [1] Bioconductor
#  glue                     1.6.2     2022-02-24 [1] CRAN (R 4.2.0)
#  graph                    1.76.0    2022-11-01 [1] Bioconductor
#  here                   * 1.0.1     2020-12-13 [1] CRAN (R 4.2.0)
#  hms                      1.1.2     2022-08-19 [1] CRAN (R 4.2.0)
#  htmltools                0.5.4     2022-12-07 [1] CRAN (R 4.2.0)
#  htmlwidgets              1.6.1     2023-01-07 [1] CRAN (R 4.2.0)
#  httpuv                   1.6.8     2023-01-12 [1] CRAN (R 4.2.0)
#  httr                     1.4.4     2022-08-17 [1] CRAN (R 4.2.0)
#  interactiveDisplayBase   1.36.0    2022-11-01 [1] Bioconductor
#  IRanges                  2.32.0    2022-11-01 [1] Bioconductor
#  jsonlite                 1.8.4     2022-12-06 [1] CRAN (R 4.2.0)
#  KEGGREST                 1.38.0    2022-11-01 [1] Bioconductor
#  knitr                    1.42      2023-01-25 [1] CRAN (R 4.2.0)
#  lambda.r                 1.2.4     2019-09-18 [1] CRAN (R 4.2.0)
#  later                    1.3.0     2021-08-18 [1] CRAN (R 4.2.0)
#  lattice                  0.20-45   2021-09-22 [1] CRAN (R 4.2.2)
#  lifecycle                1.0.3     2022-10-07 [1] CRAN (R 4.2.1)
#  lubridate                1.9.1     2023-01-24 [1] CRAN (R 4.2.0)
#  magrittr                 2.0.3     2022-03-30 [1] CRAN (R 4.2.0)
#  Matrix                   1.5-3     2022-11-11 [1] CRAN (R 4.2.0)
#  MatrixGenerics           1.10.0    2022-11-01 [1] Bioconductor
#  matrixStats              0.63.0    2022-11-18 [1] CRAN (R 4.2.0)
#  memoise                  2.0.1     2021-11-26 [1] CRAN (R 4.2.0)
#  mime                     0.12      2021-09-28 [1] CRAN (R 4.2.0)
#  miniUI                   0.1.1.1   2018-05-18 [1] CRAN (R 4.2.0)
#  OrganismDbi              1.40.0    2022-11-01 [1] Bioconductor
#  pillar                   1.8.1     2022-08-19 [1] CRAN (R 4.2.0)
#  pkgbuild                 1.4.0     2022-11-27 [1] CRAN (R 4.2.2)
#  pkgconfig                2.0.3     2019-09-22 [1] CRAN (R 4.2.0)
#  pkgload                  1.3.2     2022-11-16 [1] CRAN (R 4.2.2)
#  png                      0.1-8     2022-11-29 [1] CRAN (R 4.2.0)
#  prettyunits              1.1.1     2020-01-24 [1] CRAN (R 4.2.0)
#  processx                 3.8.0     2022-10-26 [1] CRAN (R 4.2.0)
#  profvis                  0.3.7     2020-11-02 [1] CRAN (R 4.2.0)
#  progress                 1.2.2     2019-05-16 [1] CRAN (R 4.2.0)
#  promises                 1.2.0.1   2021-02-11 [1] CRAN (R 4.2.0)
#  prompt                   1.0.1     2022-03-01 [1] Github (gaborcsardi/prompt@7ef0f2e)
#  ps                       1.7.2     2022-10-26 [1] CRAN (R 4.2.0)
#  purrr                    1.0.1     2023-01-10 [1] CRAN (R 4.2.0)
#  R6                       2.5.1     2021-08-19 [1] CRAN (R 4.2.0)
#  rappdirs                 0.3.3     2021-01-31 [1] CRAN (R 4.2.0)
#  RBGL                     1.74.0    2022-11-01 [1] Bioconductor
#  Rcpp                     1.0.10    2023-01-22 [1] CRAN (R 4.2.0)
#  RCurl                    1.98-1.10 2023-01-27 [1] CRAN (R 4.2.0)
#  remotes                  2.4.2     2021-11-30 [1] CRAN (R 4.2.0)
#  restfulr                 0.0.15    2022-06-16 [1] CRAN (R 4.2.0)
#  rjson                    0.2.21    2022-01-09 [1] CRAN (R 4.2.0)
#  rlang                    1.0.6     2022-09-24 [1] CRAN (R 4.2.0)
#  rmarkdown                2.20      2023-01-19 [1] CRAN (R 4.2.0)
#  rprojroot                2.0.3     2022-04-02 [1] CRAN (R 4.2.0)
#  Rsamtools                2.14.0    2022-11-01 [1] Bioconductor
#  RSQLite                  2.2.20    2022-12-22 [1] CRAN (R 4.2.2)
#  rsthemes                 0.3.1     2022-03-01 [1] Github (gadenbuie/rsthemes@bbe73ca)
#  rstudioapi               0.14      2022-08-22 [1] CRAN (R 4.2.0)
#  rtracklayer              1.58.0    2022-11-01 [1] Bioconductor
#  RUnit                    0.4.32    2018-05-18 [1] CRAN (R 4.2.0)
#  S4Vectors                0.36.1    2022-12-07 [1] Bioconductor
#  sessioninfo            * 1.2.2     2021-12-06 [1] CRAN (R 4.2.0)
#  shiny                    1.7.4     2022-12-15 [1] CRAN (R 4.2.2)
#  stringdist               0.9.10    2022-11-07 [1] CRAN (R 4.2.0)
#  stringi                  1.7.12    2023-01-11 [1] CRAN (R 4.2.0)
#  stringr                  1.5.0     2022-12-02 [1] CRAN (R 4.2.0)
#  SummarizedExperiment     1.28.0    2022-11-01 [1] Bioconductor
#  suncalc                  0.5.1     2022-09-29 [1] CRAN (R 4.2.0)
#  testthat               * 3.1.6     2022-12-09 [1] CRAN (R 4.2.0)
#  tibble                   3.1.8     2022-07-22 [1] CRAN (R 4.2.1)
#  tidyselect               1.2.0     2022-10-10 [1] CRAN (R 4.2.0)
#  timechange               0.2.0     2023-01-11 [1] CRAN (R 4.2.0)
#  urlchecker               1.0.1     2021-11-30 [1] CRAN (R 4.2.0)
#  usethis                * 2.1.6     2022-05-25 [1] CRAN (R 4.2.0)
#  utf8                     1.2.3     2023-01-31 [1] CRAN (R 4.2.0)
#  vctrs                    0.5.2     2023-01-23 [1] CRAN (R 4.2.0)
#  xfun                     0.37      2023-01-31 [1] CRAN (R 4.2.0)
#  XML                      3.99-0.13 2022-12-04 [1] CRAN (R 4.2.0)
#  xml2                     1.3.3     2021-11-30 [1] CRAN (R 4.2.0)
#  xtable                   1.8-4     2019-04-21 [1] CRAN (R 4.2.0)
#  XVector                  0.38.0    2022-11-01 [1] Bioconductor
#  yaml                     2.3.7     2023-01-23 [1] CRAN (R 4.2.0)
#  zlibbioc                 1.44.0    2022-11-01 [1] Bioconductor
#
#  [1] /Library/Frameworks/R.framework/Versions/4.2-arm64/Resources/library
#
# ──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
