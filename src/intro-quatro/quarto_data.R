convert_quarto <- function(analysis_data) {
    # anova types
    t_test_res <- analysis_data$hp_am_test[1,] %>%
        select(df, statistic) %>%
        as.numeric()
    t_test_res <- rlang::inject(t_print(!!!t_test_res))
    # t-test types
    # other analyses...
    anova_res <- analysis_data$hp_gear_anova[1,] %>%
        as_tibble() %>%
        select(DFn, DFd, F) %>%
        as.numeric()
    anova_res <- rlang::inject(f_print(!!!anova_res))
    list(
        t_test_res = t_test_res,
        anova_res = anova_res
    )
}