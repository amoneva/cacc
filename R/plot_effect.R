#' Density Plot for the Main Effect
#'
#' @description Plots an annotated boxplot and kernel density estimate to visualize the distribution of the main effect that a specific value of a variable produces on the outcome probability in a `cacc_matrix`.
#'
#' @param cacc_matrix A tibble. The output of the `cacc` function.
#' @param variable A single variable name contained in a `cacc_matrix`.
#' @param value A single numeric or character value the `variable` specified can take.
#'
#' @return Returns a ggplot object.
#' @export
#'
#' @examples
#' plot_effect(
#'   cacc_matrix = cacc(data = test_data, ivs = c(iv1, iv2, iv3, iv4), dv = dv1),
#'   variable = iv4,
#'   value = 0
#' )
#'
plot_effect <- function (cacc_matrix, variable, value) {

  # Calculate the main effect ----
  cacc_effect <- cacc_matrix |>
    dplyr::group_by(dplyr::across(-c({{ variable }}, .data$freq, .data$p))) |>
    dplyr::filter(dplyr::n() > 1) |>
    dplyr::arrange({{ variable }}, .by_group = TRUE) |>
    dplyr::mutate(effect = dplyr::if_else(
      condition = {{ variable }} == value,
      true = NA_real_,
      false = .data$p - dplyr::nth(.data$p, which({{ variable }} == value))
    )) |>
    dplyr::ungroup() |>
    tidyr::drop_na()

  # Plot the main effect ----

  # Declare the summary stats
  summary_stats <- cacc_effect |>
    dplyr::summarise(
      mean_ = round(
        x = mean(.data$effect),
        digits = 3
      ),
      sd_ = round(
        x = stats::sd(.data$effect),
        digits = 3
      )
    )

  # Produce a distribution plot
  cacc_effect |>
    ggplot2::ggplot(mapping = ggplot2::aes(x = .data$effect)) +
    ggplot2::geom_density(
      fill = "grey",
      alpha = .5
    ) +
    ggplot2::geom_boxplot() +
    ggplot2::geom_vline(
      xintercept = 0,
      linetype = 2
    ) +
    ggplot2::scale_y_discrete() +
    # Add an annotation layer to the plot with the summary stats
    ggplot2::annotate(
      geom = "text",
      x = c(-Inf, -Inf),
      y = c(Inf, Inf),
      hjust = c(0, 0),
      vjust = c(1.5, 3.5),
      label = c(
        paste("italic(M) ==", summary_stats |> dplyr::pull(.data$mean_)),
        paste("italic(SD) ==", summary_stats |> dplyr::pull(.data$sd_))
      ),
      parse = TRUE
    ) +
    ggplot2::labs(
      x = "Main effect",
      y = NULL
    )

}