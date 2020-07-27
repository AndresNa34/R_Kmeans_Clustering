library(xml2)
library(rvest)
library(stringr)

url<-"https://www.amazon.es/s?k=aspiradora&__mk_es_ES=%C3%85M%C3%85%C5%BD%C3%95%C3%91&ref=nb_sb_noss"
selector<-"#search > div.s-desktop-width-max.s-opposite-dir > div > div.sg-col-20-of-24.s-matching-dir.sg-col-28-of-32.sg-col-16-of-20.sg-col.sg-col-32-of-36.sg-col-8-of-12.sg-col-12-of-16.sg-col-24-of-28 > div > span:nth-child(4) > div.s-main-slot.s-result-list.s-search-results.sg-row > div:nth-child(7) > div > span > div > div > div > div:nth-child(3) > h2 > a"
pagina<-read_html(url)
nodo<-html_node(pagina, selector)
nodo_text<-html_text(nodo)
nodo_links<-html_attr(nodo, "href")
nodo_links

urlcompleta<-paste0("www.amazon.es",nodo_links)
urlcompleta

#ejem
#https://www.amazon.es/s?k=aspiradora&page=2&__mk_es_ES=%C3%85M%C3%85%C5%BD%C3%95%C3%91&qid=1601499195&ref=sr_pg_2
#https://www.amazon.es/s?k=aspiradora&page=3&__mk_es_ES=%C3%85M%C3%85%C5%BD%C3%95%C3%91&qid=1601499843&ref=sr_pg_3

pag <- "s?k=aspiradora&page=2&__mk_es_ES=%C3%85M%C3%85%C5%BD%C3%95%C3%91&qid=1601499843&ref=sr_pg_2"
lista_paginas <- c(1:10)
pag<-str_replace(pag, "page=2", paste0("page=",lista_paginas))
pag<-str_replace(pag, "sr_pg_2", paste0("sr_pg_",lista_paginas))
pag

paginas<-paste0("https://www.amazon.es/", pag)
paginas

dameLinksPagina<-function(url){
  selector_fun<-"div > span > div > div > div:nth-child(3) > h2 > a"
  pagina_fun<-read_html(url)
  nodo_fun<-html_nodes(pagina_fun, selector_fun)
  nodo_text_fun<-html_text(nodo_fun)
  nodo_links_fun<-html_attr(nodo_fun, "href")
  nodo_links_fun
}

linksAsp<-sapply(paginas, dameLinksPagina)
vlink<-as.vector(linksAsp)
vlink

vlinkAspiradora<-paste0("https://www.amazon.es/", vlink)
vlinkAspiradora

#info to extract

nombre<-"#productTitle"
pagina_web<-read_html(url)
nombre_nodo<-html_node(pagina_web, nombre)
nombre_texto<-html_text(nombre_nodo)
nombre_texto

opiniones<-"#acrCustomerReviewText"
opiniones_nodo<-html_node(pagina_web, opiniones)
opiniones_texto<-html_text(opiniones_nodo)
opiniones_texto

precio<-"#priceblock_ourprice"
precio_nodo<-html_node(pagina_web, precio)
precio_texto<-html_text(precio_nodo)
precio_texto

tabla<-"#prodDetails > div.wrapper.ESlocale > div.column.col1 > div > div.content.pdClearfix > div > div > table"
tabla_nodo<-html_node(pagina_web, tabla)
tabla_tab<-html_table(tabla_nodo)
tabla_tab
class(tabla_tab)
val<-tabla_tab$X2
val
res_tabla<-data.frame(t(val))
res_tabla
tabla_name<-tabla_tab$X1
tabla_name
colnames(res_tabla)<-tabla_name
res_tabla
str(res_tabla)

resultado_aspiradoras<-c(nombre_texto, precio_texto, opiniones_texto, as.character(res_tabla$`Peso del producto`), as.character(res_tabla$Potencia), as.character(res_tabla$`Dimensiones del producto`), as.character(res_tabla$Volumen))





