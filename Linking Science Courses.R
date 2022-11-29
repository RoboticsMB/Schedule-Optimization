library(readxl)
library(data.table)
library(dplyr)
df <- read_excel("D:/User Files/Matthew/R Work/FullSchedule.xlsx")
dfCopy <- data.frame(df)
dfCopy = na.omit(dfCopy[!dfCopy$CY.Cls.Status == "Dropped",])
dfCopy = dfCopy[!(dfCopy$CY.Cor.Status == "Inactive"),]
dfCopy = dfCopy[!(dfCopy$CY.Room == "Edge"),]
Courses <- data.frame(dfCopy$CY.Course, dfCopy$CY.Description, dfCopy$CY.Days.Meet, dfCopy$CY.Schd.Prd, dfCopy$CY.Teach.Key, dfCopy$CY.Term)
#Courses <- data.frame(dfCopy$CY.Course, dfCopy$CY.Description, dfCopy$CY.Days.Meet, dfCopy$CY.Schd.Prd, dfCopy$CY.Term)
ThatClass <- Courses[grepl("SC", Courses$dfCopy.CY.Course),]
#ThatClass <- filter(Courses, dfCopy.CY.Description == 'HONORS GLOBAL CONNECTIONS II')
#ThatClass = aggregate(list(NumberOfPeople=rep(1,nrow(ThatClass))), ThatClass, length)
print(unique(ThatClass))

#if choice doesn't equal MTWRF and its not first check if above option has same teacher, course and it is MTWRF
#if not then check option below, if it is not throw an error

#making comment to check github