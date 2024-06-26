#' Spatial registration: wrapper function
#'
#' This function is provided for convenience. It runs all the functions
#' required for computing the `modeling_results`. This can be useful for
#' finding marker genes on a new spatially-resolved transcriptomics dataset
#' and thus using it for `run_app()`. The results from this function can also be
#' used for performing spatial registration through `layer_stat_cor()` and
#' related functions of sc/snRNA-seq datasets.
#'
#' We chose a default of `min_ncells = 10` based on OSCA from section 4.3
#' at
#' <http://bioconductor.org/books/3.15/OSCA.multisample/multi-sample-comparisons.html>.
#' They cite <https://doi.org/10.1038/s41467-020-19894-4> as the paper where
#' they came up with the definition of "very low" being 10. You might want
#' to use `registration_pseudobulk()` and manually explore `sce_pseudo$ncells`
#' to choose the best cutoff.
#'
#'
#' @inheritParams registration_pseudobulk
#' @inheritParams registration_stats_enrichment
#' @inheritParams registration_stats_anova
#'
#' @return A `list()` of `data.frame()` with the statistical results. This is
#' similar to `fetch_data("modeling_results")`.
#' @export
#' @family spatial registration and statistical modeling functions
#'
#' @examples
#' ## Ensure reproducibility of example data
#' set.seed(20220907)
#'
#' ## Generate example data
#' sce <- scuttle::mockSCE()
#'
#' ## Add some sample IDs
#' sce$sample_id <- sample(LETTERS[1:5], ncol(sce), replace = TRUE)
#'
#' ## Add a sample-level covariate: age
#' ages <- rnorm(5, mean = 20, sd = 4)
#' names(ages) <- LETTERS[1:5]
#' sce$age <- ages[sce$sample_id]
#'
#' ## Add gene-level information
#' rowData(sce)$ensembl <- paste0("ENSG", seq_len(nrow(sce)))
#' rowData(sce)$gene_name <- paste0("gene", seq_len(nrow(sce)))
#'
#' ## Compute all modeling results
#' example_modeling_results <- registration_wrapper(
#'     sce,
#'     "Cell_Cycle", "sample_id", c("age"), "ensembl", "gene_name", "wrapper"
#' )
registration_wrapper <-
    function(
        sce,
        var_registration,
        var_sample_id,
        covars = NULL,
        gene_ensembl = NULL,
        gene_name = NULL,
        suffix = "",
        min_ncells = 10,
        pseudobulk_rds_file = NULL) {
        sce_pseudo <-
            registration_pseudobulk(sce,
                var_registration = var_registration,
                var_sample_id = var_sample_id,
                min_ncells = min_ncells,
                pseudobulk_rds_file = pseudobulk_rds_file
            )

        registration_mod <-
            registration_model(sce_pseudo, covars = covars)

        block_cor <-
            registration_block_cor(sce_pseudo, registration_model = registration_mod)

        results_enrichment <-
            registration_stats_enrichment(
                sce_pseudo,
                block_cor = block_cor,
                covars = covars,
                gene_ensembl = gene_ensembl,
                gene_name = gene_name
            )
        results_pairwise <-
            registration_stats_pairwise(
                sce_pseudo,
                registration_model = registration_mod,
                block_cor = block_cor,
                gene_ensembl = gene_ensembl,
                gene_name = gene_name
            )
        results_anova <-
            registration_stats_anova(
                sce_pseudo,
                block_cor = block_cor,
                covars = covars,
                gene_ensembl = gene_ensembl,
                gene_name = gene_name,
                suffix = suffix
            )

        modeling_results <- list(
            "anova" = results_anova,
            "enrichment" = results_enrichment,
            "pairwise" = results_pairwise
        )

        return(modeling_results)
    }
