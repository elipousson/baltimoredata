#' @title BNIA Vital Signs Indicators, 2010-2018
#' @description Labels, definitions, and data sources for the Vital Signs
#'   indicators used by the Baltimore Neighborhood Indicators Alliance from 2010
#'   to 2018.
#' @format A data frame with 177 rows and 7 variables:
#' \describe{
#'   \item{`label`}{Indicator label}
#'   \item{`section`}{Vital Signs report section}
#'   \item{`source`}{Indicator data source}
#'   \item{`normalization_source`}{Normalization data source, e.g. Census data for CSA residents}
#'   \item{`definition`}{Indicator definition}
#'   \item{`indicator`}{Indicator variable name}
#'   \item{`years_available`}{Years available}
#'}
#' @source <https://bniajfi.org/vital_signs/>
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
#'   [BNIA Vital Signs Open Data Portal](https://vital-signs-bniajfi.hub.arcgis.com/)
#' @format A data frame with 62552 rows and 9 variables:
#' \describe{
#'   \item{`csa2010`}{Community Statistical Area name}
#'   \item{`year`}{Vital Signs year}
#'   \item{`indicator`}{Indicator name}
#'   \item{`value`}{Value of indicator}
#'   \item{`label`}{Indicator label}
#'   \item{`section`}{Vital Signs section, matching one of eight topic areas}
#'}
#' @source <https://bniajfi.org/vital_signs/>
"vital_signs_2010_2018"

#' Baltimore City Entity Reference
#'
#' Excerpted from the Baltimore City Entity Reference Airtable base this data
#' includes a listing of agencies, quasi-public agencies, commissions, Mayoral
#' offices, and divisions/offices (incomplete for all agencies).
#'
#' @format A data frame with 354 rows and 18 variables:
#' \describe{
#'   \item{`name`}{Entity name}
#'   \item{`name_short`}{Short name}
#'   \item{`name_abb`}{Abbreviated name}
#'   \item{`name_alt`}{Alternate name or names}
#'   \item{`start_year`}{Start year}
#'   \item{`status`}{Status}
#'   \item{`level`}{Level}
#'   \item{`entity_url`}{Entity URL}
#'   \item{`entity_categories`}{Entity categories}
#'   \item{`entity_type`}{Entity type}
#'   \item{`unit_type`}{Unit type}
#'   \item{`parent_entity`}{Parent entity}
#'   \item{`supporting_entity`}{Supporting entity}
#'   \item{`supporting_unit`}{Supporting unit}
#'   \item{`superseded_by`}{Superseded by}
#'   \item{`wikidata`}{Wikidata}
#'   \item{`airtable_record_id`}{Airtable record ID}
#'   \item{`last_modified`}{Last modified date/time}
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
#' Last updated: 2024-01-25
#'
#' @format A data frame with 322 rows and 32 variables:
#' \describe{
#'   \item{`title`}{Plan title}
#'   \item{`year_adopted`}{Year adopted/completed}
#'   \item{`update_year`}{Year updated}
#'   \item{`date`}{Date (may be approximate)}
#'   \item{`status`}{Current status}
#'   \item{`document_url`}{Document URL}
#'   \item{`site_url`}{Related site URL}
#'   \item{`geography`}{Geography}
#'   \item{`document_type`}{Document type}
#'   \item{`program`}{Related program}
#'   \item{`prepared_for`}{Entity or entities prepared for}
#'   \item{`prepared_by`}{Entity or entities prepared by}
#'   \item{`funded_by`}{Entity or entities funded by}
#'   \item{`location_names`}{Location names}
#'   \item{`county`}{County name}
#'   \item{`main_topic`}{Main topic}
#'   \item{`topics`}{Topics}
#'   \item{`name_abb`}{Name abbreviation}
#'   \item{`name_short`}{Short name}
#'   \item{`title_alt`}{Alternate title for spatial data join}
#'   \item{`short_description`}{Short document description}
#'   \item{`document_page_count`}{Page count}
#'   \item{`document_url_type`}{Page count}
#'   \item{`status_organization`}{Entity assigning status}
#'   \item{`status_date`}{Status assignment date}
#'   \item{`status_regulatory`}{Regulatory status}
#'   \item{`source`}{Document source}
#'   \item{`based_on`}{Documents based on}
#'   \item{`notes`}{Notes}
#'   \item{`created_date`}{Airtable record created date/time}
#'   \item{`last_modified`}{Airtable record last modified date/time}
#'   \item{`record_id`}{Airtable record identifier}
#'}
#' @source <https://airtable.com/appC0OOaNJtKU6iHz/shrIb0577rFcNI6vj>
"baltimore_plans"