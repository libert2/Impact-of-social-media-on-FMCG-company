
gen time = _n
tsset time, daily

//ARDL Package Load
help ardl
ssc describe ardl
ssc install ardl



//NARDL Model for affect of sentiment on stock price

nardl Adj_Close afinn_score, p(13) q(10) 

nardl Stock_Price TweetSentiment, p(13) q(10) plot horizon(25) bootstrap(100) level(95)


 




