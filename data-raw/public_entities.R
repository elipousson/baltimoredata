
# FIXME: Replace this version if Baltimore City Entity Reference (2023-11-06
# Copy) is ever converted
# https://airtable.com/appJ92OybyLWmOqLh/shrM4MB0YoQk7cusC
entity_reference_source <- rairtable::list_records(
  url = "https://airtable.com/appJ92OybyLWmOqLh/tblgKp8tPh0BtgB1e/viwJsYeLTUq0dlTmg?blocks=hide",
  cell_format = "string"
)

entity_reference <- entity_reference_source |>
  janitor::clean_names() |>
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
