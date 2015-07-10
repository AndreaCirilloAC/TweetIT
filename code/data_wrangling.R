# define positive and negative words
pos_words = read.csv("lexicon/IT/positive.txt",header = FALSE,stringsAsFactors=FALSE)
pos_words <- c(pos_words)
pos_words <- unlist(pos_words)
pos_words <- unname(pos_words)
pos_words <- tolower(pos_words)
neg_words = read.csv("lexicon/IT/negative.txt",header = FALSE,stringsAsFactors=FALSE)
neg_words <- c(neg_words)
neg_words <- unlist(neg_words)
neg_words <- unname(neg_words)
neg_words <- tolower(neg_words)
#extract tweets text from tweets database
tweets <- tweet_df[,1]
  # we got a vector of tweetss. plyr will handle a list  
  # or a vector as an "l" for us  
  # we want a simple array ("a") of scores back, so we use   
  # "l" + "a" + "ply" = "laply":  
  # clean up tweetss with R's regex-driven global substitute, gsub():  
tweets <- gsub('[[:punct:]]', '', tweets)  
tweets <- gsub('[[:cntrl:]]', '', tweets)  
tweets <- gsub('\\d+', '', tweets)  
tweets <- gsub("RT", '',tweets)
tweets <- gsub(keyword, '',tweets)
tweets <- gsub("�", '',tweets)

#define stopwords
stopwords <- read.csv("lexicon/IT/stopwords.csv",header=FALSE)
tweets <- removeWords(tweets,stopwords[,1])

# split into words. str_split is in the stringr package  
# n = 140, maximum number of letters
word_df    <- str_split_fixed(tweets, '\\s+',n = 140)  
word_df    <- data.frame(word_df,"RT" = tweet_df[,12])
word_count <- melt(word_df,id <- c("RT"))
word_df    <- data.frame( "word" = word_count[,3],
                          "RT" = word_count[,1])                          
'word_df    <- tolower(word_df[,1])'
#match word with lexicon
word_df$is_positive <- match(unlist(word_count[,3]), pos_words)
word_df$is_negative <- match(unlist(word_count[,3]),neg_words)
#remove blank row
word_df <- subset(word_df,word_df[,1] != "")
#define scoring function
sentiment_scorer  <- function(pos_match,neg_match){
  if (is.na(pos_match) && is.na(neg_match)) {0}
 else{
   if(is.na(pos_match) && is.na(neg_match)==FALSE){-1}else
   {1}
 }

}
#apply function
word_df <- data.frame(word_df,score = mapply(sentiment_scorer,word_df$is_positive,word_df$is_negative))

popularity_scorer   <- function(rt,basic_score)
{
  if(rt==0){basic_score}
  else{rt * basic_score}
}
# compute a final score multiplying the score with the number of retweet
word_df$final_score <- mapply(popularity_scorer,word_df$RT,word_df$score)

