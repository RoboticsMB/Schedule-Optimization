library(readxl)
library(data.table)
library(dplyr)
df <- read_excel("D:/User Files/Matthew/R Work/FullSchedule.xlsx")
dfCopy <- data.frame(df)
dfCopy = na.omit(dfCopy[!dfCopy$CY.Cls.Status == "Dropped",])
dfCopy = dfCopy[!(dfCopy$CY.Cor.Status == "Inactive"),]
dfCopy = dfCopy[!(dfCopy$CY.Room == "Edge"),]
#Courses <- (data.frame(dfCopy$CY.Course, dfCopy$CY.Description, dfCopy$CY.Days.Meet, dfCopy$CY.Schd.Prd, dfCopy$CY.Teach.Key, dfCopy$CY.Term))
Courses <- dfCopy %>% select(-Internal.ID, -CY.Alt.Req, -CY.Schedule.Type, -Teq)
# Enter what course you are loooking for
ThatClass <- filter(Courses, CY.Description == 'PHYS ED 9A/10A')
#ThatClass <- filter(Courses, dfCopy.CY.Description == 'PHYS ED 9A/10A')
ThatClass <- aggregate(list(numdup=rep(1,nrow(ThatClass))), ThatClass, length)
#finds class with least amount of people
ClassFound <- ThatClass[which.min(ThatClass$numdup),]



STUDENT_REQUEST_INFO <- subset(ClassFound, select = -c(numdup) )
#print(STUDENT_REQUEST_INFO)
newStudentID <- max(df$'Internal ID') + 1
STUDENT_REQUEST_INFO = append(STUDENT_REQUEST_INFO, newStudentID, 0)
STUDENT_REQUEST_INFO = append(STUDENT_REQUEST_INFO, 'N', 3)
STUDENT_REQUEST_INFO = append(STUDENT_REQUEST_INFO, 'Manually Schedule', 18)
STUDENT_REQUEST_INFO = append(STUDENT_REQUEST_INFO, 'Code', 20)

df[nrow(df) + 1,] <- STUDENT_REQUEST_INFO
print(tail(df))