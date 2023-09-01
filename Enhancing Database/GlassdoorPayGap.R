# Matthew Kim
# 9/1/23
# Analyzing GlassDoor Information with R

library(dplyr)
library(sf)
library(spData)
library(tmap)
library(ggplot2)
library(stringr)

payGap <- read.csv('/Users/matthewkim/Desktop/gender_pay_gap/GlassdoorGenderPayGap.csv')
payGap

plotPay <- payGap |>
  mutate(salary = (BasePay + Bonus)) |>
  select(Gender, salary)
plotPay

## Turning men and women variables into integers so i can plot (1 = man, 2 = woman)
plotPay$Gender <- str_replace_all(plotPay$Gender, "Male", "1")
plotPay$Gender <- str_replace_all(plotPay$Gender, "Female", "2")
# Integer!
plotPay$Gender <- as.integer(plotPay$Gender)
salary <- plotPay$salary

plot(plotPay)
png("plotPay.png", width = 6, height = 6, units = "in", res = 300)

summarized <- payGap |>
  group_by(Gender) |>
  summarize(mean_pay = mean(BasePay + Bonus))
summarized

jobPayGap <- payGap |>
  group_by(Gender, JobTitle) |>
  summarize(mean_pay = mean(BasePay + Bonus))
jobPayGap

jobPayGapMen <- jobPayGap |>
  filter(Gender == "Male")
jobPayGapWomen <- jobPayGap |>
  filter(Gender == "Female")

# Chart Graph Men
png(file = "MeanPayMen.png", width = 24, height = 6, units = "in", res = 1600)
barplot(jobPayGapMen$mean_pay, names.arg=jobPayGapMen$JobTitle, xlab = "DifferentJobs", ylab = "MeanPay",col="blue",
        main="MeanPayMen",border="black")
# Save the file
dev.off()

# Chart Graph Women
png(file = "MeanPayWomen.png", width = 24, height = 6, units = "in", res = 1600)
barplot(jobPayGapWomen$mean_pay, names.arg=jobPayGapWomen$JobTitle, xlab = "DifferentJobs", ylab = "MeanPay", col="blue",
        main="MeanPayWomen",border="black")
# Save the file
dev.off()


