
# FIXME: Replace this version if Baltimore City Entity Reference (2023-11-06
# Copy) is ever converted
# https://airtable.com/appJ92OybyLWmOqLh/shrM4MB0YoQk7cusC
entity_reference <- rairtable::list_records(
  url = "https://airtable.com/appJ92OybyLWmOqLh/tblgKp8tPh0BtgB1e/viwJsYeLTUq0dlTmg?blocks=hide",
  cell_format = "string"
)

entity_reference <- entity_reference |>
  janitor::clean_names() |>
  dplyr::select(
    name,
    short_name,
    acronym,
    start_year = year_established_authorized,
    status,
    level,
    entity_url,
    entity_type,
    entity_categories,
    parent_entity,
    supporting_entity,
    supporting_unit,
    airtable_record_id,
    last_modified
  )

usethis::use_data(entity_reference)
