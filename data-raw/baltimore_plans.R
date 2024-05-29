## code to prepare `city_plans` dataset goes here

library(tidyverse)

url <- "https://docs.google.com/spreadsheets/d/1TeJjIk4TLlZWWLXkVug4dRuo3Dldh11I0Hzheh6rYQw/edit?usp=sharing"

plans_xwalk <- googlesheets4::read_sheet(url)

plans_url <- "https://airtable.com/appC0OOaNJtKU6iHz/tblT7aZvpGeoFTG02/viwOB8OC0IR0kODqu?blocks=hide"

baltimore_plans_model <- rairtable::get_table_model(
  base = "appC0OOaNJtKU6iHz",
  table = "tblT7aZvpGeoFTG02"
)

baltimore_plans_yml_src <- rairtable::list_records(
  url = plans_url,
  cell_format = "string",
  model = baltimore_plans_model,
  simplifyVector = FALSE
)

baltimore_plans_yml_src |>
  yaml::write_yaml("baltimore_plans.yml")

baltimore_plans_src <- rairtable::list_records(
  url = plans_url,
  cell_format = "string",
  model = baltimore_plans_model
)

baltimore_plans <- baltimore_plans_src |>
  janitor::clean_names() |>
  mutate(
    title_alt = stringr::str_trim(stringr::str_squish(title_alt)),
    title = stringr::str_trim(stringr::str_squish(title))#,
    # plan_name = coalesce(name_join, title)
  ) |>
  mutate(
    document_filename = basename(document_url),
    document_cover_filename = str_trim(
      str_extract(
        document_cover,
        ".+(?=\\()"
      )
    ),
    .after = document_url
  ) |>
  select(
    !c(document_cover, created_time, airtable_record_id, flag)
  )

baltimore_plans |>
  readr::write_csv("baltimore_plans.csv")


#
# mapbaltimore::adopted_plans |>
#   mutate(
#     plan_name = stringr::str_trim(stringr::str_squish(plan_name))
#   ) |>
#   left_join(
#     baltimore_plans,
#     by = join_by(plan_name)
#   ) |>
#   View()
#
# baltimore_plans |>
#   left_join(
#     mapbaltimore::adopted_plans |>
#       mutate(
#         has_mapbaltimore_geometry = TRUE,
#         plan_name = stringr::str_trim(stringr::str_squish(plan_name))
#       ) |>
#       select(!year_adopted),
#     by = join_by(plan_name)
#   ) |>
#   filter(status != "In process", is.na(has_mapbaltimore_geometry)) |>
#   arrange(desc(year_adopted)) |>
#   View()

usethis::use_data(baltimore_plans, overwrite = TRUE)
