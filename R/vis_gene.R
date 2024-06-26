#' Sample spatial gene visualization
#'
#' This function visualizes the gene expression stored in `assays(spe)` or any
#' continuous variable stored in `colData(spe)` for one given sample at the
#' spot-level using (by default) the histology information on the background.
#' To visualize clusters (or any discrete variable) use [vis_clus()].
#'
#' @inheritParams vis_clus
#' @param geneid A `character(1)` specifying the gene ID stored in
#' `rowData(spe)$gene_search` or a continuous variable stored in `colData(spe)`
#' to visualize. If `rowData(spe)$gene_search` is missing, then `rownames(spe)`
#' is used to search for the gene ID.
#' @param assayname The name of the `assays(spe)` to use for extracting the
#' gene expression data. Defaults to `logcounts`.
#' @param minCount A `numeric(1)` specifying the minimum gene expression (or
#' value in the continuous variable) to visualize. Values at or below this
#' threshold will be set to `NA`. Defaults to `0`.
#' @param viridis A `logical(1)` whether to use the color-blind friendly
#' palette from [viridis][viridisLite::viridis()] or the color palette used
#' in the paper that was chosen for contrast when visualizing the data on
#' top of the histology image. One issue is being able to differentiate low
#' values from NA ones due to the purple-ish histology information that is
#' dependent on cell density.
#' @param cont_colors A `character()` vector of colors that supersedes the
#' `viridis` argument.
#' @param na_color A `character(1)` specifying a color for the NA values.
#' If you set `alpha = NA` then it's best to set `na_color` to a color that has
#' alpha blending already, which will make non-NA values pop up more and the NA
#' values will show with a lighter color. This behavior is lost when `alpha` is
#' set to a non-`NA` value.
#'
#' @return A [ggplot2][ggplot2::ggplot] object.
#' @export
#' @importFrom SummarizedExperiment assays
#' @importFrom SpatialExperiment spatialCoords
#' @family Spatial gene visualization functions
#' @details This function subsets `spe` to the given sample and prepares the
#' data and title for [vis_gene_p()]. It also adds a caption to the plot.
#'
#' @examples
#'
#' if (enough_ram()) {
#'     ## Obtain the necessary data
#'     if (!exists("spe")) spe <- fetch_data("spe")
#'
#'     ## Valid `geneid` values are those in
#'     head(rowData(spe)$gene_search)
#'     ## or continuous variables stored in colData(spe)
#'     ## or rownames(spe)
#'
#'     ## Visualize a default gene on the non-viridis scale
#'     p1 <- vis_gene(
#'         spe = spe,
#'         sampleid = "151507",
#'         viridis = FALSE
#'     )
#'     print(p1)
#'
#'     ## Use a custom set of colors in the reverse order than usual
#'     p2 <- vis_gene(
#'         spe = spe,
#'         sampleid = "151507",
#'         cont_colors = rev(viridisLite::viridis(21, option = "magma"))
#'     )
#'     print(p2)
#'
#'     ## Turn the alpha to 1, which makes the NA values have a full alpha
#'     p2b <- vis_gene(
#'         spe = spe,
#'         sampleid = "151507",
#'         cont_colors = rev(viridisLite::viridis(21, option = "magma")),
#'         alpha = 1
#'     )
#'     print(p2b)
#'
#'     ## Turn the alpha to NA, and use an alpha-blended "forestgreen" for
#'     ## the NA values
#'     # https://gist.githubusercontent.com/mages/5339689/raw/2aaa482dfbbecbfcb726525a3d81661f9d802a8e/add.alpha.R
#'     # add.alpha("forestgreen", 0.5)
#'     p2c <- vis_gene(
#'         spe = spe,
#'         sampleid = "151507",
#'         cont_colors = rev(viridisLite::viridis(21, option = "magma")),
#'         alpha = NA,
#'         na_color = "#228B2280"
#'     )
#'     print(p2c)
#'
#'     ## Visualize a continuous variable, in this case, the ratio of chrM
#'     ## gene expression compared to the total expression at the spot-level
#'     p3 <- vis_gene(
#'         spe = spe,
#'         sampleid = "151507",
#'         geneid = "expr_chrM_ratio"
#'     )
#'     print(p3)
#'
#'     ## Visualize a gene using the rownames(spe)
#'     p4 <- vis_gene(
#'         spe = spe,
#'         sampleid = "151507",
#'         geneid = rownames(spe)[which(rowData(spe)$gene_name == "MOBP")]
#'     )
#'     print(p4)
#'
#'     ## Repeat without auto-cropping the image
#'     p5 <- vis_gene(
#'         spe = spe,
#'         sampleid = "151507",
#'         geneid = rownames(spe)[which(rowData(spe)$gene_name == "MOBP")],
#'         auto_crop = FALSE
#'     )
#'     print(p5)
#' }
vis_gene <-
    function(
        spe,
        sampleid = unique(spe$sample_id)[1],
        geneid = rowData(spe)$gene_search[1],
        spatial = TRUE,
        assayname = "logcounts",
        minCount = 0,
        viridis = TRUE,
        image_id = "lowres",
        alpha = NA,
        cont_colors = if (viridis) viridisLite::viridis(21) else c("aquamarine4", "springgreen", "goldenrod", "red"),
        point_size = 2,
        auto_crop = TRUE,
        na_color = "#CCCCCC40",
        ...) {
        spe_sub <- spe[, spe$sample_id == sampleid]
        d <- as.data.frame(cbind(colData(spe_sub), SpatialExperiment::spatialCoords(spe_sub)), optional = TRUE)

        if (geneid %in% colnames(colData(spe_sub))) {
            d$COUNT <- colData(spe_sub)[[geneid]]
        } else if (geneid %in% rowData(spe_sub)$gene_search) {
            d$COUNT <-
                assays(spe_sub)[[assayname]][which(rowData(spe_sub)$gene_search == geneid), ]
        } else if (geneid %in% rownames(spe_sub)) {
            d$COUNT <- assays(spe_sub)[[assayname]][which(rownames(spe_sub) == geneid), ]
        } else {
            stop("Could not find the 'geneid' ", geneid, call. = FALSE)
        }
        d$COUNT[d$COUNT <= minCount] <- NA
        p <- vis_gene_p(
            spe = spe_sub,
            d = d,
            sampleid = sampleid,
            spatial = spatial,
            title = paste(
                sampleid,
                geneid,
                ...
            ),
            viridis = viridis,
            image_id = image_id,
            alpha = alpha,
            cont_colors = cont_colors,
            point_size = point_size,
            auto_crop = auto_crop,
            na_color = na_color,
            legend_title = paste0(
                if (!geneid %in% colnames(colData(spe_sub))) {
                    paste0(assayname, "\n")
                } else {
                    NULL
                },
                " min > ", minCount
            )
        )
        return(p)
    }
