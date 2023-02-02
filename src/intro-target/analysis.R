check_assumptions <- function(data) {
  print("finish check assumptions")
  data
}

analyse_data <- function(data) {
  data <- data %>% mutate(
    cyl = as_factor(cyl),
    vs = as_factor(vs),
    am = as_factor(am),
    gear = as_factor(gear),
    carb = as_factor(carb)
  )
  
  hp_am_test <- data %>% t_test(hp ~ am)
  hp_gear_anova <- data %>% anova_test(hp ~ gear)
  
  list(hp_am_test = hp_am_test, hp_gear_anova = hp_gear_anova)
}