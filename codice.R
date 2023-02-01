song_data = read.csv("/Users/anato/Desktop/Università/Data Science 4 Citiziens/song_data1.csv/song_data.csv")
library(dplyr)
df = song_data %>% distinct()
df2 <- df %>% distinct(song_name, .keep_all = TRUE)
df2['song_duration_ms'] = df2['song_duration_ms']/1000

#sostituire i nomi
#metodo 1
colnames(df2)[colnames(df2) == "song_duration_ms"] = "song_duration_s"
#metodo2
#colnames(df2)[3] = "song_duration_s"
#metodo3
#df3 <- df2 %>% rename(song_duration_s = song_duration_ms)


write.csv(df2, file = "data1.csv")
summary(df2)