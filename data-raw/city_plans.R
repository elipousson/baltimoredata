## code to prepare `city_plans` dataset goes here

url <- "https://airtable.com/appC0OOaNJtKU6iHz/tblT7aZvpGeoFTG02/viwOB8OC0IR0kODqu?blocks=hide"

city_plans_src <- rairtable::list_records(
  url = url,
  cell_format = "string"
  )

city_plans <- city_plans_src

usethis::use_data(city_plans, overwrite = TRUE)
