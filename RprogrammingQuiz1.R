# R Programming - April 2014
# Week 1 Quiz

# Question 4:  If I execute the expression x <- 4L in R, 
#w hat is the class of the object `x' as determined 
# by the `class()' function?
x <- 4L
class(x)

# Question 5
# What is the class of the object defined by the expression 
# x <- c(4, "a", TRUE)?
x<-c(4,"a",TRUE)
x
class(x)

# Question 6
# If I have two vectors x <- c(1,3, 5) and y <- c(3, 2, 10), 
# what is produced by the expression cbind(x, y)?
x<-c(1,3,5)
y<-c(3,2,10)
cbind(x,y)
class(cbind(x,y))
attributes(cbind(x,y))

# Question 8
# Suppose I have a list defined as x <- list(2, "a", "b", TRUE). 
# What does x[[1]] give me?
x <- list(2, "a", "b", TRUE)
x
x[[1]]
class(x[[1]])

# Question 9
# Suppose I have a vector x <- 1:4 and y <- 2:3. 
# What is produced by the expression x + y?
x<-1:4
x
y<-2:3
y
x+y
class(x)
class(y)
class(x+y)

# Question 10
# Suppose I have a vector x <- c(17, 14, 4, 5, 13, 12, 10) 
# and I want to set all elements of this vector that are greater 
# than 10 to be equal to 4.  What R code achieves this?
x <- c(17, 14, 4, 5, 13, 12, 10)
x
class(x)
x[x>10]<-4
x

# Question 12
# Extract the first 2 rows of the data frame and 
# print them to the console. What does the output look like?
hw1_data <- read.csv("hw1_data.csv")
hw1_data[1:2,]

# Question 13
# How many observations (i.e. rows) are in this data frame?
nrow(hw1_data)

# Question 14
# Extract the last 2 rows of the data frame and 
# print them to the console. 
tail(hw1_data,2)

# Question 15
# What is the value of Ozone in the 47th row?
hw1_data[47,]
hw1_data[47,"Ozone"]

# Question 16
# How many missing values are in the Ozone column 
# of this data frame?
ozone<-hw1_data[,"Ozone"]
na_ozone<-is.na(ozone)
missing.ozone<-ozone[na_ozone]

# Question 17
# What is the mean of the Ozone column in this dataset? 
# Exclude missing values (coded as NA) from this calculation.
complete.ozone<-ozone[!na_ozone]
mean(complete.ozone)

# Question 18:  Extract the subset of rows of the data frame 
# where Ozone values are above 31 and Temp values are above 90. 
# What is the mean of Solar.R in this subset?
data<-hw1_data
dim(data)  #dimensions of input data
good <- complete.cases(data) #logical vector to weed out NAs
complete.data<-data[good,][,]  #complete data only
names(complete.data) #check names in data frame
ozone.above31.data <- subset(complete.data, Ozone > 31) #subset of data
temp.above90.data <- subset(ozone.above31.data, Temp > 90)  #subset of data
o31andt90.data <- subset(complete.data, Ozone > 31 & Temp > 90) #test both conditions at once
xdata <- data.matrix(o31andt90.data)  # convert to matrix?  need to do this to find mean?
solar<- xdata[,"Solar.R"]
mean(solar)

# Question 19:  Mean Temp when Month = 6
y.df <- subset(data, Month == 6)  #use all the data not the cleaned set
y <- data.matrix(y.df) #convert to matrix
temp <- y[,"Temp"]
mean(temp)

# Question 20: What was the maximum ozone value in the month of May (i.e. Month = 5)?
z.df <- subset(complete.data, Month ==5) #must used "cleaned" data otherwise max() returns NA
z <- data.matrix(z.df) #convert to matrix
ozone <- z[,"Ozone"]
max(ozone)

# Compressed code for Questions 18-20
# (matches previous results)
mean(subset(data, Month == 6)[,"Temp"])
mean(subset(data, Ozone > 31 & Temp > 90)[,"Solar.R"])
max(subset(complete.data, Month == 5)[,"Ozone"])  # need NA removed dataset for max()
