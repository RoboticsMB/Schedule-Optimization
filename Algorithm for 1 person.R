library(readxl)
library(data.table)
library(dplyr)
df <- read_excel("D:/User Files/Matthew/R Work/FullSchedule.xlsx")
dfCopy <- data.frame(df)
#cleaning dataframe of uneeded info
dfCopy = na.omit(dfCopy[!dfCopy$CY.Cls.Status == "Dropped",])
dfCopy = dfCopy[!(dfCopy$CY.Cor.Status == "Inactive"),]
dfCopy = dfCopy[!(dfCopy$CY.Room == "Edge"),]

StudentPickedSchedule <- data.frame('Course'=character(),'Description'=character(),'Days Meet'=character(), 'Period'=character(),'Teacher'=character(), 'Term' = character(), stringsAsFactors=FALSE)
CourseRequests <- subset(dfCopy, Internal.ID == 1079, select = CY.Description)
CourseRequestCopy <- CourseRequests
CourseRequestCopy$CY.Description <- substr(CourseRequestCopy$CY.Description, start = 1, stop = 3)
TheAPCOURSES <- CourseRequests[grepl("AP ", CourseRequestCopy$CY.Description),]
Courses <- data.frame(dfCopy$CY.Course, dfCopy$CY.Description, dfCopy$CY.Days.Meet, dfCopy$CY.Schd.Prd, dfCopy$CY.Teach.Key, dfCopy$CY.Term)
if(length(TheAPCOURSES) != 0){
  print(unique(filter(Courses, dfCopy.CY.Description == TheAPCOURSES)))
  
  
}




#HEALTH
#HON ENGLISH 10
#HON ENGLISH 10
#AP CALCULUS AB
#PHYS ED 9A/10A
#PHYS ED 9B/10B
#AP PHYSICS 1
#HON CHEMISTRY
#HON CHEMISTRY
#HONORS GLOBAL CONNECTIONS II
#PRE-AP SPANISH 3
