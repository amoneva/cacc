#' Situational Clustering Index
#'
#' @description Computes a Situational Clustering Index (SCI) to quantify the magnitude of the clustering of observations among dominant profiles in a `cacc_matrix`.
#'
#' @param cacc_matrix A tibble. The output of the `cacc` function.
#'
#' @return Returns a numeric value.
#'
#' @export
#'
#' @examples
#' cluster_sci(cacc(data = test_data, ivs = c(iv1, iv2, iv3, iv4), dv = dv1))

cluster_sci <- function (cacc_matrix) {

  # Prepare the data frame ----
  cacc_matrix <- cacc_matrix |>
    # Rank the dominant profiles in the CACC matrix from more to less frequent
    dplyr::arrange(dplyr::desc(.data$freq)) |>
    # Insert a new row with the total `freq`
    tibble::add_row(
      freq = sum(cacc_matrix |> dplyr::pull(.data$freq)),
      .before = 1
    ) |>
    dplyr::mutate(
      freq_max = dplyr::lag(dplyr::if_else(
        condition = .data$freq == max(.data$freq),
        true = .data$freq,
        false = as.integer(0)
      )),
      freq_dif = .data$freq_max - .data$freq,
      freq_dif = tidyr::replace_na(.data$freq_dif, 0),
      freq_cum = abs(cumsum(.data$freq_dif) - dplyr::lead(.data$freq_max, default = 0)),
      prop_cum = .data$freq_cum / max(.data$freq),
      n_config = (dplyr::n():1) - 1,
      prop_config = .data$n_config / max(.data$n_config),
      # Calculate the area under the curve
      auc = (.data$prop_cum + dplyr::lead(.data$prop_cum, default = 0)) / 2 * (1 / max(.data$n_config))
    ) |>
    dplyr::summarise(
      # Calculate the Situational Clustering Index ----
      sci = 1 - (2 * sum(.data$auc))
    )

  return (cacc_matrix |> dplyr::pull(.data$sci))

}