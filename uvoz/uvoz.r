M <- read_csv2("podatki/stevilo_podjetij.csv", col_names=c("leto", 2006:2016),
                      skip=5, na="...", locale=locale(encoding="Windows-1250", 
                                                      decimal_mark = ",",
                                                      grouping_mark = "."),
               n_max = 14)

A <- read_csv2("podatki/stevilo_novonastalih_podjetij.csv", col_names=c("leto", 2006:2016),
                skip=5, na="...", locale=locale(encoding="Windows-1250", 
                                                decimal_mark = ",",
                                                grouping_mark = "."), #ta pika je naprimer med miljonom ko se na vsake 3 da pika
                n_max = 14)

K <- read_csv2("podatki/stevilo_podjetij_ki_so_prenehala_z_delovanjem.csv", col_names=c("leto", 2006:2016),
               skip=5, na="...", locale=locale(encoding="Windows-1250", 
                                               decimal_mark = ",",
                                               grouping_mark = "."),
               n_max = 14)

