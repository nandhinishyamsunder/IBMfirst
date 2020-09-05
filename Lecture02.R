##Lecture 02 Aug 26
#rm(list=ls())

#Matrix operations
A <- matrix(c(1,4,2,3), nrow = 2, ncol = 2)
A
A+A
A-A
2*A
t(A) #transpose
A%*%A #multiplication
solve(A) #must be a square matrix
det(A)

#example 01
A<-matrix(c(1,1,-1,1),2,2)
b<-matrix(c(4,1),2,1)
solve(A,b)

#example 02
A<-matrix(c(4,1,-1,1,3,-2,7,-5,1),nrow=3,byrow=T)
b<-matrix(c(10,7,8),3,1)
solve(A,b)

#data frames
# (which must all be the same length 
# but not necessarily the same type)

team <- c("Bears", "Eagles", "Dolphins")
wins <- c(5, 11, 8)
losses <- c(9, 3, 6)

football <- data.frame(team, wins, losses)
football
str(football) #structure of an R object

name <- c("Jack", "Paul", "Carol","Jane")
age <- c(16, 17, 24, 23)
hair <- c("brown", "green", "blond","black")

myclass <- data.frame(name, age, hair)
myclass
str(myclass) #structure of an R object

myclass2 <- data.frame(
  name = c("Jack", "Paul", "Carol","Jane"),
  age = c(16, 17, 24, 23),
  hair = c("brown", "green", "blond","black")
)
myclass2

ls()    # list all the variables in the workspace
rm(x) # remove variable x from the workspace
rm(list=ls())  # remove all
View(cars) # view the data set

View(cars) #VIew function shows data set in neat way on new window
head(cars) #first 6 obs in dataset
head(cars,10) # first 10 obs
tail(cars) #last 6 obs
dim(cars) #dimensions of dataset
names(cars) #names of variables
summary(cars) #summary stats 



mydata<- data.frame(
  SBP= c(120,130,140,120,125),
  DBP= c(80,70,100,80,80),
  GENDER= c("M", "F", "M","F","F"),
  WT= c(115,180,170,150,110),
  OWE= c(5431, 12122, 7550, 4523.2, 1000.99)
)
mydata


# Create a new variable called Risk
mydata$RISK< -mydata$SBP-mydata$DBP
mydata

#Create a subset to select Males
males <-subset(mydata, GENDER == 'M')
males

#Sort the data set#
accendingsortedbyWT<-mydata[order(mydata$WT), ]
mydata

#descending
sortedbySBP<-mydata[order(-mydata$SBP), ]
mydata

#IMPORTING CSV FILES
#dataset is in my current working directory



#TXT files
read.delim()

install.packages("readr")
library(readr)
install.packages("tidyverse")
library(tidyverse)
install.packages("foreign")
library(foreign)
install.packages("sas7bdat")
library(sas7bdat)

str() #shows structure of dataset

getwd()
setwd() #set working directory

students<- read.csv(file= "C:/Users/nandh/OneDrive/Desktop",)
data<- read.csv(file="students.csv")

setwd("C:/Users/nandh/OneDrive/Desktop")


students<- read.csv(file="students.csv")
students
head(students)
str(students)

students2<- read.table(file="students.csv", sep=',', header=T)
students2
head(students2)
str(students2)

tabdata<- read.delim()

install.packages("dplyr")
library(dplyr)

##################################################
####################################################
######################################################
#Lecture 04

# %>%  is the pipe operator

#Lecture 04 (Sep 02) 

rm(list=ls())  # remove all objects

#dplyr
#library(dplyr)

library(tidyverse)
#Titanic is a built in table
class(Titanic)
str(Titanic)

data <- data.frame(Titanic)

#summarize()
Tot_number <- summarize(data, Tot_number=sum(Freq))
Tot_number
#by using pipe operator
Tot_number2 <- data %>% summarize(Tot_number=sum(Freq))


Tot_number3 <- summarize(data, Tot_number=sum(Freq),
                         Mean = mean(Freq))
Tot_number3


#group_by()
groups <- group_by(data,Sex)
Tot_number_group <- summarize(groups, Tot_number_group=sum(Freq))
Tot_number_group

#by using pipe operator
Tot_number_group2 <- data %>% group_by(Sex) %>%
  summarize(Tot_number=sum(Freq))

#select() subset of variables
sub_variables <- select(data, Class, Survived, Freq)
sub_variables

#by using pipe operator
sub_variables2 <- data %>% select(Class, Survived, Freq)


#move variables to the start of the dataframe
rearrange_var <- select(data, Class, Survived, Freq, everything())

#mutate() add new variables
datanew <- mutate(data, Freq_1000 = Freq*1000)
datanew

#filter() subset of the observations
subset1 <- filter(data,Sex=="Male")
subset2 <- filter(data, Freq >1)

#arrange() reorder
sortfreq <- arrange(data,Freq)
sortfreq
sort_desc_freq <- arrange(data, desc(Freq))
sort_desc_freq