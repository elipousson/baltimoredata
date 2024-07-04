msa_atlas_maps_src <- rairtable::list_records(
  url = "https://airtable.com/appLdXzqz0QOXqJTE/tbl5USvgu1F5qLhoR/viwZTcocjLuYKkSzZ?blocks=hide",
  cell_format = "string"
)

msa_atlas_maps <- msa_atlas_maps_src |>
  filter(
    !is.na(title)
  ) |>
  select(
    !c(airtable_record_id, createdTime)
  ) |>
  mutate(
    across(
      ends_with("_url"),
      \(x) {
        str_replace(
         x,
         "^http://mdhistory.net",
         "http://mdhistory.msa.maryland.gov"
        )
      }
    )
  )

usethis::use_data(msa_atlas_maps, overwrite = TRUE)
