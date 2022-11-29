library(readxl)
library(data.table)
library(dplyr)
df <- read_excel("D:/User Files/Matthew/R Work/FullSchedule.xlsx")

#Checking that No Id's are missing
if(FALSE){
Internal_ID <- c(df$'Internal ID')
maxID <- max(Internal_ID)
minID <- min(Internal_ID)
CheckingForMissingValues <- seq(minID, maxID)
CheckingForMissingValues %in% Internal_ID
}

#matches the Course Code with the Courses Description
if(FALSE){
Course_To_Description <- unique(data.frame(df$'CY Course',df$'CY Description'))
Course_To_Description_Ordered <- Course_To_Description[order(Course_To_Description$'df..CY.Course.'), c(2,1)]
Course_To_Description_Filtered <- Course_To_Description_Ordered[!grepl("FR",Course_To_Description_Ordered$'df..CY.Course.'),]
Special_Education_Values <- seq(00,99)
letters <- letters[seq(1,10)]
numbers <- rep(seq(0,9), each = 10)
values <- data.frame(letters, numbers)
values$letters <- paste(values$letters, values$numbers, sep = "")
Special_Education_Values <- append(Special_Education_Values, values$letters)
Special_Education_Values <- append(Special_Education_Values, toupper(values$letters))
Course_To_Description_Filtered <- Course_To_Description_Filtered[!substr(Course_To_Description_Filtered$'df..CY.Course.',start = 1, stop = 2) %in%  Special_Education_Values == TRUE,]
Course_To_Description_Filtered <- Course_To_Description_Filtered[!Course_To_Description_Filtered$'df..CY.Course.' == 'CYSH',]
print(Course_To_Description_Filtered)
}

#matches each Course Description with a Room Number(filtered)
if(FALSE){
CY_Description <- unique(data.frame(df$'CY Description', df$'CY Room'))
CY_Description_Sorted <- CY_Description[order(CY_Description$'df..CY.Description.'), c(1,2)]
No_Nas <- na.omit(CY_Description_Sorted)
Completely_Filtered <- No_Nas[!No_Nas$'df..CY.Room.' == "Edge",]
print(Completely_Filtered)
}

#creates a frequency table of Internal ID's
if(FALSE){
example <- table(df$'Internal ID')
print(example)
}

# checks if CY Section == CY Request
if(FALSE){
  cy_section <- df$'CY Section'
  cy_section[is.na(cy_section)] = '-1'
  cy_section[cy_section != -1] <- 'N'
  cy_section[cy_section == -1] <- 'Y'
  table(cy_section, df$'CY Request')
  print(setequal(cy_section, df$'CY Request'))
}

#Checking which courses are inactive
if(FALSE){
Does_Course_Exsist <- unique(data.frame(df$'CY Description', df$'CY Cor Status', df$'CY Course'))
Yes <- Does_Course_Exsist[order(Does_Course_Exsist$'df..CY.Description.'), c(1,2,3)]
print(table(Does_Course_Exsist$'df..CY.Cor.Status.'))
}

#general information about data
if(FALSE){
  #print(str(df))
  #print(length(unique(df$'CY Course')))
  #print(data.table(df))
  #print(table(df))
  #print(setequal(df$'CY Period',df$'CY Schd Prd'))
  #print((min(table(df$'CY Course'))))
  Instructors_To_Courses <- na.omit(unique(data.frame(df$'CY Course', df$'Credits', df$'CY Room', df$'CY Teach Key')))
  Instructors_To_Courses <- Instructors_To_Courses[!Instructors_To_Courses$'df..CY.Teach.Key.' == "FORBESTA000",]
  #print(Instructors_To_Courses)
  print((table(Instructors_To_Courses$'df..CY.Teach.Key.')))
  #print(which(df$'CY Teach Key' == "MCCANPAT000"))
  print(Instructors_To_Courses[Instructors_To_Courses$'df..CY.Teach.Key.' == "MCCANPAT000",])

}

#prints all rows that are empty in CY Section
if(FALSE){
aCopy <- df[is.na(df$'CY Section'),]
print(aCopy)
}

#maximum and minimum amount of courses students taking
if (FALSE){
anotherCopy <- df
anotherCopy <- na.omit(anotherCopy[!anotherCopy$'CY Cls Status' == "Dropped",])
print(which.max(table(anotherCopy$'CY Course')))
}

#table(df$'CY Period', df$'CY Schd Prd')

#making comment to check github
