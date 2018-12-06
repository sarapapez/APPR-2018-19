# Podjetnost v Sloveniji

Avtor: Sara Papež 


Repozitorij z gradivi pri predmetu APPR v študijskem letu 2018/19

* [![Shiny](http://mybinder.org/badge.svg)](http://beta.mybinder.org/v2/gh/sarapapez/APPR-2018-19/master?urlpath=shiny/APPR-2018-19/projekt.Rmd) Shiny
* [![RStudio](http://mybinder.org/badge.svg)](http://beta.mybinder.org/v2/gh/sarapapez/APPR-2018-19/master?urlpath=rstudio) RStudio

## Tematika

V projektni nalogi bom analizirala podjetja v Sloveniji. Za začetek bom primerjala število podjetij po posameznih regijah med letoma 2006 in 2016 in analizirala v kateri regiji se je v tem času število podjetij najbolj povečalo in kje najbolj zmanjšalo. Za vsako regijo bom ugotovila koliko je novonastalih podjetij in koliko je podjetij, ki so prenahala s poslovanjem. Analizirala bom tudi koliko je v Sloveniji hitrorastočih podjetij. Poskusila bom najti povezavo med novonastalimi in hitrorastočimi podjetji. Na koncu pa bom analizirala še število ljudi, ki so zaposleni v podjetjih v posameznih regijah.

* Tabela 1: ŠTEVILO PODJETIJ
            - regija, leto, število podjetij
* Tabela 2: ŠTEVILO NOVONASTALIH PODJETIJ
            - regija, leto, število novonastalih podjetij
* Tabela 3: ŠTEVILO PODJETIJ, KI SO PRENEHALA S POSLOVANJEM 
            - regija, leto, število podjetij, ki so prenehala s poslovanjem
* Tabela 4: ŠTEVILO HITRORASTOČIH PODJETIJ
            - regija, leto, število hitrorastočih podjetij
* Tabela 5: ŠTEVILO LJUDI, KI SO ZAPOSLENA V PODJETJIH
            - regija, leto, število ljudi, ki so zaposleni v podjetjih
            
Vir podatkov: https://pxweb.stat.si/pxweb/Database/Regije/Regije.asp

## Program

Glavni program in poročilo se nahajata v datoteki `projekt.Rmd`.
Ko ga prevedemo, se izvedejo programi, ki ustrezajo drugi, tretji in četrti fazi projekta:

* obdelava, uvoz in čiščenje podatkov: `uvoz/uvoz.r`
* analiza in vizualizacija podatkov: `vizualizacija/vizualizacija.r`
* napredna analiza podatkov: `analiza/analiza.r`

Vnaprej pripravljene funkcije se nahajajo v datotekah v mapi `lib/`.
Podatkovni viri so v mapi `podatki/`.
Zemljevidi v obliki SHP, ki jih program pobere,
se shranijo v mapo `../zemljevidi/` (torej izven mape projekta).

## Potrebni paketi za R

Za zagon tega vzorca je potrebno namestiti sledeče pakete za R:

* `knitr` - za izdelovanje poročila
* `rmarkdown` - za prevajanje poročila v obliki RMarkdown
* `shiny` - za prikaz spletnega vmesnika
* `DT` - za prikaz interaktivne tabele
* `rgdal` - za uvoz zemljevidov
* `digest` - za zgoščevalne funkcije (uporabljajo se za shranjevanje zemljevidov)
* `readr` - za branje podatkov
* `rvest` - za pobiranje spletnih strani
* `reshape2` - za preoblikovanje podatkov v obliko *tidy data*
* `dplyr` - za delo s podatki
* `gsubfn` - za delo z nizi (čiščenje podatkov)
* `ggplot2` - za izrisovanje grafov
* `mosaic` - za pretvorbo zemljevidov v obliko za risanje z `ggplot2`
* `maptools` - za delo z zemljevidi
* `extrafont` - za pravilen prikaz šumnikov (neobvezno)

## Binder

Zgornje [povezave](#analiza-podatkov-s-programom-r-201819)
omogočajo poganjanje projekta na spletu z orodjem [Binder](https://mybinder.org/).
V ta namen je bila pripravljena slika za [Docker](https://www.docker.com/),
ki vsebuje večino paketov, ki jih boste potrebovali za svoj projekt.

Če se izkaže, da katerega od paketov, ki ji potrebujete, ni v sliki,
lahko za sprotno namestitev poskrbite tako,
da jih v datoteki [`install.R`](install.R) namestite z ukazom `install.packages`.
Te datoteke (ali ukaza `install.packages`) **ne vključujte** v svoj program -
gre samo za navodilo za Binder, katere pakete naj namesti pred poganjanjem vašega projekta.

Tako nameščanje paketov se bo izvedlo pred vsakim poganjanjem v Binderju.
Če se izkaže, da je to preveč zamudno,
lahko pripravite [lastno sliko](https://github.com/jaanos/APPR-docker) z želenimi paketi.

Če želite v Binderju delati z git,
v datoteki `gitconfig` nastavite svoje ime in priimek ter e-poštni naslov
(odkomentirajte vzorec in zamenjajte s svojimi podatki) -
ob naslednjem.zagonu bo mogoče delati commite.
Te podatke lahko nastavite tudi z `git config --global` v konzoli
(vendar bodo veljale le v trenutni seji).
