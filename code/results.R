# wordcloud
total_df <- aggregate(word_df$final_score,list(word_df$word),sum)
cloud    <- wordcloud(total_df$Group,abs(total_df$x),scale=c(10,.20),colors=brewer.pal(10,"Spectral"))
#total sentiment score
total_sentiment <- sum(word_df$final_score)
#% division
