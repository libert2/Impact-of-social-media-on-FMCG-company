library(readxl)
library(vars)
rm(list = ls())
data <- read_xlsx("E:\\Amajor_IIT\\project\\FinalProject\\dummy\\MainData.xlsx")

tweetsSentiment<- ts(data$TweetSentiment, start = c(2020, 01), end = c(2023, 10), frequency = 12)
Stock_Price<- ts(data$Stock_Price, start = c(2020, 01), end = c(2023, 10), frequency = 12)

******************************* ADF test at Level form 
library(urca)
VARselect(tweetsSentiment)
plot(tweetsSentiment)
adf.tweetsSentiment<-ur.df(tweetsSentiment, type ="none", lags = 2,
                           selectlags ="AIC") 
summary(adf.tweetsSentiment)
plot(tweetsSentiment)

VARselect(Stock_Price)
plot(Stock_Price)
adf.Stock_Price<-ur.df(Stock_Price, type ="trend", lags = 1,
                       selectlags ="AIC") 
summary(adf.Stock_Price)
plot(d1_Stock_Price)

--------------- URPP test at level
pp.tweetsSentiment<-ur.pp(tweetsSentiment, type = "Z-tau", model = "constant",
                          lags =  "long", use.lag = 2)
summary(pp.tweetsSentiment)
plot(d1_tweetsSentiment)

pp.Stock_Price<-ur.pp(Stock_Price, type = "Z-tau", model = "trend",
                      lags =  "long", use.lag = 1)
summary(pp.Stock_Price)
plot(d1_Stock_Price)

