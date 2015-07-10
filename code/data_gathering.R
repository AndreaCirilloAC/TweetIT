# connection to twitter
source("code/keys.R")

setup_twitter_oauth(consumer_key    = consumer_k, 
                   consumer_secret  = consumer_s, 
                   access_token     = access_t,
                   access_secret    = access_s)

# gathering of tweets for the specified word
tweet_list <- searchTwitter(keyword, n = 1000)  
tweet_df   <-  twListToDF(tweet_list)  
