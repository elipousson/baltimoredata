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
