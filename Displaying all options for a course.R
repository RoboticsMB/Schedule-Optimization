library(readxl)
library(data.table)
library(dplyr)
df <- read_excel("D:/User Files/Matthew/R Work/FullSchedule.xlsx")
dfCopy <- data.frame(df)
dfCopy = na.omit(dfCopy[!dfCopy$CY.Cls.Status == "Dropped",])
dfCopy = dfCopy[!(dfCopy$CY.Cor.Status == "Inactive"),]
dfCopy = dfCopy[!(dfCopy$CY.Room == "Edge"),]
Courses <- data.frame(dfCopy$CY.Course, dfCopy$CY.Description, dfCopy$CY.Days.Meet, dfCopy$CY.Schd.Prd, dfCopy$CY.Teach.Key, dfCopy$CY.Term)
ThatClass <- filter(Courses, dfCopy.CY.Description == 'CHEMISTRY')
ThatClass = aggregate(list(NumberOfPeople=rep(1,nrow(ThatClass))), ThatClass, length)
print(ThatClass)

#making comment to check github