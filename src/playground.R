# Start from here
print("Hello World!")

library(targets)
tar_visnetwork()
tar_make()
# do some changes and see the effect
tar_visnetwork()
tar_make()

# for tutorial in details : https://github.com/wlandau/targets-tutorial




library(tidyverse)

# Bare Hands
data <- tibble(x = 1:100, y = 1:100, z = seq(100, 1))
data %>%
  ggplot(mapping = aes(x, y)) +
  geom_point()

# Option 1

custom_plot <- function(data, x, y) {
  data %>%
    ggplot(mapping = aes(x, y)) +
    geom_point()
}

data %>% custom_plot(x, y) # seems working
data %>% custom_plot(x, z) # not working

# Option 2

custom_plot <- function(data, x, y) {
  data %>%
    ggplot(mapping = aes_string(x, y)) +
    geom_point()
}

data %>% custom_plot("x", "z")
# works but changes the interface



# Option 3

custom_plot <- function(data, x, y) {
  data %>%
    ggplot(mapping = aes({{ x }}, {{ y }})) +
    geom_point()
}

data %>% custom_plot(x, z)
# works and same interface

