# connection to twitter
source("code/keys.R")

setup_twitter_oauth(consumer_key    = consumer_key, 
                   consumer_secret  = consumer_secret, 
                   access_token     = access_token,
                   access_secret    = access_secret)

# gathering of tweets for the specified word
tweet_list <- searchTwitter(keyword, n = 1000)  
tweet_df   <-  twListToDF(tweet_list)  
