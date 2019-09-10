library(tidyverse)
#Install if the package doesn't exist 
#install.packages('DataExplorer) 
library(DataExplorer)
df1 = read.csv(file =  "/ap5/liqiuy01/Statistical Research/clustering_autumn.csv", sep = ",", header = TRUE)
df =df1
df$year = as.factor(df$year)
ggplot(data = df) +
  geom_histogram(mapping = aes(x = total), binwidth = 0.5)
plot_str(df)
plot_histogram(df[,-c(1:2)])
plot_density(df[,-c(1:2)])
plot_correlation(df, type = 'continuous','Review.Date')
plot_bar(df)

hist(df$total)
apply(df[,-c(1:2)],2,summary)
year = substr(df$Date,1,4)
month = substr(df$Date,5,6)
day = substr(df$Date,7,8)
trans_date = paste0(year,"/",month,"/",day)
date_format = as.Date(trans_date)
df$date_format = as.Date(trans_date)
df$days = as.factor(day)
means <- aggregate(as.numeric(df$total) ~ df$year, df, mean)
total <- aggregate(as.numeric(df$total) ~ df$year, df, sum)

####try correlation plot 
par(mfrow=c(1,1))
install.packages("corrplot")
library(corrplot)
df_cor = cor(df1[,-c(1:2)])
df_cor
summary(df_cor)
corrplot(df_cor)
fit1 = lm(df$total~df$days)
summary(fit1)
new.days <- data.frame(
  days = c(1:75)
)
pred.int = predict(fit1,  interval = "confidence")
df2 <- cbind(df, pred.int)

means_pred <- aggregate(as.numeric(df2[,10]) ~ as.factor(df2$days), df2, mean)
means_pred
library("ggplot2")
p <- ggplot(df2, aes(days, total)) +
  geom_point() +
  stat_smooth(method = lm)
p + geom_line(aes(y = lwr), color = "red", linetype = "dashed")+
  geom_line(aes(y = upr), color = "red", linetype = "dashed")

# Create Training and Test data -
set.seed(100)  # setting seed to reproduce results of random sampling
trainingRowIndex <- sample(1:nrow(df), 0.8*nrow(df))  # row indices for training data
trainingData <- df[trainingRowIndex, ]  # model training data
testData  <- df[-trainingRowIndex, ]   # test data

# Build the model on training data
lmMod <- lm(total ~ days, data=trainingData)  # build the model
distPred <- predict(lmMod, testData)  # predict distance
summary (lmMod)
actuals_preds <- data.frame(cbind(actuals=testData$total, predicteds=distPred))  # make actuals_predicteds dataframe.
correlation_accuracy <- cor(actuals_preds)  # 82.7%
actuals_preds

library(DAAG)
cvResults <- suppressWarnings(CVlm(df, form.lm=total ~ days, m=5, dots=FALSE, seed=29, legend.pos="topleft",  printit=FALSE, main="Small symbols are predicted values while bigger ones are actuals."));  # performs the CV
attr(cvResults, 'ms')  
#### time series 
library(dplyr)
plot(df$total~df$days)

g <- ggplot(data = df1, 
            aes(x = day, y = total, group = year, col=as.factor(year))) + 
  geom_line()
g

######
