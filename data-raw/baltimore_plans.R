## code to prepare `city_plans` dataset goes here

library(dplyr)

url <- "https://airtable.com/appC0OOaNJtKU6iHz/tblT7aZvpGeoFTG02/viwOB8OC0IR0kODqu?blocks=hide"

baltimore_plans_model <- rairtable::get_table_model(
  base = "appC0OOaNJtKU6iHz",
  table = "tblT7aZvpGeoFTG02"
)

baltimore_plans_src <- rairtable::list_records(
  url = url,
  cell_format = "string",
  model = baltimore_plans_model
  )

baltimore_plans <- baltimore_plans_src |>
  select(
    !c(document_cover, createdTime, airtable_record_id, flag)
  ) |>
  janitor::clean_names() |>
  mutate(
    title_alt = stringr::str_trim(stringr::str_squish(title_alt)),
    title = stringr::str_trim(stringr::str_squish(title))#,
    # plan_name = coalesce(name_join, title)
  )
#
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
