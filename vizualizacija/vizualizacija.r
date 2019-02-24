#graf.stevila.podjetij <- ggplot(stevilo_podjetij, filter(leto == 2006)) + 
 # aes(x=regije,y=stevilo) + geom_col() +
  #theme(axis.text.x = element_text(angle = 90, vjust = 0.3, hjust=1))

#graf.stevila.podjetij <- ggplot(stevilo_podjetij) + 
 # aes(x=regije, y=stevilo) + geom_col() + xlab("Statistične regije") + ylab("Nastali odpadki (kg na prebivalca)") +
  #ggtitle("Stolpični diagram nastalh odpadkov v letu 2010 za statistične regije Slovenije") + 
  #theme(axis.text.x = element_text(angle = 90, vjust = 0.3, hjust=1))



#ggplot(stevilo_podjetij_ki_so_prenehala_z_delovanjem, filter(leto == 2010), aes(x=leto, y=stevilo, group=regije, color=regije)) + geom_line() + xlab("Leto") + ylab("Število podjetij, ki so prenehala z delovanjem") + ggtitle("Graf števila propadlih podjetij") + scale_color_discrete(name="Regije", labels=c("Gorenjska", "Goriška", "Jugovzhodna Slovenija", "Koroška", "Obalno-kraška", "Osrednjeslovenska", "Podravska", "Pomurska", "Posavska", "Primorsko-notranjska", "Savinjska", "Zasavska")) + theme(axis.text.x = element_text(angle = 90, vjust = 0.3, hjust=1))

#graf.loceni.odpadki.regije.2002 <- ggplot(stevilo_podjetij, filter(regije != 'Pomurska', leto == 2007)) + 
 # aes(x=leto, y=stevilo) + geom_col() + theme(axis.text.x = element_text(angle = 90, vjust = 0.3, hjust=1))


#tabela1 <- right_join(stevilo_brezposelnih, stevilo_podjetij_ki_so_prenehala_z_delovanjem, )
starostne.skupine.regije <- right_join(stevilo_hitrorastocih_podjetij, stevilo_zaposlenih_v_podjetjih %>% 
                                         group_by(regije, leto) %>% summarise(skupaj=sum(stevilo)))

graf1 <- ggplot(starostne.skupine.regije, aes(x=leto, y=stevilo, group=regije, color=regije)) + geom_line() + xlab("Leto") + ylab("Število podjetij, ki so prenehala z delovanjem") + ggtitle("Graf števila propadlih podjetij") + scale_color_discrete(name="Regije", labels=c("Gorenjska", "Goriška", "Jugovzhodna Slovenija", "Koroška", "Obalno-kraška", "Osrednjeslovenska", "Podravska", "Pomurska", "Posavska", "Primorsko-notranjska", "Savinjska", "Zasavska")) + theme(axis.text.x = element_text(angle = 90, vjust = 0.3, hjust=1))
