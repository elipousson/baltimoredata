
# FIXME: Replace this version if Baltimore City Entity Reference (2023-11-06
# Copy) is ever converted
# https://airtable.com/appJ92OybyLWmOqLh/shrM4MB0YoQk7cusC
entities_list <- rairtable::list_records(
  url = "https://airtable.com/appJ92OybyLWmOqLh/tblgKp8tPh0BtgB1e/viwJsYeLTUq0dlTmg?blocks=hide",
  cell_format = "json",
  simplifyVector = FALSE
)

entities_list |>
  jsonlite::write_json("inst/extdata/entities.json")

people_list <- rairtable::list_records(
  url = "https://airtable.com/appJ92OybyLWmOqLh/tblH1Nd6Y2kiCz9yq/viw5h2i5Y0W09kdJM?blocks=hide",
  cell_format = "json",
  simplifyVector = FALSE
)

people_list |>
  jsonlite::write_json("inst/extdata/people.json")


assignments_list <- rairtable::list_records(
  url = "https://airtable.com/appJ92OybyLWmOqLh/tblnCgC6OokekMbO5/viwYUQp8C1nYFPRVG?blocks=hide",
  cell_format = "json",
  simplifyVector = FALSE
)

assignments_list |>
  jsonlite::write_json("inst/extdata/assignments.json")


sources_list <- rairtable::list_records(
  url = "https://airtable.com/appJ92OybyLWmOqLh/tblt2VGrpCu2YW1sk/viwRHB1ZHcKM7VV2g?blocks=hide",
  cell_format = "json",
  simplifyVector = FALSE
)

sources_list |>
  jsonlite::write_json("inst/extdata/sources.json")


crosswalks_list <- rairtable::list_records(
  url = "https://airtable.com/app1lcJCwi0mpQGqZ/tbl81zsVzjBxVZePB/viwlrhbxPrDasYqzp?blocks=hide",
  cell_format = "json",
  simplifyVector = FALSE
)

crosswalks_list |>
  jsonlite::write_json("inst/extdata/crosswalks.json")

entity_reference_source <- rairtable::list_records(
  url = "https://airtable.com/appJ92OybyLWmOqLh/tblgKp8tPh0BtgB1e/viwJsYeLTUq0dlTmg?blocks=hide",
  cell_format = "string"
)

entity_reference <- entity_reference_source |>
  janitor::clean_names() |>
  dplyr::mutate(
    common_abbreviation = dplyr::coalesce(
      common_abbreviation,
      acronym
    )
  ) |>
  dplyr::select(
    name,
    name_short = short_name,
    name_abb = common_abbreviation,
    name_alt = alternate_names,
    # acronym,
    start_year = year_established_authorized,
    status,
    level,
    entity_url,
    entity_categories,
    entity_type,
    unit_type,
    parent_entity,
    supporting_entity,
    supporting_unit,
    superseded_by,
    wikidata,
    airtable_record_id,
    last_modified
  )

usethis::use_data(entity_reference, overwrite = TRUE)
