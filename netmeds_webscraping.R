library(dplyr)
library(rvest)
library(httr)
library(htmltools)

webpage <- read_html("https://www.netmeds.com/non-prescriptions/emami-menthoplus-balm-9ml")

review <- webpage %>%
  html_nodes(".review-box") %>%
  html_text()

star <- webpage %>%
  html_nodes(".count-star ") %>%
  html_text()

date <- webpage %>%
  html_nodes(".reviewer-name")%>%
  html_text


name <- webpage %>%
  html_nodes(".reviewer-name-new")%>%
  html_text

content<- webpage %>%
  html_nodes(".review-content")%>%
  html_text

verified<- webpage %>%
  html_nodes(".verified")%>%
  html_text



table<- tibble(star,date,name,content,verified)
