#začetni graf

mojgraf1 <- ggplot(stevilo_podjetij_ki_so_prenehala_z_delovanjem, aes(x=leto, 
            y=stevilopropadlih, group=regije, color=regije)) + geom_line() + 
  xlab("Leto") + ylab("Število podjetij, ki so prenehala z delovanjem") + 
  ggtitle("Graf števila propadlih podjetij") + scale_color_discrete(name="Regije", 
  labels=c("Gorenjska", "Goriška", "Jugovzhodna Slovenija", "Koroška", "Obalno-kraška", "Osrednjeslovenska", "Podravska", "Pomurska", "Posavska", "Primorsko-notranjska", "Savinjska", "Zasavska")) + theme(axis.text.x = element_text(angle = 90, vjust = 0.3, hjust=1))




mojgraf <- ggplot(stevilo_zaposlenih_v_podjetjih, aes(x=leto, y=stevilozaposlenih, group=regije, color=regije)) + geom_line() + xlab("Leto") + ylab("Število podjetij, ki so prenehala z delovanjem") + ggtitle("Graf števila propadlih podjetij") + scale_color_discrete(name="Regije", labels=c("Gorenjska", "Goriška", "Jugovzhodna Slovenija", "Koroška", "Obalno-kraška", "Osrednjeslovenska", "Podravska", "Pomurska", "Posavska", "Primorsko-notranjska", "Savinjska", "Zasavska")) + theme(axis.text.x = element_text(angle = 90, vjust = 0.3, hjust=1))





#najprej sem naplošno pogledala koliko podjetij imamo v sloveniji..izkjazalo se je da jih je najvec v 
#osrednjeslovenski regiji. ker je ta tudi največja ima največ podjetij. zato bom to regijo bolj podrobno 
#analizirala.

graf1 <-  ggplot(stevilo_podjetij, aes(x=leto, y=stevilopodjetij,
                                                     group=regije, color=regije)) + geom_line() + xlab("Leto") + 
  ylab("Število podjetij") + 
  ggtitle("Število podjetij") + 
  scale_color_discrete(name="Regije", labels=c("Gorenjska", "Goriška", "Jugovzhodna Slovenija",
                                               "Koroška", "Obalno-kraška", "Osrednjeslovenska", "Podravska", "Pomurska", "Posavska",
                                               "Primorsko-notranjska", "Savinjska", "Zasavska")) + theme(axis.text.x = element_text
                                                                                                         (angle = 90, vjust = 0.3, hjust=1))
#videli smo da graf števila podjetij ni ravno zanimiv. saj linearno narašča. bolj je zanimiv graf 
#stevila hitrorastočih podjetij



graf2 <- ggplot(stevilo_hitrorastocih_podjetij, aes(x=leto, y=stevilo,
        group=regije, color=regije)) + geom_line() + xlab("Leto") + 
  ylab("Število hitrorastočih podjetij") + 
  ggtitle("Število hitrorastočih podjetij") + 
  scale_color_discrete(name="Regije", labels=c("Gorenjska", "Goriška", "Jugovzhodna Slovenija",
"Koroška", "Obalno-kraška", "Osrednjeslovenska", "Podravska", "Pomurska", "Posavska",
"Primorsko-notranjska", "Savinjska", "Zasavska")) + theme(axis.text.x = element_text
                    (angle = 90, vjust = 0.1, hjust=1))





stevilo_brezposelnih.stevilo.propadlih.podjetij <-right_join(stevilo_zaposlenih_v_podjetjih, 
            stevilo_podjetij_ki_so_prenehala_z_delovanjem %>% filter(leto == 2016))



#graf povezave med številom podjetji in stevilom zaposlenih v podjetjih
o <- (stevilo_zaposlenih_v_podjetjih)
u <- (stevilo_podjetij)
b <- right_join(o,u)

graf3 <- ggplot(b) + geom_point(aes(x=stevilopodjetij, y=stevilozaposlenih, color=regije)) + geom_smooth(aes(x=stevilopodjetij, y=stevilozaposlenih)) + xlab("Število podjetij") + 
  ylab("Število zaposlenih v podjetijh") + ggtitle("Število podjetij v primerjavi s številom zaposlenih") + 
  scale_color_discrete(name="Regije", labels=c("Gorenjska", "Goriška",
                                    "Jugovzhodna Slovenija",
                                               "Koroška", "Obalno-kraška", "Osrednjeslovenska", "Podravska", "Pomurska", "Posavska",
                                               "Primorsko-notranjska", "Savinjska", "Zasavska")) 


#graf povezave med stevilom brezposelnih v sloveniji in 
#stevilom podjetji ki so prenehala z delovanjem
i <- (stevilo_brezposelnih)
r <- (stevilo_podjetij_ki_so_prenehala_z_delovanjem)
hh <- right_join(i,r)

graf4 <- ggplot(hh) + geom_point(aes(x=stevilobrezposelnih, y=stevilopropadlih, color=regije)) + geom_smooth( aes(x=stevilobrezposelnih, y=stevilopropadlih)) + xlab("Število brezposelnih") + 
  ylab("Število podjetji, ki so prenehala z delovanjem") + ggtitle("Število brezposelnih v primerjavi s propadlimi podjetji") + 
  scale_color_discrete(name="Regije", labels=c("Gorenjska", "Goriška",
                                               "Jugovzhodna Slovenija",
                                               "Koroška", "Obalno-kraška", "Osrednjeslovenska", "Podravska", "Pomurska", "Posavska",
                                              "Primorsko-notranjska", "Savinjska", "Zasavska"))


#se ena povezava

ii <- (stevilo_brezposelnih)
rr <- (stevilo_novonastalih_podjetij)
hhh <- right_join(ii,rr)

graf5 <- ggplot(hhh) + geom_point(aes(x=stevilobrezposelnih, y=stevilonovonastalih, color=regije)) + geom_smooth( aes(x=stevilobrezposelnih, y=stevilonovonastalih)) + xlab("Leto") + 
  ylab("Število novonastalih podjetij") + ggtitle("Število zaposlenih v podjetjih") + 
  scale_color_discrete(name="Regije", labels=c("Gorenjska", "Goriška",
                                               "Jugovzhodna Slovenija",
                                               "Koroška", "Obalno-kraška", "Osrednjeslovenska", "Podravska", "Pomurska", "Posavska",
                                               "Primorsko-notranjska", "Savinjska", "Zasavska"))


#se ena povezava
iii <- (stevilo_brezposelnih)
rrr <- (stevilo_podjetij)
hhhh <- right_join(iii,rrr)

graf6 <- ggplot(hhhh) + geom_point(aes(x=stevilobrezposelnih, y=stevilopodjetij, color=regije)) + geom_smooth( aes(x=stevilobrezposelnih, y=stevilopodjetij)) + xlab("Leto") + 
  ylab("Število novonastalih podjetij") + ggtitle("Število zaposlenih v podjetjih") + 
  scale_color_discrete(name="Regije", labels=c("Gorenjska", "Goriška",
                                               "Jugovzhodna Slovenija",
                                               "Koroška", "Obalno-kraška", "Osrednjeslovenska", "Podravska", "Pomurska", "Posavska",
                                               "Primorsko-notranjska", "Savinjska", "Zasavska"))





#1.graf


# Pie Chart with Percentages
#slices <- c(24250,85003 , 17827,75609, 9814,13440,35978,10574,210352,52094,31942,29149) 
#lbls <- c("Pomurska", "Podravska", "Koroška", "Savinjska", "Zasavska","Posavska","Jugovzhodna Slovenija","Primorsko-notranjska","Osrednjeslovenska","Gorenjska","Goriška","Obalno-kraška")
#pct <- round(slices/sum(slices)*100)
#lbls <- paste(lbls, pct) # add percents to labels 
#lbls <- paste(lbls,"%",sep="") # ad % to labels 
#graf1 <- pie(slices,labels = lbls, col=rainbow(length(lbls)),
 #   main="Število zaposlenih v podjetjih leta 2006")


#2.graf

# Pie Chart with Percentages
#slices <- c(20394,83259, 15486,70936, 9329,14368,14368,10945,214422,50211,29040,28843) 
#lbls <- c("Pomurska", "Podravska", "Koroška", "Savinjska", "Zasavska","Posavska","Jugovzhodna Slovenija","Primorsko-notranjska","Osrednjeslovenska","Gorenjska","Goriška","Obalno-kraška")
#pct <- round(slices/sum(slices)*100)
#lbls <- paste(lbls, pct) # add percents to labels 
#lbls <- paste(lbls,"%",sep="") # ad % to labels 
#graf2 <- pie(slices,labels = lbls, col=rainbow(length(lbls)),
 #   main="Število zaposlenih v podjetjih leta 2016")

#histogram stevila novonastalih podjetij
# Create data
data=data.frame(stevilo_novonastalih_podjetij)
# Barplot
graf7 <- ggplot(data, aes(x=leto, y=stevilonovonastalih)) +  xlab("Leto") + ylab("Število novonastalih podjetij") + 
  geom_bar(color="red",fill="red",stat = "identity")

# Uvozimo zemljevid.
zemljevid <- uvozi.zemljevid("http://biogeo.ucdavis.edu/data/gadm2.8/shp/SVN_adm_shp.zip",
                             "SVN_adm1", mapa = "zemljevid_Slovenije", encoding = "UTF-8")
zemljevid$NAME_1 <- c("Gorenjska", "Goriska","Jugovzhodna_Slovenija", "Koroska", "Primorsko-notranjska", "Obalno-kraska", "Osrednjeslovenska", "Podravska", "Pomurska", "Savinjska", "Posavska", "Zasavska")

zemljevid <- fortify(zemljevid)   

