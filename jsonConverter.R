library(jsonlite)
# This function creates 10 different csv signal files from a basis watch json file.
# To change it to wf
# Libraries needed to install are jsonlite
bs2csv<-function(inputFile, outTempDir){
  
data1<-fromJSON(inputFile)

gsr <- data.frame(data1$metrics$gsr$values)
hr <-data.frame(data1$metrics$heartrate$values)
steps <-data.frame(data1$metrics$steps$values)
skin_temp <-data.frame(data1$metrics$skin_temp$values)
air_temp <-data.frame(data1$metrics$air_temp$values)

names(gsr)[1]<- "gsr"
names(hr)[1]<- "heartRate"
names(steps)[1]<- "steps"
names(skin_temp)[1]<- "skinTemp"
names(air_temp)[1]<- "airTemp"



write.table(gsr, file = paste(outTempDir,"gsrNA.csv"),row.names=FALSE,col.names=FALSE)
write.table(hr, file = paste(outTempDir, "hrNA.csv"),row.names=FALSE,col.names=FALSE)
write.table(steps, file = paste(outTempDir, "stepsNA.csv"),row.names=FALSE,col.names=FALSE)
write.table(skin_temp, file = paste(outTempDir,"skinTempNA.csv"),row.names=FALSE,col.names=FALSE)
write.table(air_temp, file = paste(outTempDir,"airTempNA.csv"),row.names=FALSE,col.names=FALSE)

write.table(gsr, file = paste(outTempDir,"gsrNoNA.csv"),row.names=FALSE,col.names=FALSE,na="")
write.table(hr, file = paste(outTempDir,"hrNoNA.csv"),row.names=FALSE,col.names=FALSE,na="")
write.table(steps, file = paste(outTempDir,"stepsNoNA.csv"),row.names=FALSE,col.names=FALSE,na="")
write.table(skin_temp, file = paste(outTempDir,"skinTempNoNA.csv"),row.names=FALSE,col.names=FALSE,na="")
write.table(air_temp, file = paste(outTempDir,"airTempNoNA.csv"),row.names=FALSE,col.names=FALSE,na="")

}