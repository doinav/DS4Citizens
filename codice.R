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

library(ggplot2)
pdur <- ggplot(data, aes(x = NULL , y = song_duration_s)) +
  geom_boxplot(color = "darkgreen", fill="green", alpha=0.3) +
  labs(y = "Song Duration", x = NULL) 
print(pdur)
pacoustic <- ggplot(data) +
  geom_boxplot(aes(x = "", y = acousticness), color = "darkgreen", fill="green", alpha=0.3) +
  labs(y = "Acousticness", x = NULL)
print(pacoustic)
pdance <- ggplot(data) +
  geom_boxplot(aes(x = "", y = danceability ), color = "darkgreen", fill="green", alpha=0.3) +
  labs(y = "Danceability", x = NULL)
penergy <- ggplot(data) +
  geom_boxplot(aes(x = "", y = energy ), color = "darkgreen", fill="green", alpha=0.3) +
  labs(y = "Energy", x = NULL)
pinstrument <- ggplot(data) +
  geom_boxplot(aes(x = "", y = instrumentalness ), color = "darkgreen", fill="green", alpha=0.3) +
  labs(y = "Instrumentalness", x = NULL)
plive <- ggplot(data) +
  geom_boxplot(aes(x = "", y = liveness ), color = "darkgreen", fill="green", alpha=0.3) +
  labs(y = "Liveness", x = NULL)
ploud <- ggplot(data) +
  geom_boxplot(aes(x = "", y = loudness ) , color = "darkgreen", fill="green", alpha=0.3) +
  labs(y = "Loudness", x = NULL)
pspeech <- ggplot(data) +
  geom_boxplot(aes(x = "", y = speechiness ) , color = "darkgreen", fill="green", alpha=0.3) +
  labs(y = "Speechness", x = NULL)
ptempo <- ggplot(data) +
  geom_boxplot(aes(x = "", y = tempo ) , color = "darkgreen", fill="green", alpha=0.3) +
  labs(y = "Tempo", x = NULL)
pts <- ggplot(data) +
  geom_boxplot(aes(x = "", y = time_signature ) , color = "darkgreen", fill="green", alpha=0.3) +
  labs(y = "Time Signature", x = NULL)
pav <- ggplot(data) +
  geom_boxplot(aes(x = "", y = audio_valence ) , color = "darkgreen", fill="green", alpha=0.3) +
  labs(y = "Audio Valence", x = NULL)

library(gridExtra)
grid1 = grid.arrange(pdur, pacoustic, pdance, penergy, nrow = 2)
grid2 = grid.arrange(pinstrument, plive, ploud, pspeech, nrow = 2)
grid3 = grid.arrange(ptempo, pts, pav, nrow = 2)

# rappresentazione delle variabili categoriche -> bar plot (key, audio_mode, time_signature)
# rappresentazione delle variabili quantitative -> istogrammi e densità
# istogrammi x vedere la densità delle variabili:

par(mfrow=c(2,3))
ddur <- density(data$song_duration_s) 
plot(ddur, type = "n", main = "Song Duration") +
polygon(ddur, col = "lightgreen", border = "black")

dpopu <- density(data$song_popularity) 
plot(dpopu, type = "n", main = "Song Popularity")
polygon(dpopu, col = "lightgreen", border = "black")

dacou <- density(data$acousticness) 
plot(dacou, type = "n", main = "Acousticness")
polygon(dacou, col = "lightgreen", border = "black")

ddance <- density(data$danceability) 
plot(ddance, type = "n", main = "Danceability")
polygon(ddance, col = "lightgreen", border = "black")

denergy <- density(data$energy)
plot(dacou, type = "n", main = "Energy")
polygon(denergy, col = "lightgreen", border = "black")

dinstrum <- density(data$instrumentalness)
plot(dinstrum, type = "n", main = "Instrumentalness")
polygon(dinstrum, col = "lightgreen", border = "black")

dlive <- density(data$liveness)
plot(dlive, type = "n", main = "Liveness")
polygon(dlive, col = "lightgreen", border = "black")

dloud <- density(data$loudness)
plot(dloud, type = "n", main = "Loudness")
polygon(dloud, col = "lightgreen", border = "black")

dtempo <- density(data$tempo)
plot(dtempo, type = "n", main = "Tempo")
polygon(dtempo, col = "lightgreen", border = "black")

dspeech <- density(data$speechiness)
plot(dspeech, type = "n", main = "Speechiness")
polygon(dspeech, col = "lightgreen", border = "black")

dav <- density(data$audio_valence) 
plot(dav, type = "n", main = "Audio Valence") 
polygon(dav, col = "lightgreen", border = "black")

bkey <- ggplot(data) + geom_bar(aes(x = key), color = "darkgreen", fill="green", alpha=0.3) +
  labs(y = "", x = "Key") 
plot(bkey)

bam <- ggplot(data) + geom_bar(aes(x = audio_mode), color = "darkgreen", fill="green", alpha=0.3) +
  labs(y = "", x = "Audio mode") 
plot(bam)

bts <- ggplot(data) + geom_bar(aes(x = time_signature), color = "darkgreen", fill="green", alpha=0.3) +
  labs(y = "", x = "Time Signature") 
plot(bts)
