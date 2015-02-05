if(!file.exists("./data/household_power_consumptionFeb0102.csv")){
  power <- read.table("./data/household_power_consumption.txt", sep=";", na.strings="?", header=TRUE)
  day1<-as.Date("2007-02-01")
  day2<-as.Date("2007-02-02")
  dates<-as.Date(power$Date,format="%d/%m/%Y")
  feb0102<-dates==day1 | dates==day2
  powerfeb0102<-power[care,]
  write.csv(powerfeb0102,"./data/household_power_consumptionFeb0102.csv", row.names=FALSE)
} else {
  powerfeb0102<-read.csv("./data/household_power_consumptionFeb0102.csv")
  c<-paste(powerfeb0102$Date, powerfeb0102$Time)
  DateTime<-strptime(c,format = "%d/%m/%Y %H:%M:%S")
  powerfeb0102<-cbind(DateTime,powerfeb0102[,3:9])
  
}