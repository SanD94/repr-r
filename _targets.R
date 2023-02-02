# Created by use_targets().
# Follow the comments below to fill in this target script.
# Then follow the manual to check and run the pipeline:
#   https://books.ropensci.org/targets/walkthrough.html#inspect-the-pipeline # nolint

# Load packages required to define the pipeline:
library(targets)
library(tarchetypes) # Load other packages as needed. # nolint
library(here)

# Set target options:
tar_option_set(
  packages = c("tidyverse"), # packages that your targets need to run
  format = "rds" # default storage format
  # Set other options as needed.
)

# tar_make_clustermq() configuration (okay to leave alone):
options(clustermq.scheduler = "multiprocess")

# tar_make_future() configuration (okay to leave alone):
# Install packages {{future}}, {{future.callr}}, and {{future.batchtools}} to allow use_targets() to configure tar_make_future() options.

# Load the R scripts with your custom functions:
# lapply(list.files("R", full.names = TRUE, recursive = TRUE), source)
# source("other_functions.R") # Source other scripts as needed. # nolint
source(here("src", "intro-target", "read_data.R"))
source(here("src", "intro-target", "tidy_data.R"))
source(here("src", "intro-target", "analysis.R"))
source(here("src", "intro-target", "visualization.R"))
source(here("src", "intro-target", "report.R"))

# Replace the target list below with your own:
list(
  tar_target(
    raw_data,
    read_data(DATA)
  ),
  tar_target(
    pretty_data,
    tidy_data(raw_data)
  ),
  tar_target(
    analysis_results,
    pretty_data %>%
      check_assumptions() %>%
      analyse_data()
  ),
  tar_target(
    graphs,
    pretty_data %>%
     visualize()
  ),
  tar_quarto(
    manuscript,
    report
  )
)
