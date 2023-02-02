
DATA <- here("data", "mtcars.csv")

read_data <- function(filename) {
  elem <- readr::read_csv(filename)
  check_data(elem)
  elem
}

parse_file <- function(filename) {
  data_raw <- read_file(filename)
  data_elem <- purrr::map(data_raw, parse_line)
  data_elem
}

parse_line <- function(line) {
  print("finished line parse")
  stringr::str_to_upper(line)
}

read_file <- function(filename) {
  print("finished file read")
  c("get", "the", "data")
}

check_data <- function(data) {
  print("finished data check")
}


