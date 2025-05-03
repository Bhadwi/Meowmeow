# Load necessary libraries
library(tm)
library(wordcloud)
library(SnowballC)
library(syuzhet)
library(ggplot2)

text <- "Hon’ble Members,

It gives me immense pleasure to address this session of Parliament.

Just two months ago, we celebrated the 75th anniversary of adoption of our Constitution, and only a few days ago, the Indian Republic completed 75 years of its journey. This occasion will elevate India pride as the mother of democracy to new heights. On behalf of all the citizens of the country, I pay tribute to Babasaheb Ambedkar and all the framers of the Constitution.

The historic festival of Mahakumbh is also underway in the country. Mahakumbh is a festival of India cultural tradition and social consciousness. Millions of devotees from across the country and the world have taken the holy dip at Prayagraj. I express my sorrow over the unfortunate incident that occurred on Mauni Amavasya and wish for the speedy recovery of the injured.

A few days ago, we lost the former Prime Minister of the country, Dr. Manmohan Singhji. He served the nation as Prime Minister for ten years and was a long-time member of Parliament. I offer my heartfelt tribute to Manmohan Singhji."

# Create a text corpus
docs <- VCorpus(VectorSource(text))

# Preprocess text: lowercase, remove punctuation, numbers, whitespace, stopwords
docs <- tm_map(docs, content_transformer(tolower))
docs <- tm_map(docs, removePunctuation)
docs <- tm_map(docs, removeNumbers)
docs <- tm_map(docs, removeWords, stopwords("english"))
docs <- tm_map(docs, stripWhitespace)

# Create term-document matrix
tdm <- TermDocumentMatrix(docs)
m <- as.matrix(tdm)
word_freq <- sort(rowSums(m), decreasing = TRUE)
df <- data.frame(word = names(word_freq), freq = word_freq)
print(df)


# Generate wordcloud for words with frequency > 3
wordcloud(words = df$word, freq = df$freq, min.freq =2,
          max.words = 100, random.order = FALSE, colors = brewer.pal(8, "Dark2"))

# Interpretation:
# Words like "country", "constitution", "parliament", "tribute", "mahakumbh" are prominent.
# These suggest a patriotic and ceremonial tone, focused on national pride and remembrance.

# Sentiment Analysis
sentiments <- get_nrc_sentiment(text)
sentiment_sums <- colSums(sentiments)

# Barplot of sentiments
barplot(sentiment_sums, las = 2, col = rainbow(10),
        main = "Sentiment Analysis of the Speech",
        ylab = "Frequency")

# Interpretation:
# Positive sentiments like 'trust', 'joy', and 'anticipation' are strongly present.
# Some 'sadness' and 'fear' are also noted, likely due to the references to unfortunate incidents and a tribute to Manmohan Singhji.

