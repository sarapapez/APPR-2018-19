#najprej sem naplošno pogledala koliko podjetij imamo v sloveniji..izkjazalo se je da jih je najvec v 
#osrednjeslovenski regiji. ker je ta tudi največja ima največ podjetij. zato bom to regijo bolj podrobno 
#analizirala.

graf4 <-  ggplot(stevilo_podjetij, aes(x=leto, y=stevilopodjetij,
                                                     group=regije, color=regije)) + geom_line() + xlab("Leto") + 
  ylab("Število podjetij") + 
  ggtitle("Število podjetij") + 
  scale_color_discrete(name="Regije", labels=c("Gorenjska", "Goriška", "Jugovzhodna Slovenija",
                                               "Koroška", "Obalno-kraška", "Osrednjeslovenska", "Podravska", "Pomurska", "Posavska",
                                               "Primorsko-notranjska", "Savinjska", "Zasavska")) + theme(axis.text.x = element_text
                                                                                                         (angle = 90, vjust = 0.3, hjust=1))
#videli smo da graf števila podjetij ni ravno zanimiv. saj linearno narašča. bolj je zanimiv graf 
#stevila hitrorastočih podjetij



graf3 <- ggplot(stevilo_hitrorastocih_podjetij, aes(x=leto, y=stevilo,
        group=regije, color=regije)) + geom_line() + xlab("Leto") + 
  ylab("Število podjetij") + 
  ggtitle("Število podjetij") + 
  scale_color_discrete(name="Regije", labels=c("Gorenjska", "Goriška", "Jugovzhodna Slovenija",
"Koroška", "Obalno-kraška", "Osrednjeslovenska", "Podravska", "Pomurska", "Posavska",
"Primorsko-notranjska", "Savinjska", "Zasavska")) + theme(axis.text.x = element_text
                    (angle = 90, vjust = 0.3, hjust=1))





stevilo_brezposelnih.stevilo.propadlih.podjetij <-right_join(stevilo_zaposlenih_v_podjetjih, 
            stevilo_podjetij_ki_so_prenehala_z_delovanjem %>% filter(leto == 2016))



#graf povezave med številom podjetji in stevilom zaposlenih v podjetjih
o <- (stevilo_zaposlenih_v_podjetjih)
u <- (stevilo_novonastalih_podjetij)
b <- right_join(o,u)

graf9 <- ggplot(b) + geom_point(aes(x=stevilonovonastalih, y=stevilozaposlenih, color=regije)) + geom_smooth(aes(x=stevilonovonastalih, y=stevilozaposlenih)) + xlab("Leto") + 
  ylab("Število novonastalih podjetij") + ggtitle("Število zaposlenih v podjetjih") + 
  scale_color_discrete(name="Regije", labels=c("Gorenjska", "Goriška",
                                    "Jugovzhodna Slovenija",
                                               "Koroška", "Obalno-kraška", "Osrednjeslovenska", "Podravska", "Pomurska", "Posavska",
                                               "Primorsko-notranjska", "Savinjska", "Zasavska")) 


#graf povezave med 
i <- (stevilo_hitrorastocih_podjetij)
r <- (stevilo_novonastalih_podjetij)
hh <- right_join(i,r)
graf9 <- ggplot(b, aes(x=stevilonovonastalih, y=stevilozaposlenih)) +  geom_point() + geom_smooth() + xlab("Leto") + 
  ylab("Število novonastalih podjetij") + ggtitle("Število zaposlenih v podjetjih") + 
  scale_color_discrete(name="Regije", labels=c("Gorenjska", "Goriška",
                                               "Jugovzhodna Slovenija",
                                               "Koroška", "Obalno-kraška", "Osrednjeslovenska", "Podravska", "Pomurska", "Posavska",
                                               "Primorsko-notranjska", "Savinjska", "Zasavska")) 





#1.graf


# Pie Chart with Percentages
slices <- c(24250,85003 , 17827,75609, 9814,13440,35978,10574,210352,52094,31942,29149) 
lbls <- c("Pomurska", "Podravska", "Koroška", "Savinjska", "Zasavska","Posavska","Jugovzhodna Slovenija","Primorsko-notranjska","Osrednjeslovenska","Gorenjska","Goriška","Obalno-kraška")
pct <- round(slices/sum(slices)*100)
lbls <- paste(lbls, pct) # add percents to labels 
lbls <- paste(lbls,"%",sep="") # ad % to labels 
graf1 <- pie(slices,labels = lbls, col=rainbow(length(lbls)),
    main="Število zaposlenih v podjetjih leta 2006")


#2.graf

# Pie Chart with Percentages
slices <- c(20394,83259, 15486,70936, 9329,14368,14368,10945,214422,50211,29040,28843) 
lbls <- c("Pomurska", "Podravska", "Koroška", "Savinjska", "Zasavska","Posavska","Jugovzhodna Slovenija","Primorsko-notranjska","Osrednjeslovenska","Gorenjska","Goriška","Obalno-kraška")
pct <- round(slices/sum(slices)*100)
lbls <- paste(lbls, pct) # add percents to labels 
lbls <- paste(lbls,"%",sep="") # ad % to labels 
graf2 <- pie(slices,labels = lbls, col=rainbow(length(lbls)),
    main="Število zaposlenih v podjetjih leta 2016")



graf9 <- ggplot(stevilo_hitrorastocih_podjetij, aes(x=leto, y=stevilo,
                                                    group=regije, color=regije)) + geom_line() + xlab("Leto") + 
  ylab("Število podjetij") + 
  ggtitle("Število podjetij") + 
  scale_color_discrete(name="Regije", labels=c("Gorenjska", "Goriška", "Jugovzhodna Slovenija",
                                               "Koroška", "Obalno-kraška", "Osrednjeslovenska", "Podravska", "Pomurska", "Posavska",
                                               "Primorsko-notranjska", "Savinjska", "Zasavska")) + theme(axis.text.x = element_text
                                                                                                         (angle = 90, vjust = 0.3, hjust=1))





