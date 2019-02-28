# 4. faza: Analiza podatkov

#tabela za grupiranje
podatki <- right_join(stevilo_podjetij[c("regije","leto","eur_na_preb","delez_regionalnega_BDP")] %>% filter(leto == 2015), stevilo_novonastalih_podjetij[c("regije", "leto", "starostna_skupina", "delez_sta")] %>% filter (leto == 2015))
podatki$starostna_skupina <- NULL
names(podatki)[5] <- "0-14"
podatki <- right_join(podatki, stevilo_zaposlenih_v_podjetjih[c("regije", "leto", "starostna_skupina", "delez_sta")] %>% filter(leto == 2015))
podatki$starostna_skupina <- NULL
names(podatki)[6] <- "15-64"
podatki <- right_join(podatki, stevilo_zaposlenih_v_podjetjih[c("regije", "leto", "starostna_skupina", "delez_sta")] %>% filter(leto == 2015)) %>% filter(regije != "Slovenija")
podatki$leto <- NULL
podatki$starostna_skupina <- NULL
row.names(podatki) <- podatki$regije
podatki$regije <- NULL
podatki.norm <- podatki %>% scale()

# graf za grupiranje v shiny

graf.zemljevid <- function(st){
  k <- kmeans(podatki.norm, st, nstart=1000)
  skupine <- data.frame(regije=row.names(podatki.norm), skupine=factor(k$cluster))
  ggplot(right_join(zemljevid,skupine, by=c("NAME_1"="regije"))) + geom_polygon() + 
    aes(x=long, y=lat, group=group, fill=skupine) + xlab("") + ylab("") + theme_minimal()
  
}


#graf za shiny za ločevanje
graf.regije <- function(regija){
  ggplot(loceni.odpadki.regije %>% filter(regije %in% regija)) + aes(x=leto, y=delez, group=regije, color=regije) +
    geom_line() + geom_point()+ xlab("Leto") + ylab("Delež ločenih odpadkov (od nastalih) v %") +
    ggtitle("Graf deleža ločenih odpadkov") + theme(axis.text.x = element_text(angle = 90, vjust = 0.3, hjust=1))
}
