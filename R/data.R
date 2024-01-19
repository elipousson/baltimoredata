#' @title BNIA Vital Signs Indicators, 2010-2018
#' @description Labels, definitions, and data sources for the Vital Signs
#'   indicators used by the Baltimore Neighborhood Indicators Alliance from 2010
#'   to 2018.
#' @format A data frame with 177 rows and 7 variables:
#' \describe{
#'   \item{\code{label}}{Indicator label}
#'   \item{\code{section}}{Vital Signs report section}
#'   \item{\code{source}}{Indicator data source}
#'   \item{\code{normalization_source}}{Normalization data source, e.g. Census data for CSA residents}
#'   \item{\code{definition}}{Indicator definition}
#'   \item{\code{indicator}}{Indicator variable name}
#'   \item{\code{years_available}}{Years available}
#'}
#' @source \url{https://bniajfi.org/vital_signs/}
"vital_signs_indicators"

#' BNIA Vital Signs, 2010-2018
#'
#' The Baltimore Neighborhood Indicator Alliance (BNIA) describes the Vital
#' Signs are "data-points compiled from a variety of reliable sources that 'take
#' the pulse' of Baltimore’s neighborhoods." This data set is based on the Vital
#' Signs Data Tables (2010-2018) master Excel file containing all Vital Signs
#' indicators, by year of release.
#'
#' The source file contained the full name of the indicator, values for
#' Baltimore City and all 55 of the Community Statistical Areas (CSAs). Due to
#' COVID-19, the publication of the Vital Signs 18 indicators has been staggered
#' and this data does not yet contain full housing or education data. CSAs with
#' missing data in the Excel file appear as `NA` values in this dataset.
#' @seealso
#'   \href{https://vital-signs-bniajfi.hub.arcgis.com/}{BNIA Vital Signs Open Data Portal}
#' @format A data frame with 62552 rows and 9 variables:
#' \describe{
#'   \item{\code{csa2010}}{Community Statistical Area name}
#'   \item{\code{year}}{Vital Signs year}
#'   \item{\code{indicator}}{Indicator name}
#'   \item{\code{value}}{Value of indicator}
#'   \item{\code{label}}{Indicator label}
#'   \item{\code{section}}{Vital Signs section, matching one of eight topic areas}
#'}
#' @source \url{https://bniajfi.org/vital_signs/}
"vital_signs_2010_2018"

#' Baltimore City Entity Reference
#'
#' Excerpted from the Baltimore City Entity Reference Airtable base this data
#' includes a listing of agencies, quasi-public agencies, commissions, Mayoral
#' offices, and divisions/offices (incomplete for all agencies).
#'
#' @format A data frame with 354 rows and 18 variables:
#' \describe{
#'   \item{\code{name}}{Entity name}
#'   \item{\code{name_short}}{Short name}
#'   \item{\code{name_abb}}{Abbreviated name}
#'   \item{\code{name_alt}}{Alternate name or names}
#'   \item{\code{start_year}}{Start year}
#'   \item{\code{status}}{Status}
#'   \item{\code{level}}{Level}
#'   \item{\code{entity_url}}{Entity URL}
#'   \item{\code{entity_categories}}{Entity categories}
#'   \item{\code{entity_type}}{Entity type}
#'   \item{\code{unit_type}}{Unit type}
#'   \item{\code{parent_entity}}{Parent entity}
#'   \item{\code{supporting_entity}}{Supporting entity}
#'   \item{\code{supporting_unit}}{Supporting unit}
#'   \item{\code{superseded_by}}{Superseded by}
#'   \item{\code{wikidata}}{Wikidata}
#'   \item{\code{airtable_record_id}}{Airtable record ID}
#'   \item{\code{last_modified}}{Last modified date/time}
#'}
"entity_reference"

#' Baltimore City and Regional Plans
#'
#' Table from the Baltimore City and Regional Plans Airtable base:
#' https://airtable.com/appC0OOaNJtKU6iHz/shrIb0577rFcNI6vj
#'
#' This base is an index for community plans, park plans, transportation plans,
#' and related reports or studies for Baltimore City, adjacent counties, and the
#' Baltimore metro area.
#'
#' The goal is to provide a convenient and accessible reference to information
#' plans include: what the scope and related locations for the plan, when the
#' plan was published or adopted, who prepared the plan, and any programs
#' connected to the plan. This data is the **plans** table including plans,
#' studies, reports, etc.
#'
#' Last updated: 2024-01-19
#'
#' @format A data frame with 314 rows and 36 variables:
#' \describe{
#'   \item{\code{airtable_record_id}}{character COLUMN_DESCRIPTION}
#'   \item{\code{createdTime}}{character COLUMN_DESCRIPTION}
#'   \item{\code{title}}{character COLUMN_DESCRIPTION}
#'   \item{\code{site_url}}{character COLUMN_DESCRIPTION}
#'   \item{\code{document_type}}{character COLUMN_DESCRIPTION}
#'   \item{\code{year_adopted}}{character COLUMN_DESCRIPTION}
#'   \item{\code{status}}{character COLUMN_DESCRIPTION}
#'   \item{\code{geography}}{character COLUMN_DESCRIPTION}
#'   \item{\code{location_names}}{character COLUMN_DESCRIPTION}
#'   \item{\code{county}}{character COLUMN_DESCRIPTION}
#'   \item{\code{Last Modified}}{character COLUMN_DESCRIPTION}
#'   \item{\code{Created}}{character COLUMN_DESCRIPTION}
#'   \item{\code{created_date}}{character COLUMN_DESCRIPTION}
#'   \item{\code{record_id}}{character COLUMN_DESCRIPTION}
#'   \item{\code{topic}}{character COLUMN_DESCRIPTION}
#'   \item{\code{program}}{character COLUMN_DESCRIPTION}
#'   \item{\code{source}}{character COLUMN_DESCRIPTION}
#'   \item{\code{prepared_for}}{character COLUMN_DESCRIPTION}
#'   \item{\code{date}}{character COLUMN_DESCRIPTION}
#'   \item{\code{name_short}}{character COLUMN_DESCRIPTION}
#'   \item{\code{document_url}}{character COLUMN_DESCRIPTION}
#'   \item{\code{cover}}{character COLUMN_DESCRIPTION}
#'   \item{\code{notes}}{character COLUMN_DESCRIPTION}
#'   \item{\code{prepared_by}}{character COLUMN_DESCRIPTION}
#'   \item{\code{name_abb}}{character COLUMN_DESCRIPTION}
#'   \item{\code{status_organization}}{character COLUMN_DESCRIPTION}
#'   \item{\code{layer_name}}{character COLUMN_DESCRIPTION}
#'   \item{\code{funded_by}}{character COLUMN_DESCRIPTION}
#'   \item{\code{flag}}{character COLUMN_DESCRIPTION}
#'   \item{\code{status_date}}{character COLUMN_DESCRIPTION}
#'   \item{\code{topics}}{character COLUMN_DESCRIPTION}
#'   \item{\code{update_year}}{character COLUMN_DESCRIPTION}
#'   \item{\code{doc_pg_count}}{character COLUMN_DESCRIPTION}
#'   \item{\code{short_description}}{character COLUMN_DESCRIPTION}
#'   \item{\code{based_on}}{character COLUMN_DESCRIPTION}
#'   \item{\code{regulatory_status}}{character COLUMN_DESCRIPTION}
#'}
#' @details DETAILS
"city_plans"
