library(ipumsr)
library(magrittr)

us_nhgis <- read_nhgis(
  data_file = "/Users/elipousson/Downloads/nhgis0007_csv.zip")

baltimore_nhgis <- us_nhgis %>%
  dplyr::filter(STATE == "Maryland",
                COUNTY == "Baltimore city")

tracts_1970 <- sf::read_sf("/Users/elipousson/Downloads/nhgis0007_shape/nhgis0007_shapefile_tl2008_us_tract_1970/US_tract_1970_conflated.shp") %>%
  dplyr::filter(COUNTY == 510) %>%
  sf::st_transform(2804) %>%
  dplyr::mutate(YEAR = "1970") %>%
  dplyr::select(YEAR, GISJOIN, geometry)

tracts_1980 <- sf::read_sf("/Users/elipousson/Downloads/nhgis0007_shape/nhgis0007_shapefile_tl2008_us_tract_1980/US_tract_1980_conflated.shp") %>%
  dplyr::filter(COUNTY == 510) %>%
  sf::st_transform(2804) %>%
  dplyr::mutate(YEAR = "1980") %>%
  dplyr::select(YEAR, GISJOIN, geometry)

tracts_1990 <- sf::read_sf("/Users/elipousson/Downloads/nhgis0007_shape/nhgis0007_shapefile_tl2008_us_tract_1990/US_tract_1990_conflated.shp") %>%
  dplyr::filter(COUNTY == 510) %>%
  sf::st_transform(2804) %>%
  dplyr::mutate(YEAR = "1990") %>%
  dplyr::select(YEAR, GISJOIN, geometry)

tracts_2000 <- sf::read_sf("/Users/elipousson/Downloads/nhgis0007_shape/nhgis0007_shapefile_tl2010_us_tract_2000/US_tract10_2000.shp") %>%
  dplyr::filter(COUNTYFP00 == 510) %>%
  sf::st_transform(2804) %>%
  dplyr::mutate(YEAR = "2000") %>%
  dplyr::select(YEAR, GISJOIN, geometry)

tracts_2010 <- sf::read_sf("/Users/elipousson/Downloads/nhgis0007_shape/nhgis0007_shapefile_tl2010_us_tract_2010/US_tract_2010.shp") %>%
  dplyr::filter(COUNTYFP10 == 510) %>%
  sf::st_transform(2804) %>%
  dplyr::mutate(YEAR = "2010") %>%
  dplyr::select(YEAR, GISJOIN, geometry)

combined_tracts <- bind_rows(tracts_1970, tracts_1980, tracts_1990, tracts_2000, tracts_2010)

baltimore_nhgis_sf <- baltimore_nhgis %>%
  dplyr::left_join(combined_tracts, by = c("GISJOIN", "YEAR")) %>%
  as_tibble() %>%
  sf::st_as_sf()

area <- get_area(
  type = "neighborhood",
  area_name = c("Central Forest Park", "Concerned Citizens Of Forest Park", "Forest Park", "Forest Park Golf Course", "West Forest Park"),
  union = TRUE
  )

area_nhgis_sf <- baltimore_nhgis_sf[lengths(sf::st_intersects(baltimore_nhgis_sf, area)) > 0, ]

area_nhgis_sf %>%
  sf::st_drop_geometry() %>%
  dplyr::select(YEAR, AV0AA:B18AD) %>%
  pivot_longer(cols = c(-YEAR),
               names_to = "variable",
               values_to = "value") %>%
  ggplot(aes(y = value, x = YEAR, color = variable)) +
  geom_point(size = 5, alpha = 0.6) +
  scale_color_viridis_d(end = 0.8) +
  facet_wrap(~ variable)

