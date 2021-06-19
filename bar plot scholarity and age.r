df2 <- data.frame(Variable=rep(c("Scholarity", "Age"), each=5),
                  Session=rep(c("Session1", "Session2", "Session3","Session4","Session5"),2),
                  Years=c(13.12, 12.93, 12.67, 11.62, 14.46, 18.12, 17.93,17.67, 16.62, 19.46))
head(df2)

library(ggplot2)
ggplot(data=df2, aes(x=Session, y=Years, fill=Variable)) +
  geom_bar(stat="identity", position=position_dodge())
