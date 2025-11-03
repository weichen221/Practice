> library(sf)
Linking to GEOS 3.13.1, GDAL 3.11.0, PROJ 9.6.0; sf_use_s2() is TRUE
> library(tidyverse)
── Attaching core tidyverse packages ────────────────────── tidyverse 2.0.0 ──
✔ dplyr     1.1.4     ✔ readr     2.1.5
✔ forcats   1.0.1     ✔ stringr   1.5.2
✔ ggplot2   4.0.0     ✔ tibble    3.3.0
✔ lubridate 1.9.4     ✔ tidyr     1.3.1
✔ purrr     1.1.0     
── Conflicts ──────────────────────────────────────── tidyverse_conflicts() ──
✖ dplyr::filter() masks stats::filter()
✖ dplyr::lag()    masks stats::lag()
ℹ Use the conflicted package to force all conflicts to become errors
> 
  > # OSM data
  > 
  > OSM <- st_read("prac5_data/greater-london-latest-free.shp/gis_osm_pois_free_1.shp")%>%
  +     st_transform(., 27700) %>%
  +     #select hotels only
  +     filter(fclass == 'hotel')
错误: Cannot open "prac5_data/greater-london-latest-free.shp/gis_osm_pois_free_1.shp"; The file doesn't seem to exist.

> # OSM data
> > 
错误: 意外的'>'在">"里

> OSM <- st_read("prac5_data/greater-london-latest-free.shp/gis_osm_pois_free_1.shp")%>%
+     +     st_transform(., 27700) %>%
+     +     #select hotels only
+     +     filter(fclass == 'hotel')
错误: Cannot open "prac5_data/greater-london-latest-free.shp/gis_osm_pois_free_1.shp"; The file doesn't seem to exist.

> OSM <- st_read(""E:\UCL COURSE\GIS\WK5\gis_osm_pois_free_1.shp"")%>%
  错误: 意外的符号在"OSM <- st_read(""E"里

> OSM <- st_read("E:/UCL COURSE/GIS/WK5/gis_osm_pois_free_1.shp")
Reading layer `gis_osm_pois_free_1' from data source 
  `E:\UCL COURSE\GIS\WK5\gis_osm_pois_free_1.shp' using driver `ESRI Shapefile'
Simple feature collection with 97061 features and 4 fields
Geometry type: POINT
Dimension:     XY
Bounding box:  xmin: -0.5120832 ymin: 51.28679 xmax: 0.3094684 ymax: 51.6902
Geodetic CRS:  WGS 84
> 
> #select hotels only
> filter(fclass == 'hotel')
错误: 找不到对象'fclass'

> OSM <- OSM %>%
+     st_transform(27700) %>%
+     filter(fclass == 'hotel')
> 
> View(OSM)
> Airbnb <- read_csv("E:\UCL COURSE\GIS\WK5\statistical-gis-boundaries-london\ESRI\London_Borough_Excluding_MHW.shp") %>% st_as_sf(., coords = c("longitude", "latitude"), 
错误: '\G' is an unrecognized escape in character string (<input>:1:35)

> Airbnb <- read_csv("E:\UCL COURSE\GIS\WK5\listings (1).csv") %>%
错误: '\G' is an unrecognized escape in character string (<input>:1:35)

> Airbnb <- read_csv("E:/UCL COURSE/GIS/WK5/listings (1).csv") %>%# longitude is considered x value here, latitude is y
+     st_as_sf(., coords = c("longitude", "latitude"), 
+              crs = 4326) %>%
+     st_transform(., 27700)%>%
+     #select entire places that are available all year
+     filter(room_type == 'Entire home/apt' & availability_365 =='365')
Rows: 96651 Columns: 18                                                       
── Column specification ──────────────────────────────────────────────────────
Delimiter: ","
chr   (4): name, host_name, neighbourhood, room_type
dbl  (11): id, host_id, latitude, longitude, price, minimum_nights, number...
lgl   (2): neighbourhood_group, license
date  (1): last_review

ℹ Use `spec()` to retrieve the full column specification for this data.
ℹ Specify the column types or set `show_col_types = FALSE` to quiet this message.
>     
> View(Airbnb)
> Worldcities <- st_read("E:/UCL COURSE/GIS/WK5/World_Cities/World_Cities.shp") %>%
+     st_transform(27700)
Reading layer `World_Cities' from data source 
`E:\UCL COURSE\GIS\WK5\World_Cities\World_Cities.shp' using driver `ESRI Shapefile'
Simple feature collection with 2540 features and 14 fields
Geometry type: POINT
Dimension:     XY
Bounding box:  xmin: -19609100 ymin: -7321602 xmax: 19950890 ymax: 14476660
Projected CRS: WGS 84 / Pseudo-Mercator
> 
> View(Worldcities)
> # filter based on key cities
> Worldcities2 <- Worldcities %>%
+     filter(
+         CNTRY_NAME == "United Kingdom" &
+             CITY_NAME %in% c("Birmingham", "London", "Edinburgh")
+     )
> 
> # load UK outline
> UK_outline <- st_read("E:/UCL COURSE/GIS/WK5/gadm41_GBR_0.shp") %>%
+     st_transform(27700)
Reading layer `gadm41_GBR_0' from data source 
`E:\UCL COURSE\GIS\WK5\gadm41_GBR_0.shp' using driver `ESRI Shapefile'
Simple feature collection with 1 feature and 2 fields
Geometry type: MULTIPOLYGON
Dimension:     XY
Bounding box:  xmin: -8.649996 ymin: 49.86531 xmax: 1.764393 ymax: 60.84548
Geodetic CRS:  WGS 84
> 
> View(Worldcities2)
> Hotels <-  st_join(Londonborough, OSM)
错误: 找不到对象'Londonborough'

> exists("Londonborough")
[1] FALSE
> 
> Londonborough <- st_read("E:/UCL COURSE/GIS/WK5/statistical-gis-boundaries-london/ESRI/London_Borough_Excluding_MHW.shp") %>%
+     st_transform(27700)
Reading layer `London_Borough_Excluding_MHW' from data source 
`E:\UCL COURSE\GIS\WK5\statistical-gis-boundaries-london\ESRI\London_Borough_Excluding_MHW.shp' 
  using driver `ESRI Shapefile'
Simple feature collection with 33 features and 7 fields
Geometry type: MULTIPOLYGON
Dimension:     XY
Bounding box:  xmin: 503568.2 ymin: 155850.8 xmax: 561957.5 ymax: 200933.9
Projected CRS: OSGB36 / British National Grid
> 
  > View(Londonborough)
> Hotels <-  st_join(Londonborough, OSM)
> 
  > Airbnbs <-  st_join(Londonborough, Airbnb)
> 
  > head(Hotels)
Simple feature collection with 6 features and 11 fields
Geometry type: MULTIPOLYGON
Dimension:     XY
Bounding box:  xmin: 516362.6 ymin: 155850.8 xmax: 539657.9 ymax: 172367
Projected CRS: OSGB36 / British National Grid
NAME  GSS_CODE HECTARES NONLD_AREA ONS_INNER SUB_2009
1   Kingston upon Thames E09000021 3726.117          0         F     <NA>
  1.1 Kingston upon Thames E09000021 3726.117          0         F     <NA>
  1.2 Kingston upon Thames E09000021 3726.117          0         F     <NA>
  1.3 Kingston upon Thames E09000021 3726.117          0         F     <NA>
  1.4 Kingston upon Thames E09000021 3726.117          0         F     <NA>
  2                Croydon E09000008 8649.441          0         F     <NA>
  SUB_2006      osm_id code fclass                             name
1       <NA>   387544035 2401  hotel             Bosco Hotel & Lounge
1.1     <NA>  1729750835 2401  hotel                       Travelodge
1.2     <NA>  4002880204 2401  hotel                      Premier Inn
1.3     <NA>  5955546285 2401  hotel The Bull and Bush Hotel Kingston
1.4     <NA> 12167570871 2401  hotel                       Travelodge
2       <NA>  5308320604 2401  hotel    easyHotel Croydon Town Centre
geometry
1   MULTIPOLYGON (((516401.6 16...
                    1.1 MULTIPOLYGON (((516401.6 16...
                                        1.2 MULTIPOLYGON (((516401.6 16...
                                                            1.3 MULTIPOLYGON (((516401.6 16...
                                                                                1.4 MULTIPOLYGON (((516401.6 16...
                                                                                                    2   MULTIPOLYGON (((535009.2 15...
                                                                                                                        > history()
                                                                                                                        > 
                                                                                                                          > View(Airbnb)
                                                                                                                        > Hotels_sum <- Hotels %>%
                                                                                                                          +     # we need to list the columns we want to keep in the summarise
                                                                                                                          +     group_by(., GSS_CODE, NAME)%>%
                                                                                                                          +     # for each group count the number of rows and store in a column called accomodation count.
                                                                                                                          +     summarise(`Accomodation count` = n())
                                                                                                                        `summarise()` has grouped output by 'GSS_CODE'. You can override using the
                                                                                                                        `.groups` argument.
                                                                                                                        > 
                                                                                                                          > Airbnb_sum <- Airbnbs %>%
                                                                                                                          +     group_by(., GSS_CODE, NAME)%>%
                                                                                                                          +     summarise(`Accomodation count` = n())
                                                                                                                        `summarise()` has grouped output by 'GSS_CODE'. You can override using the
                                                                                                                        `.groups` argument.
                                                                                                                        > View(Hotels_sum)
                                                                                                                        > # the st_join data = 0 Hotels
                                                                                                                          > Hotels %>%
                                                                                                                          +     filter(NAME=="Barking and Dagenham")
                                                                                                                        Simple feature collection with 1 feature and 11 fields
                                                                                                                        Geometry type: MULTIPOLYGON
                                                                                                                        Dimension:     XY
                                                                                                                        Bounding box:  xmin: 543417.3 ymin: 181434.1 xmax: 551944.6 ymax: 191137.3
                                                                                                                        Projected CRS: OSGB36 / British National Grid
                                                                                                                        NAME  GSS_CODE HECTARES NONLD_AREA ONS_INNER SUB_2009
                                                                                                                        32 Barking and Dagenham E09000002 3779.934     169.15         F     <NA>
                                                                                                                          SUB_2006     osm_id code fclass               name
                                                                                                                        32     <NA> 9090311683 2401  hotel Barking Park Hotel
                                                                                                                        geometry
                                                                                                                        32 MULTIPOLYGON (((543905.4 18...
                                                                                                                                           > # the group by and summarise data = 1 Hotel!
                                                                                                                                             > Hotels_sum %>%
                                                                                                                                             +     filter(NAME=="Barking and Dagenham")
                                                                                                                                           Simple feature collection with 1 feature and 3 fields
                                                                                                                                           Geometry type: MULTIPOLYGON
                                                                                                                                           Dimension:     XY
                                                                                                                                           Bounding box:  xmin: 543417.3 ymin: 181434.1 xmax: 551944.6 ymax: 191137.3
                                                                                                                                           Projected CRS: OSGB36 / British National Grid
                                                                                                                                           # A tibble: 1 × 4
                                                                                                                                           # Groups:   GSS_CODE [1]
                                                                                                                                           GSS_CODE  NAME                `Accomodation count`                  geometry
                                                                                                                                           * <chr>     <chr>                              <int>        <MULTIPOLYGON [m]>
                                                                                                                                             1 E09000002 Barking and Dagenh…                    1 (((543905.4 183199.1, 54…
                                                                                                                                                                                                     > Hotels_example <-st_contains(Londonborough, OSM)
                                                                                                                                                                                                     > 
                                                                                                                                                                                                       > Hotels_example
                                                                                                                                                                                                     Sparse geometry binary predicate list of length 33, where the
                                                                                                                                                                                                     predicate was `contains'
first 10 elements:
 1: 35, 105, 157, 221, 321
 2: 213, 223
 3: 1, 42, 214, 258, 267, 316
 4: 7, 82, 115, 246, 252, 274
 5: 39, 239, 250, 254, 291, 320
 6: 110, 188, 215, 216, 217, 253, 319
 7: 65, 158, 185, 225, 226, 227, 228, 255
 8: 145, 162
 9: 38, 125, 138, 151, 192, 194, 237, 322, 340
 10: 93, 108, 220, 270, 288
> Accomodation_contained <- Londonborough%>%
+     mutate(hotels_n = lengths(st_contains(., OSM)))%>%
+     mutate(airbnbs_n = lengths(st_contains(., Airbnbs)))
> # the group by and summarise data = 1 Hotel!
> Accomodation_contained %>%
+     filter(NAME=="Barking and Dagenham")
Simple feature collection with 1 feature and 9 fields
Geometry type: MULTIPOLYGON
Dimension:     XY
Bounding box:  xmin: 543417.3 ymin: 181434.1 xmax: 551944.6 ymax: 191137.3
Projected CRS: OSGB36 / British National Grid
                  NAME  GSS_CODE HECTARES NONLD_AREA ONS_INNER SUB_2009
1 Barking and Dagenham E09000002 3779.934     169.15         F     <NA>
  SUB_2006                       geometry hotels_n airbnbs_n
1     <NA> MULTIPOLYGON (((543905.4 18...        1        45
> View(Hotels_sum)
> # the group by and summarise data = 1 Hotel!
> Hotels_sum %>%
+     filter(NAME=="Barking and Dagenham")
Simple feature collection with 1 feature and 3 fields
Geometry type: MULTIPOLYGON
Dimension:     XY
Bounding box:  xmin: 543417.3 ymin: 181434.1 xmax: 551944.6 ymax: 191137.3
Projected CRS: OSGB36 / British National Grid
# A tibble: 1 × 4
# Groups:   GSS_CODE [1]
  GSS_CODE  NAME                `Accomodation count`                  geometry
* <chr>     <chr>                              <int>        <MULTIPOLYGON [m]>
1 E09000002 Barking and Dagenh…                    1 (((543905.4 183199.1, 54…
> Hotels %>% filter(NAME=="Barking and Dagenham")
Simple feature collection with 1 feature and 11 fields
Geometry type: MULTIPOLYGON
Dimension:     XY
Bounding box:  xmin: 543417.3 ymin: 181434.1 xmax: 551944.6 ymax: 191137.3
Projected CRS: OSGB36 / British National Grid
                   NAME  GSS_CODE HECTARES NONLD_AREA ONS_INNER SUB_2009
32 Barking and Dagenham E09000002 3779.934     169.15         F     <NA>
   SUB_2006     osm_id code fclass               name
32     <NA> 9090311683 2401  hotel Barking Park Hotel
                         geometry
32 MULTIPOLYGON (((543905.4 18...
> 
> remotes::install_github("r-tmap/tmap")
错误于loadNamespace(x): 不存在叫‘remotes’这个名称的程序包

> install.packages("remotes")
WARNING: Rtools is required to build R packages but is not currently installed. Please download and install the appropriate version of Rtools before proceeding:

https://cran.rstudio.com/bin/windows/Rtools/
将程序包安装入‘C:/Users/DELL/AppData/Local/R/win-library/4.5’
(因为‘lib’没有被指定)
试开URL’https://cran.rstudio.com/bin/windows/contrib/4.5/remotes_2.5.0.zip'
                                                                                                                                                                                                     Content type 'application/zip' length 436467 bytes (426 KB)
                                                                                                                                                                                                     downloaded 426 KB
                                                                                                                                                                                                     
                                                                                                                                                                                                     程序包‘remotes’打开成功，MD5和检查也通过
                                                                                                                                                                                                     
                                                                                                                                                                                                     下载的二进制程序包在
                                                                                                                                                                                                     C:\Users\DELL\AppData\Local\Temp\RtmpuEDdEj\downloaded_packages里
                                                                                                                                                                                                     > 
                                                                                                                                                                                                       > remotes::install_github("r-tmap/tmap")
                                                                                                                                                                                                     Using GitHub PAT from the git credential store.
                                                                                                                                                                                                     Downloading GitHub repo r-tmap/tmap@HEAD
                                                                                                                                                                                                     These packages have more recent versions available.
                                                                                                                                                                                                     It is recommended to update all of them.
                                                                                                                                                                                                     Which would you like to update?
                                                                                                                                                                                                       
                                                                                                                                                                                                       1: All                       
                                                                                                                                                                                                     2: CRAN packages only        
                                                                                                                                                                                                     3: None                      
                                                                                                                                                                                                     4: xfun (0.53 -> 0.54) [CRAN]
                                                                                                                                                                                                     
                                                                                                                                                                                                     Enter one or more numbers, or an empty line to skip updates: 1
                                                                                                                                                                                                     otel         (NA   -> 0.2.0    ) [CRAN]
                                                                                                                                                                                                     promises     (NA   -> 1.5.0    ) [CRAN]
                                                                                                                                                                                                     later        (NA   -> 1.4.4    ) [CRAN]
                                                                                                                                                                                                     abind        (NA   -> 1.4-8    ) [CRAN]
                                                                                                                                                                                                     png          (NA   -> 0.1-8    ) [CRAN]
                                                                                                                                                                                                     lazyeval     (NA   -> 0.2.2    ) [CRAN]
                                                                                                                                                                                                     xfun         (0.53 -> 0.54     ) [CRAN]
                                                                                                                                                                                                     leaflet.p... (NA   -> 2.0.0    ) [CRAN]
                                                                                                                                                                                                     htmlwidgets  (NA   -> 1.6.4    ) [CRAN]
                                                                                                                                                                                                     crosstalk    (NA   -> 1.2.2    ) [CRAN]
                                                                                                                                                                                                     rapidjsonr   (NA   -> 1.2.0    ) [CRAN]
                                                                                                                                                                                                     sfheaders    (NA   -> 0.4.4    ) [CRAN]
                                                                                                                                                                                                     jsonify      (NA   -> 1.2.2    ) [CRAN]
                                                                                                                                                                                                     geometries   (NA   -> 0.2.4    ) [CRAN]
                                                                                                                                                                                                     logger       (NA   -> 0.4.1    ) [CRAN]
                                                                                                                                                                                                     httpuv       (NA   -> 1.6.16   ) [CRAN]
                                                                                                                                                                                                     XML          (NA   -> 3.99-0.19) [CRAN]
                                                                                                                                                                                                     stars        (NA   -> 0.6-8    ) [CRAN]
                                                                                                                                                                                                     lwgeom       (NA   -> 0.2-14   ) [CRAN]
                                                                                                                                                                                                     slippymath   (NA   -> 0.3.1    ) [CRAN]
                                                                                                                                                                                                     leaflet      (NA   -> 2.2.3    ) [CRAN]
                                                                                                                                                                                                     geojsonsf    (NA   -> 2.0.3    ) [CRAN]
                                                                                                                                                                                                     spacesXYZ    (NA   -> 1.6-0    ) [CRAN]
                                                                                                                                                                                                     colorspace   (NA   -> 2.1-2    ) [CRAN]
                                                                                                                                                                                                     stringdist   (NA   -> 0.9.15   ) [CRAN]
                                                                                                                                                                                                     servr        (NA   -> 0.32     ) [CRAN]
                                                                                                                                                                                                     tmaptools    (NA   -> 3.3      ) [CRAN]
                                                                                                                                                                                                     maptiles     (NA   -> 0.10.0   ) [CRAN]
                                                                                                                                                                                                     leafsync     (NA   -> 0.1.0    ) [CRAN]
                                                                                                                                                                                                     leaflegend   (NA   -> 1.2.1    ) [CRAN]
                                                                                                                                                                                                     leafgl       (NA   -> 0.2.2    ) [CRAN]
                                                                                                                                                                                                     leafem       (NA   -> 0.2.5    ) [CRAN]
                                                                                                                                                                                                     cols4all     (NA   -> 0.10     ) [CRAN]
                                                                                                                                                                                                     Installing 33 packages: otel, promises, later, abind, png, lazyeval, xfun, leaflet.providers, htmlwidgets, crosstalk, rapidjsonr, sfheaders, jsonify, geometries, logger, httpuv, XML, stars, lwgeom, slippymath, leaflet, geojsonsf, spacesXYZ, colorspace, stringdist, servr, tmaptools, maptiles, leafsync, leaflegend, leafgl, leafem, cols4all
                                                                                                                                                                                                     将程序包安装入‘C:/Users/DELL/AppData/Local/R/win-library/4.5’
                                                                                                                                                                                                     (因为‘lib’没有被指定)
                                                                                                                                                                                                     
                                                                                                                                                                                                     有二进制版本，但源代码版本更新:
                                                                                                                                                                                                       binary source needs_compilation
                                                                                                                                                                                                     promises  1.4.0  1.5.0             FALSE
                                                                                                                                                                                                     
                                                                                                                                                                                                     试开URL’https://cran.rstudio.com/bin/windows/contrib/4.5/otel_0.2.0.zip'
试开URL’https://cran.rstudio.com/bin/windows/contrib/4.5/later_1.4.4.zip'
                                                                                                                                                                                                     试开URL’https://cran.rstudio.com/bin/windows/contrib/4.5/abind_1.4-8.zip'
试开URL’https://cran.rstudio.com/bin/windows/contrib/4.5/png_0.1-8.zip'
                                                                                                                                                                                                     试开URL’https://cran.rstudio.com/bin/windows/contrib/4.5/lazyeval_0.2.2.zip'
试开URL’https://cran.rstudio.com/bin/windows/contrib/4.5/xfun_0.54.zip'
                                                                                                                                                                                                     试开URL’https://cran.rstudio.com/bin/windows/contrib/4.5/leaflet.providers_2.0.0.zip'
试开URL’https://cran.rstudio.com/bin/windows/contrib/4.5/htmlwidgets_1.6.4.zip'
                                                                                                                                                                                                     试开URL’https://cran.rstudio.com/bin/windows/contrib/4.5/crosstalk_1.2.2.zip'
试开URL’https://cran.rstudio.com/bin/windows/contrib/4.5/rapidjsonr_1.2.0.zip'
                                                                                                                                                                                                     试开URL’https://cran.rstudio.com/bin/windows/contrib/4.5/sfheaders_0.4.4.zip'
试开URL’https://cran.rstudio.com/bin/windows/contrib/4.5/jsonify_1.2.2.zip'
                                                                                                                                                                                                     试开URL’https://cran.rstudio.com/bin/windows/contrib/4.5/geometries_0.2.4.zip'
试开URL’https://cran.rstudio.com/bin/windows/contrib/4.5/logger_0.4.1.zip'
                                                                                                                                                                                                     试开URL’https://cran.rstudio.com/bin/windows/contrib/4.5/httpuv_1.6.16.zip'
试开URL’https://cran.rstudio.com/bin/windows/contrib/4.5/XML_3.99-0.19.zip'
                                                                                                                                                                                                     试开URL’https://cran.rstudio.com/bin/windows/contrib/4.5/stars_0.6-8.zip'
试开URL’https://cran.rstudio.com/bin/windows/contrib/4.5/lwgeom_0.2-14.zip'
                                                                                                                                                                                                     试开URL’https://cran.rstudio.com/bin/windows/contrib/4.5/slippymath_0.3.1.zip'
试开URL’https://cran.rstudio.com/bin/windows/contrib/4.5/leaflet_2.2.3.zip'
                                                                                                                                                                                                     试开URL’https://cran.rstudio.com/bin/windows/contrib/4.5/geojsonsf_2.0.3.zip'
试开URL’https://cran.rstudio.com/bin/windows/contrib/4.5/spacesXYZ_1.6-0.zip'
                                                                                                                                                                                                     试开URL’https://cran.rstudio.com/bin/windows/contrib/4.5/colorspace_2.1-2.zip'
试开URL’https://cran.rstudio.com/bin/windows/contrib/4.5/stringdist_0.9.15.zip'
                                                                                                                                                                                                     试开URL’https://cran.rstudio.com/bin/windows/contrib/4.5/servr_0.32.zip'
试开URL’https://cran.rstudio.com/bin/windows/contrib/4.5/tmaptools_3.3.zip'
                                                                                                                                                                                                     试开URL’https://cran.rstudio.com/bin/windows/contrib/4.5/maptiles_0.10.0.zip'
试开URL’https://cran.rstudio.com/bin/windows/contrib/4.5/leafsync_0.1.0.zip'
                                                                                                                                                                                                     试开URL’https://cran.rstudio.com/bin/windows/contrib/4.5/leaflegend_1.2.1.zip'
试开URL’https://cran.rstudio.com/bin/windows/contrib/4.5/leafgl_0.2.2.zip'
                                                                                                                                                                                                     试开URL’https://cran.rstudio.com/bin/windows/contrib/4.5/leafem_0.2.5.zip'
试开URL’https://cran.rstudio.com/bin/windows/contrib/4.5/cols4all_0.10.zip'
                                                                                                                                                                                                     程序包‘otel’打开成功，MD5和检查也通过
                                                                                                                                                                                                     程序包‘later’打开成功，MD5和检查也通过
                                                                                                                                                                                                     程序包‘abind’打开成功，MD5和检查也通过
                                                                                                                                                                                                     程序包‘png’打开成功，MD5和检查也通过
                                                                                                                                                                                                     程序包‘lazyeval’打开成功，MD5和检查也通过
                                                                                                                                                                                                     程序包‘xfun’打开成功，MD5和检查也通过
                                                                                                                                                                                                     程序包‘leaflet.providers’打开成功，MD5和检查也通过
                                                                                                                                                                                                     程序包‘htmlwidgets’打开成功，MD5和检查也通过
                                                                                                                                                                                                     程序包‘crosstalk’打开成功，MD5和检查也通过
                                                                                                                                                                                                     程序包‘rapidjsonr’打开成功，MD5和检查也通过
                                                                                                                                                                                                     程序包‘sfheaders’打开成功，MD5和检查也通过
                                                                                                                                                                                                     程序包‘jsonify’打开成功，MD5和检查也通过
                                                                                                                                                                                                     程序包‘geometries’打开成功，MD5和检查也通过
                                                                                                                                                                                                     程序包‘logger’打开成功，MD5和检查也通过
                                                                                                                                                                                                     程序包‘httpuv’打开成功，MD5和检查也通过
                                                                                                                                                                                                     程序包‘XML’打开成功，MD5和检查也通过
                                                                                                                                                                                                     程序包‘stars’打开成功，MD5和检查也通过
                                                                                                                                                                                                     程序包‘lwgeom’打开成功，MD5和检查也通过
                                                                                                                                                                                                     程序包‘slippymath’打开成功，MD5和检查也通过
                                                                                                                                                                                                     程序包‘leaflet’打开成功，MD5和检查也通过
                                                                                                                                                                                                     程序包‘geojsonsf’打开成功，MD5和检查也通过
                                                                                                                                                                                                     程序包‘spacesXYZ’打开成功，MD5和检查也通过
                                                                                                                                                                                                     程序包‘colorspace’打开成功，MD5和检查也通过
                                                                                                                                                                                                     程序包‘stringdist’打开成功，MD5和检查也通过
                                                                                                                                                                                                     程序包‘servr’打开成功，MD5和检查也通过
                                                                                                                                                                                                     程序包‘tmaptools’打开成功，MD5和检查也通过
                                                                                                                                                                                                     程序包‘maptiles’打开成功，MD5和检查也通过
                                                                                                                                                                                                     程序包‘leafsync’打开成功，MD5和检查也通过
                                                                                                                                                                                                     程序包‘leaflegend’打开成功，MD5和检查也通过
                                                                                                                                                                                                     程序包‘leafgl’打开成功，MD5和检查也通过
                                                                                                                                                                                                     程序包‘leafem’打开成功，MD5和检查也通过
                                                                                                                                                                                                     程序包‘cols4all’打开成功，MD5和检查也通过
                                                                                                                                                                                                     
                                                                                                                                                                                                     下载的二进制程序包在
                                                                                                                                                                                                     C:\Users\DELL\AppData\Local\Temp\RtmpuEDdEj\downloaded_packages里
                                                                                                                                                                                                     安装源码包‘promises’
                                                                                                                                                                                                     试开URL’https://cran.rstudio.com/src/contrib/promises_1.5.0.tar.gz'
Content type 'application/x-gzip' length 3210294 bytes (3.1 MB)
downloaded 3.1 MB

* installing *source* package 'promises' ...
** this is package 'promises' version '1.5.0'
** package 'promises' successfully unpacked and MD5 sums checked
** using staged installation
** R
** inst
** byte-compile and prepare package for lazy loading
** help
*** installing help indices
*** copying figures
** building package indices
** installing vignettes
** testing if installed package can be loaded from temporary location
** testing if installed package can be loaded from final location
** testing if installed package keeps a record of temporary installation path
* DONE (promises)

下载的程序包在
	‘C:\Users\DELL\AppData\Local\Temp\RtmpuEDdEj\downloaded_packages’里
Running `R CMD build`...
* checking for file 'C:\Users\DELL\AppData\Local\Temp\RtmpuEDdEj\remotesd57461e67212\r-tmap-tmap-2b31be2/DESCRIPTION' ... OK
* preparing 'tmap':
* checking DESCRIPTION meta-information ... OK
* checking for LF line-endings in source and make files and shell scripts
* checking for empty or unneeded directories
* building 'tmap_4.2.0.9000.tar.gz'
将程序包安装入‘C:/Users/DELL/AppData/Local/R/win-library/4.5’
(因为‘lib’没有被指定)
* installing *source* package 'tmap' ...
** this is package 'tmap' version '4.2.0.9000'
** using staged installation
** R
** data
*** moving datasets to lazyload DB
** inst
** byte-compile and prepare package for lazy loading
** help
*** installing help indices
*** copying figures
** building package indices
** testing if installed package can be loaded from temporary location
** testing if installed package can be loaded from final location
** testing if installed package keeps a record of temporary installation path
* DONE (tmap)
> View(Hotels_sum)
> View(Londonborough)
> View(OSM)
> View(UK_outline)
> View(UK_outline)
> Hotels2 <-  st_join(OSM, Londonborough)
> London_data <-  st_join(London_borough_data1, London_borough_data2, join=st_equals)
错误: 找不到对象'London_borough_data1'

> library(tmap)
> 
> # change to "view" for an interactive map
> tmap_mode("plot")
ℹ tmap modes "plot" - "view"
ℹ toggle with tmap::ttm()
This message is displayed once per session.
> View(Accomodation_contained)
> View(Airbnb)
> View(Airbnb_sum)
> View(Airbnbs)
> View(Hotels)
> View(Hotels_example)
> View(Hotels_example)
> View(Hotels_sum)
> View(Londonborough)
> View(OSM)
> View(UK_outline)
> View(Worldcities)
> View(Worldcities2)
> View(Worldcities)
> tm1 <- tm_shape(Accomodation_contained) + 
+     # set the map layer
+     # try changing this to tm_symbols()
+     tm_polygons("hotels_n",
+                 col = "black", lwd=0.5, lty="dashed",)
> 
> # plot the map
> tm1
> # plot each map
> tm1 <- tm_shape(Accomodation_contained) + 
+     tm_polygons(fill ="hotels_n",
+                 col = "black", 
+                 lwd =0.5,
+                 lty="dashed",
+                 fill.chart = tm_chart_violin(),
+                 # above this was the same as before
+                 fill.scale = tm_scale_intervals(
+                     values="brewer.bu_pu",
+                     n=5,
+                     style="jenks"))
> library(colorblindcheck)
错误于library(colorblindcheck): 
  不存在叫‘colorblindcheck’这个名称的程序包

> install.packages("colorblindcheck")
WARNING: Rtools is required to build R packages but is not currently installed. Please download and install the appropriate version of Rtools before proceeding:

https://cran.rstudio.com/bin/windows/Rtools/
将程序包安装入‘C:/Users/DELL/AppData/Local/R/win-library/4.5’
(因为‘lib’没有被指定)
试开URL’https://cran.rstudio.com/bin/windows/contrib/4.5/colorblindcheck_1.0.4.zip'
                                                                                                                                                                                                     Content type 'application/zip' length 74560 bytes (72 KB)
                                                                                                                                                                                                     downloaded 72 KB
                                                                                                                                                                                                     
                                                                                                                                                                                                     程序包‘colorblindcheck’打开成功，MD5和检查也通过
                                                                                                                                                                                                     
                                                                                                                                                                                                     下载的二进制程序包在
                                                                                                                                                                                                     C:\Users\DELL\AppData\Local\Temp\RtmpuEDdEj\downloaded_packages里
                                                                                                                                                                                                     > 
                                                                                                                                                                                                       > library(colorblindcheck)
                                                                                                                                                                                                     警告信息:
                                                                                                                                                                                                       程序包‘colorblindcheck’是用R版本4.5.2 来建造的 
                                                                                                                                                                                                     > cols4all::c4a_gui()
                                                                                                                                                                                                     错误于loadNamespace(x): 不存在叫‘shiny’这个名称的程序包
                                                                                                                                                                                                     
                                                                                                                                                                                                     > library(colorblindcheck)
                                                                                                                                                                                                     > cols4all::c4a_gui()
                                                                                                                                                                                                     错误于loadNamespace(x): 不存在叫‘shiny’这个名称的程序包
                                                                                                                                                                                                     
                                                                                                                                                                                                     > install.packages("colorspace")
                                                                                                                                                                                                     WARNING: Rtools is required to build R packages but is not currently installed. Please download and install the appropriate version of Rtools before proceeding:
                                                                                                                                                                                                       
                                                                                                                                                                                                       https://cran.rstudio.com/bin/windows/Rtools/
                                                                                                                                                                                                       将程序包安装入‘C:/Users/DELL/AppData/Local/R/win-library/4.5’
                                                                                                                                                                                                     (因为‘lib’没有被指定)
                                                                                                                                                                                                     试开URL’https://cran.rstudio.com/bin/windows/contrib/4.5/colorspace_2.1-2.zip'
Content type 'application/zip' length 2675867 bytes (2.6 MB)
downloaded 2.6 MB

程序包‘colorspace’打开成功，MD5和检查也通过
警告: 无法删除软件包 ‘colorspace’ 的先前安装
警告: 回复了‘colorspace’

下载的二进制程序包在
	C:\Users\DELL\AppData\Local\Temp\RtmpuEDdEj\downloaded_packages里
警告信息:
In file.copy(savedcopy, lib, recursive = TRUE) :
  拷贝C:\Users\DELL\AppData\Local\R\win-library\4.5\00LOCK\colorspace\libs\x64\colorspace.dll到C:\Users\DELL\AppData\Local\R\win-library\4.5\colorspace\libs\x64\colorspace.dll时出了问题：Permission denied

> library(colorblindcheck)
> cols4all::c4a_gui()
错误于loadNamespace(x): 不存在叫‘shiny’这个名称的程序包

> install.packages("colorspace")
WARNING: Rtools is required to build R packages but is not currently installed. Please download and install the appropriate version of Rtools before proceeding:

https://cran.rstudio.com/bin/windows/Rtools/
将程序包安装入‘C:/Users/DELL/AppData/Local/R/win-library/4.5’
(因为‘lib’没有被指定)
试开URL’https://cran.rstudio.com/bin/windows/contrib/4.5/colorspace_2.1-2.zip'
                                                                                                                                                                                                     Content type 'application/zip' length 2675867 bytes (2.6 MB)
                                                                                                                                                                                                     downloaded 2.6 MB
                                                                                                                                                                                                     
                                                                                                                                                                                                     程序包‘colorspace’打开成功，MD5和检查也通过
                                                                                                                                                                                                     警告: 无法删除软件包 ‘colorspace’ 的先前安装
                                                                                                                                                                                                     警告: 回复了‘colorspace’
                                                                                                                                                                                                     
                                                                                                                                                                                                     下载的二进制程序包在
                                                                                                                                                                                                     C:\Users\DELL\AppData\Local\Temp\RtmpuEDdEj\downloaded_packages里
                                                                                                                                                                                                     警告信息:
                                                                                                                                                                                                       In file.copy(savedcopy, lib, recursive = TRUE) :
                                                                                                                                                                                                       拷贝C:\Users\DELL\AppData\Local\R\win-library\4.5\00LOCK\colorspace\libs\x64\colorspace.dll到C:\Users\DELL\AppData\Local\R\win-library\4.5\colorspace\libs\x64\colorspace.dll时出了问题：Permission denied
                                                                                                                                                                                                     
                                                                                                                                                                                                     > install.packages("colorspace", INSTALL_opts="--no-lock")
                                                                                                                                                                                                     WARNING: Rtools is required to build R packages but is not currently installed. Please download and install the appropriate version of Rtools before proceeding:
                                                                                                                                                                                                       
                                                                                                                                                                                                       https://cran.rstudio.com/bin/windows/Rtools/
                                                                                                                                                                                                       将程序包安装入‘C:/Users/DELL/AppData/Local/R/win-library/4.5’
                                                                                                                                                                                                     (因为‘lib’没有被指定)
                                                                                                                                                                                                     试开URL’https://cran.rstudio.com/bin/windows/contrib/4.5/colorspace_2.1-2.zip'
Content type 'application/zip' length 2675867 bytes (2.6 MB)
downloaded 2.6 MB

程序包‘colorspace’打开成功，MD5和检查也通过
警告: 无法删除软件包 ‘colorspace’ 的先前安装
警告: 回复了‘colorspace’

下载的二进制程序包在
	C:\Users\DELL\AppData\Local\Temp\RtmpuEDdEj\downloaded_packages里
警告信息:
In file.copy(savedcopy, lib, recursive = TRUE) :
  拷贝C:\Users\DELL\AppData\Local\R\win-library\4.5\00LOCK\colorspace\libs\x64\colorspace.dll到C:\Users\DELL\AppData\Local\R\win-library\4.5\colorspace\libs\x64\colorspace.dll时出了问题：Permission denied

> stats <- Accomodation_contained %>%
+     st_drop_geometry() %>%
+     dplyr::select(hotels_n, airbnbs_n) %>%  
+     summarise(across(everything(), list(
+         min = min,
+         max = max,
+         mean = mean,
+         median = median,
+         sd = sd
+     )))
> View(tm1)
> library(classInt)
> # Get Jenks breaks for 5 classes
> breaks <- Accomodation_contained%>%
+     st_drop_geometry()%>%
+     #need a numeric vector not a dataframe or tibble
+     pull(airbnbs_n) %>%             
+     classIntervals(., n = 5, style = "jenks")
> 
> breaks$brks
[1]   4  22  45  68 122 253
> tm1 <- tm_shape(Accomodation_contained) +
+     tm_polygons(
+         fill = c("hotels_n", "airbnbs_n"),
+         fill.scale = tm_scale_intervals(values = "brewer.blues", breaks=breaks$brks),
+         # set the legend
+         fill.legend = tm_legend(title="Accomodation count",
+                                 title.size=0.85,
+                                 size=0.8,
+                                 # plot outside of the main map
+                                 #explained below
+                                 position=tm_pos_out("right", 
+                                                     "center",
+                                                     pos.v = "center")),
+         # all facets share the same legend
+         fill.free = FALSE)+
+     # make 2 rows for the facets
+     tm_facets(nrow=2)
> View(tm1)
> tm1
警告信息:
Values have found that are less than the lowest break. They are assigned to the lowest interval 

> # change headings or remove
> 
> tm2 <- tm1+
+     tm_layout(panel.labels=c("Hotels", "Airbnb"),
+               panel.show = TRUE
+               #panel.label.bg.color = "transparent",
+     )+
+     
+     tm_compass(type= "arrow",
+                size=1.8, 
+                position = tm_pos_out("right", 
+                                      "center",
+                                      pos.h= -0.05,
+                                      pos.v =0.72))+
+     tm_scalebar(text.size = 0.7,
+                 width=10,
+                 breaks=c(0,10,20),
+                 position = tm_pos_out("right",
+                                       "center", 
+                                       pos.h=0.075,
+                                       pos.v = 0.68))+
+     # we could use tm_credits to place sub-titles like (A) or (B)
+     # on the map.
+     tm_credits("(c) OpenStreetMap contrbutors and Air b n b",
+                size=0.6,
+                position = tm_pos_out("center",
+                                      "bottom",
+                                      pos.v = 1.5,
+                                      pos.h=-0.02))
> 
> tm2
For 'tm_scalebar()', 'breaks' and 'width' are not supposed to be used together; normally, setting the exact width is not needed when breaks have been specified.FALSE
警告信息:
Values have found that are less than the lowest break. They are assigned to the lowest interval 
> 
> tm_scalebar(
+     breaks = c(0, 10, 20),
+     text.size = 0.7
+ )
[nothing to show] no data layers defined
> 
> tm2 <- tm1 +
+     tm_scalebar(
+         breaks = c(0, 10, 20),
+         text.size = 0.7
+     )
> 
> tm2
警告信息:
Values have found that are less than the lowest break. They are assigned to the lowest interval 
> 
> tmap_save(tm2, "prac5_data/1_facet.png", width = 8, height = 6, units="in", dpi = 300)
Map saved to E:\UCL COURSE\GIS\WK5\Practice\prac5_data\1_facet.png
Resolution: 2400 by 1800 pixels
Size: 8 by 6 inches (300 dpi)
警告信息:
Values have found that are less than the lowest break. They are assigned to the lowest interval 

> tm2 <- tm1 + tm_polygons("hotels_n", style = "quantile")

── tmap v3 code detected ─────────────────────────────────────────────────────
[v3->v4] `tm_polygons()`: instead of `style = "quantile"`, use fill.scale =
`tm_scale_intervals()`.
ℹ Migrate the argument(s) 'style' to 'tm_scale_intervals(<HERE>)'
> tm2
警告信息:
Values have found that are less than the lowest break. They are assigned to the lowest interval 
> 
> tm2 <- tm_shape(Accomodation_contained) +
+     tm_polygons(
+         fill = "hotels_n"
+     ) +
+     tm_scale_intervals(
+         "hotels_n",
+         style = "quantile"   # 分类方法保留
+     )
> tm2
> map_hotels <- map_hotels +
+     tm_compass(type = "arrow", size = 2) +
+     tm_scale_bar() +
+     tm_credits("(A) Hotels")
错误: 找不到对象'map_hotels'

> tmap_mode("plot")
ℹ tmap modes "plot" - "view"
> 
> tm2 <- tm1 +
+     tm_polygons(fill = "hotels_n") +
+     tm_facets(by = "type") +    # <-- 保持面板
+     tm_scale_intervals("hotels_n", style = "quantile") +
+     
+     # ✅ 北针 & 比例尺必须在 facets 之后
+     tm_compass(type = "arrow", size = 2, position = c("right", "top")) +
+     tm_scale_bar(position = c("right", "bottom")) +
+     
+     tm_layout(panel.show = TRUE)
! `tm_scale_bar()` is deprecated. Please use `tm_scalebar()` instead.
> 
> tm2
错误: unknown facet variables
此外: 警告信息:
Multiple tm_facets defined per layer group. Only the last one is processed 

> tmap_mode("plot")
ℹ tmap modes "plot" - "view"
> 
> tm2 <- tm1 +
+     tm_polygons(fill = "hotels_n") +
+     tm_facets(by = "type") +    # <-- 保持面板
+     tm_scale_intervals("hotels_n", style = "quantile") +
+     
+     # ✅ 北针 & 比例尺必须在 facets 之后
+     tm_compass(type = "arrow", size = 2, position = c("right", "top")) +
+     tm_scale_bar(position = c("right", "bottom")) +
+     
+     tm_layout(panel.show = TRUE)
! `tm_scale_bar()` is deprecated. Please use `tm_scalebar()` instead.
> 
> tm2
错误: unknown facet variables
此外: 警告信息:
Multiple tm_facets defined per layer group. Only the last one is processed 

> tm2 <- tm1 +
+     tm_layout(
+         panel.labels = c("Hotels", "Airbnb"),
+         panel.show = TRUE
+     ) +
+     
+     # Compass
+     tm_compass(type = "arrow",
+                size = 2,
+                position = c("right", "top")) +
+     
+     # Scale bar (simple version to avoid conflict)
+     tm_scale_bar(
+         text.size = 0.7,
+         breaks = c(0, 5, 10)
+     ) +
+     
+     tm_credits("(c) OpenStreetMap contributors & Airbnb",
+                size = 0.6,
+                position = c("center", "bottom"))
! `tm_scale_bar()` is deprecated. Please use `tm_scalebar()` instead.
> 
> tm2
警告信息:
Values have found that are less than the lowest break. They are assigned to the lowest interval 
> 
> qtm(UK_outline)
> newbb <- c(xmin=-296000, ymin=5408, xmax=655696, ymax=1000000)
> 
> UK_outlinecrop <- UK_outline$geometry %>%
+     st_crop(., newbb)
> tm3 <- tm_shape(UK_outlinecrop)+ 
+     tm_polygons(col="darkslategray1")+
+     tm_layout(frame=FALSE)+
+     tm_shape(Worldcities2) +
+     #adds the city points
+     tm_symbols(shape=20,
+                fill = "orange",
+                #outline colour
+                col="black",
+                size=0.8)+
+     #add the city labels, x and y move the label around the point
+     tm_text("CITY_NAME", xmod=-1, ymod=-0.5)
> 
> 
> tm3
> inset <- tmap_grob(tm4, asp=1.1)
错误: 找不到对象'tm4'

> # st_bbox gives the bounding x and y coordinates 
> Londonbb <- st_bbox(Accomodation_contained,
+                     crs = st_crs(Accomodation_contained))%>%
+     # st_as_sfc coverts the coordinates to an sf object
+     st_as_sfc()
> 
> tm4 <- tm3 +
+     tm_shape(Londonbb)+ 
+     tm_borders(col = "grey40", lwd = 3)+
+     tm_layout(frame=FALSE,
+               bg.color = "transparent")
> inset <- tmap_grob(tm4, asp=1.1)
> 
> final_map<- tm2+
+     tm_inset(inset,
+              position = tm_pos_out("right", "center"))
> tmap_save(final_map, "prac5_data/2_facet.png", width = 8, height = 6, units="in", dpi = 300)
Map saved to E:\UCL COURSE\GIS\WK5\Practice\prac5_data\2_facet.png
Resolution: 2400 by 1800 pixels
Size: 8 by 6 inches (300 dpi)
警告信息:
Values have found that are less than the lowest break. They are assigned to the lowest interval 

> library(ggplot2)
> 
> accom_long <- Accomodation_contained %>%
+     # drop geometry for plotting
+     st_drop_geometry() %>%  
+     pivot_longer(
+         cols = c(hotels_n, airbnbs_n),
+         names_to = "accom_type",
+         values_to = "count"
+     )
> violin <- accom_long %>%
+     ggplot(aes(x = accom_type, 
+                # number
+                y = count, 
+                # hotels or airbnb 
+                fill = accom_type)) +
+     geom_violin(trim = FALSE, 
+                 color = "grey30", 
+                 alpha = 0.8) +
+     scale_fill_brewer(palette = "Pastel1") +
+     labs(
+         title = "",
+         x = "",
+         y = "",
+         fill = "black"
+     ) +
+     # change the labels from the column names to..
+     scale_x_discrete(labels = c("hotels_n" = "Hotels", 
+                                 "airbnbs_n" = "Airbnbs"))+
+     theme_minimal(base_size = 13)+
+     theme(
+         # no legend
+         legend.position = "none",
+         # all text to black
+         text = element_text(color = "black"),         # set all text to black
+         axis.text = element_text(color = "black"),    # axis tick labels
+         axis.title = element_text(color = "black"),   # axis titles (if used)
+         plot.title = element_text(color = "black")    # title (if used)
+ library(grid)
错误: 意外的符号 于
"        plot.title = element_text(color = "black")    # title (if used)
library"

> library(grid)
> # Open PNG device
> png("prac5_data/3_facet.png", width = 8, height = 6, units="in", res = 300)
> 
> tm2
警告信息:
Values have found that are less than the lowest break. They are assigned to the lowest interval 
> print(tm4, vp = viewport(x=0.68, y= 0.25, width = 0.3, height = 0.35))
> print(violin, vp = viewport(x=0.67, y= 0.83, width = 0.25, height = 0.35))
错误: 找不到对象'violin'

> violin <- accom_long %>%
+     ggplot(aes(x = accom_type, 
+                # number
+                y = count, 
+                # hotels or airbnb 
+                fill = accom_type)) +
+     geom_violin(trim = FALSE, 
+                 color = "grey30", 
+                 alpha = 0.8) +
+     scale_fill_brewer(palette = "Pastel1") +
+     labs(
+         title = "",
+         x = "",
+         y = "",
+         fill = "black"
+     ) +
+     # change the labels from the column names to..
+     scale_x_discrete(labels = c("hotels_n" = "Hotels", 
+                                 "airbnbs_n" = "Airbnbs"))+
+     theme_minimal(base_size = 13)+
+     theme(
+         # no legend
+         legend.position = "none",
+         # all text to black
+         text = element_text(color = "black"),         # set all text to black
+         axis.text = element_text(color = "black"),    # axis tick labels
+         axis.title = element_text(color = "black"),   # axis titles (if used)
+         plot.title = element_text(color = "black")    # title (if used)
+     )
> library(grid)
> 
> # Open PNG device
> png("prac5_data/3_facet.png", width = 8, height = 6, units="in", res = 300)
> 
> tm2
警告信息:
Values have found that are less than the lowest break. They are assigned to the lowest interval 
> print(tm4, vp = viewport(x=0.68, y= 0.25, width = 0.3, height = 0.35))
> print(violin, vp = viewport(x=0.67, y= 0.83, width = 0.25, height = 0.35))
> 