M <- read_csv2("podatki/stevilo_podjetij1.csv", col_names=c("regije", 2006:2016),
                      skip=5, na="...", locale=locale(encoding="Windows-1250", 
                                                      decimal_mark = ",",
                                                      grouping_mark = "."),
               n_max = 12)



A <- read_csv2("podatki/stevilo_novonastalih_podjetij1.csv", col_names=c("regije", 2006:2016),
                skip=5, na="...", locale=locale(encoding="Windows-1250", 
                                                decimal_mark = ",",
                                                grouping_mark = "."), #ta pika je naprimer med miljonom ko se na vsake 3 da pika
                n_max = 12)

K <- read_csv2("podatki/stevilo_podjetij_ki_so_prenehala_z_delovanjem1.csv", col_names=c("regije", 2006:2016),
               skip=5, na="...", locale=locale(encoding="Windows-1250", 
                                               decimal_mark=",",
                                               grouping_mark="."),
               col_types=cols(regije=col_character(), .default=col_number()),
               n_max=12)
F <- read_csv2("podatki/stevilo_hitrorastocih_podjetij1.csv", col_names=c("regije", 2006:2014),
               skip=5, na="...", locale=locale(encoding="Windows-1250", 
                                               decimal_mark = ",",
                                               grouping_mark = "."),
               n_max = 12)


G <- read_csv2("podatki/stevilo_zaposlenih_v_podjetjih1.csv", col_names=c("regije", 2006:2016),
               skip=5, na="...", locale=locale(encoding="Windows-1250", 
                                               decimal_mark = ",",
                                               grouping_mark = "."),
               n_max = 12)

S <- read_csv2("podatki/stevilo_brezposelnih1.csv", col_names=c("regije", 2010:2016),
                    skip=5, na="...", locale=locale(encoding="Windows-1250", 
                                                    decimal_mark = ",",
                                                    grouping_mark = "."),
                    n_max = 12)



stevilo_podjetij <- melt(M, id.vars="regije", measure.vars=names(M)[-1], variable.name="leto", 
                         value.name="stevilopodjetij", na.rm=TRUE)
stevilo_novonastalih_podjetij <- melt(A, id.vars="regije", measure.vars=names(M)[-1], variable.name="leto", 
                         value.name="stevilonovonastalih", na.rm=TRUE)
stevilo_zaposlenih_v_podjetjih <- melt(G, id.vars="regije", measure.vars=names(M)[-1], variable.name="leto", 
                         value.name="stevilozaposlenih", na.rm=TRUE)
stevilo_podjetij_ki_so_prenehala_z_delovanjem <- melt(K, id.vars="regije", measure.vars=names(M)[-1], variable.name="leto", 
                               value.name="stevilopropadlih", na.rm=TRUE)
stevilo_hitrorastocih_podjetij <- melt(F, id.vars="regije", measure.vars=names(F)[-1], variable.name="leto", 
                         value.name="stevilo", na.rm=TRUE)
stevilo_brezposelnih <- melt(S, id.vars="regije", measure.vars=names(S)[-1], variable.name="leto", 
                                       value.name="stevilobrezposelnih", na.rm=TRUE)

