#main script
library(twitteR)
library(ROAuth)
library(plyr)
library(stringr)
library(ggplot2)
library(httr)
library(plyr)  
library(stringr)       
library(reshape2)
library(wordcloud)
library(RColorBrewer)
library(tm)

rm(list = ls())
#define analysis keyword
keyword = "#coppieinattesa"

#get data
source("code/data_gathering.R",local = TRUE,verbose = TRUE)
#process data
source("code/data_wrangling.R",local = TRUE,verbose = TRUE)
#show results
source("code/results.R",local = TRUE,verbose = TRUE)

cloud
total_sentiment

#guarda bene word_df
