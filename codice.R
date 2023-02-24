#01/02
#pulizia dei dati
song_data = read.csv("/Users/anato/Desktop/Università/Data Science 4 Citiziens/song_data1.csv/song_data.csv")
library(dplyr)
#eliminiamo le righe delle canzoni che appaiono più di una volta
df = song_data %>% distinct()
df2 <- df %>% distinct(song_name, .keep_all = TRUE)
#sostituiamo l'unità di misura della durata della canzone da millisecondi a sec
df2['song_duration_ms'] = df2['song_duration_ms']/1000

#sostituire i nomi
#metodo 1
colnames(df2)[colnames(df2) == "song_duration_ms"] = "song_duration_s"
#metodo2
#colnames(df2)[3] = "song_duration_s"
#metodo3
#df3 <- df2 %>% rename(song_duration_s = song_duration_ms)

#esportiamo il file
write.csv(df2, file = "data.csv")

#10/02
#intanto, ogni volta che importate il dataset utilizzate questo codice
data = read.csv("data.csv")
data = subset(data, select = -c(X))
rm(df,df2,song_data)
library(readr)

library(readr)
data <- read_csv("data.csv", col_types = cols(...1 = col_skip(), 
                                              song_popularity = col_integer(), song_duration_s = col_number(), 
                                              acousticness = col_number(), danceability = col_number(), 
                                              energy = col_number(), instrumentalness = col_number(), 
                                              key = col_factor(levels = c("0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11")), liveness = col_number(), 
                                              loudness = col_number(), audio_mode = col_factor(levels = c("0", 
                                                                                                          "1")), speechiness = col_number(), 
                                              tempo = col_number(), time_signature = col_factor(levels = c("0", "1", "3", "4", "5")), 
                                              audio_valence = col_number()))
