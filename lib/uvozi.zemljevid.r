# Uvoz potrebnih knjižnic
library(rgdal)
library(dplyr)
library(readr)
library(ggplot2)
library(digest)
library(mosaic)
uvozi.zemljevid <- function(url, ime.zemljevida, pot.zemljevida="",
                            mapa="../zemljevidi", encoding=NULL, force=FALSE) {
  zgostitev <- digest(url, algo="sha1")
  map <- paste0(mapa, "/", zgostitev)
  pot <- paste0(map, "/", pot.zemljevida)
  shp <- paste0(pot, "/", ime.zemljevida, ".shp")
  zip <- paste0(map, "/", zgostitev, ".zip")
  if (force || !file.exists(shp)) {
    if (!file.exists(map)) {
      dir.create(map, recursive=TRUE)
    }
    download.file(url, zip)
    unzip(zip, exdir=map)
  }
  re <- paste0("^", gsub("\\.", "\\.", ime.zemljevida), "\\.")
  files <- grep(paste0(re, "[a-z0-9.]*$"),
                grep(paste0(re, ".*$"), dir(pot), value=TRUE),
                value=TRUE, invert=TRUE)
  file.rename(paste0(map, "/", files),
              paste0(map, "/", sapply(strsplit(files, "\\."),
                                      function(x)
                                        paste(c(x[1:(length(x)-1)], tolower(x[length(x)])),
                                              collapse="."))))
  zemljevid <- readOGR(shp, ime.zemljevida)
  
  if (!is.null(encoding)) {
    loc <- locale(encoding=encoding)
    for (col in names(zemljevid)) {
      if (is.factor(zemljevid[[col]])) {
        zemljevid[[col]] <- zemljevid[[col]] %>% as.character() %>%
          parse_character(locale=loc) %>% factor()
      }
    }
  }
  
  return(zemljevid)
}

