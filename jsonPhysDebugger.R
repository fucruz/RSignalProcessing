library(jsonlite)
library(RHRV)

currTrip<-"C:/Users/fucruz/Desktop/Work/Bioelectric/20160120.JSON"
data1<-fromJSON(currTrip)

#LoadBeatWFDB(HRVData, RecordName, RecordPath = ".", annotator = "qrs", 
#             verbose=NULL)

#dwfdb = CreateHRVData()
#dwfdb = SetVerbose(dwfdb, TRUE)
#dwfdb = LoadBeatWFDB(dwfdb, "test01_00s", RecordPath ="C:/Users/fucruz/Desktop/Work/Bioelectric/",annotator ="dat")

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



pdf(file = "C:/Users/fucruz/Desktop/Work/Bioelectric/jsonPlots.pdf")
## set up the new plotting device (pdf)
par(mfrow = c(4,1))
## draw the plot
plot(gsr$gsr,xlim=c(1,1440),ylim=c(0,.001),ylab = "GSR",xlab="",main="GSR (plot truncated to .001)")
plot(hr$heartRate,xlim=c(1,1440),ylab = "Heart Rate",xlab="",main="Heart Rate")
plot(skin_temp$skinTemp,xlim=c(1,1440),ylab = "Skin Temp",xlab="",main="Skin Temperature F")
plot(air_temp$airTemp,xlim=c(1,1440),ylab = "Air Temp",xlab="",main="Air Temperature F")
## close the device to do the drawing
dev.off()



# # 
# write.csv(gsr, file = "C:/Users/fucruz/Desktop/Work/Bioelectric/gsr_NA.csv",row.names=FALSE)
# write.csv(hr, file = "C:/Users/fucruz/Desktop/Work/Bioelectric/hr_NA.csv",row.names=FALSE)
# write.csv(steps, file = "C:/Users/fucruz/Desktop/Work/Bioelectric/steps_NA.csv",row.names=FALSE)
# write.csv(skin_temp, file = "C:/Users/fucruz/Desktop/Work/Bioelectric/skin_temp_NA.csv",row.names=FALSE)
# write.csv(air_temp, file = "C:/Users/fucruz/Desktop/Work/Bioelectric/air_temp_NA.csv",row.names=FALSE)
# # 
# write.csv(gsr, file = "C:/Users/fucruz/Desktop/Work/Bioelectric/gsr_noNA.csv",row.names=FALSE,na="")
# write.csv(hr, file = "C:/Users/fucruz/Desktop/Work/Bioelectric/hr_noNA.csv",row.names=FALSE, na="")
# write.csv(steps, file = "C:/Users/fucruz/Desktop/Work/Bioelectric/steps_noNA.csv",row.names=FALSE, na="")
# write.csv(skin_temp, file = "C:/Users/fucruz/Desktop/Work/Bioelectric/skin_temp_noNA.csv",row.names=FALSE, na="")
# write.csv(air_temp, file = "C:/Users/fucruz/Desktop/Work/Bioelectric/air_temp_noNA.csv",row.names=FALSE, na="")
# 
# write.table(gsr, file = "C:/Users/fucruz/Desktop/Work/Bioelectric/gsr_NA.csv",row.names=FALSE,col.names=FALSE)
# write.table(hr, file = "C:/Users/fucruz/Desktop/Work/Bioelectric/hr_NA.csv",row.names=FALSE,col.names=FALSE)
# write.table(steps, file = "C:/Users/fucruz/Desktop/Work/Bioelectric/steps_NA.csv",row.names=FALSE,col.names=FALSE)
# write.table(skin_temp, file = "C:/Users/fucruz/Desktop/Work/Bioelectric/skin_temp_NA.csv",row.names=FALSE,col.names=FALSE)
# write.table(air_temp, file = "C:/Users/fucruz/Desktop/Work/Bioelectric/air_temp_NA.csv",row.names=FALSE,col.names=FALSE)
# 
# write.table(gsr, file = "C:/Users/fucruz/Desktop/Work/Bioelectric/gsr_noNA.csv",row.names=FALSE,col.names=FALSE,na="")
# write.table(hr, file = "C:/Users/fucruz/Desktop/Work/Bioelectric/hr_noNA.csv",row.names=FALSE,col.names=FALSE,na="")
# write.table(steps, file = "C:/Users/fucruz/Desktop/Work/Bioelectric/steps_noNA.csv",row.names=FALSE,col.names=FALSE,na="")
# write.table(skin_temp, file = "C:/Users/fucruz/Desktop/Work/Bioelectric/skin_temp_noNA.csv",row.names=FALSE,col.names=FALSE,na="")
# write.table(air_temp, file = "C:/Users/fucruz/Desktop/Work/Bioelectric/air_temp_noNA.csv",row.names=FALSE,col.names=FALSE,na="")

#dwfdb <- LoadBeatWFDB("test01_00s", RecordPath ="C:/Users/fucruz/Desktop/Work/Bioelectric/",annotator ="dat")