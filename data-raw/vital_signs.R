## code to prepare `DATASET` dataset goes here
library(magrittr)

indicators <- readxl::read_excel(
  "inst/extdata/VS18_Indicators_2010-2018.xlsx",
  sheet = "Vital Signs Indicators",
  col_types = "text"
) %>%
  janitor::clean_names("snake") %>%
  dplyr::rename(label = indicator) %>%
  dplyr::mutate(indicator = janitor::make_clean_names(label))

vital_signs_2010_2018 <- purrr::map_dfr(
  c(2010:2018),
  ~ readxl::read_excel(
    "inst/extdata/VS18_Indicators_2010-2018.xlsx",
    sheet = as.character(.x),
    col_types = "text"
  ) %>%
    janitor::clean_names("snake") %>%
    dplyr::bind_cols(year = .x) %>%
    tidyr::pivot_longer(
      cols = !c(csa2010, year),
      names_to = "indicator",
      values_to = "value"
    ) %>%
    dplyr::mutate(
      indicator = dplyr::case_when(
        indicator == "id" ~ "exclude",
        indicator == "x1" ~ "exclude",
        # indicator == "daytime_crime_rate_per_1_000_population" ~ ,
        indicator == "infant_mortality_rate" ~ "infant_mortality",
        indicator == "number_of_total_jobs" ~ "number_of_total_jobs_filled_by_employees",
        # indicator == "percent_subsidized_housing" ~ "", # Possibly should be combined with rate_of_housing_vouchers_per_1_000_rental_units
        indicator == "number_of_adult_arrests_per_1_000_residents_over_the_age_of_18" ~ "number_of_arrests_per_1_000_residents",
        indicator == "percentage_of_population_aged_16_19_in_school_and_or_employed_54" ~ "percentage_of_population_aged_16_19_in_school_and_or_employed",
        indicator == "high_school_dropout_withdrawal_rate" ~ "high_school_dropout_withdrawl_rate",
        indicator == "percentage_of_population_aged_16_19_in_school_and_or_employed_129" ~ "exclude",
        TRUE ~ indicator
      )
    )
) %>%
  dplyr::filter(indicator != "exclude") %>%
  dplyr::mutate(value = as.numeric(value)) %>%
  dplyr::left_join(
    dplyr::select(indicators, -c(source:definition))
  )

usethis::use_data(vital_signs_2010_2018, overwrite = TRUE)

indicator_years <- purrr::map_dfr(
  indicators$indicator,
  ~ dplyr::bind_cols(
    indicator = .x,
    years_available = vital_signs_2010_2018 %>%
      dplyr::filter(indicator == .x) %>%
      dplyr::distinct(year) %>%
      dplyr::pull() %>%
      paste0(collapse = "!!")
  )
) %>%
  dplyr::mutate(
    years_available = purrr::map(
      stringr::str_split(years_available, pattern = "!!"),
      ~ as.integer(.x)
    )
  )

vital_signs_indicators <- indicators %>%
  dplyr::left_join(indicator_years)

usethis::use_data(vital_signs_indicators, overwrite = TRUE)

vital_signs_2010_2018_wide <- vital_signs_2010_2018 %>%
  pivot_wider(
    id_cols = c(csa2010, indicator),
    names_from = year,
    values_from = value
  )
