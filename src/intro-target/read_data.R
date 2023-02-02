
DATA <- here("data", "mtcars.csv")

read_data <- function(filename) {
  elem <- readr::read_csv(filename)
  elem
}



