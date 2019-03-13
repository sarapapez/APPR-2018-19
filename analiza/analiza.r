# 4. faza: Analiza podatkov

#tabela za grupiranje
podatki <- right_join(stevilo_novonastalih_podjetij, stevilo_hitrorastocih_podjetij %>% filter(leto == 2014))

podatki1 <- right_join(podatki, stevilo_podjetij_ki_so_prenehala_z_delovanjem %>% filter(leto == 2014))
podatki1$leto <- NULL
row.names(podatki1) <- podatki1$regije
podatki1$regije <- NULL
podatki.norm <- podatki1 %>% scale()

# graf za grupiranje v shiny

graf.zemljevid <- function(st){
  k <- kmeans(podatki.norm, st, nstart=1000)
  skupine <- data.frame(regije=row.names(podatki.norm), skupine=factor(k$cluster))
  ggplot(right_join(zemljevid,skupine, by=c("NAME_1"="regije"))) + geom_polygon() + 
    aes(x=long, y=lat, group=group, fill=skupine) + xlab("") + ylab("") + theme_minimal()
  
}


