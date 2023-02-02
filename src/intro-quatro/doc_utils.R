f_print <- function(df, dn, val) {
    paste(
        "F(",
        df,
        ",",
        dn,
        ") = ",
        val
    )
}

t_print <- function(df, val) {
    paste(
        "t(",
        df,
        ") = ",
        val
    )
}

p_print <- function(p_val) {
    symbols <- c("=", "<")
    vals <- c(p_val, 1e-3)
    res <- p_val < 1e-3
    selected_symbol <- symbols[res + 1]
    selected_val <- vals[res + 1]
    paste(
        "p",
        selected_symbol,
        selected_val
    )
}
