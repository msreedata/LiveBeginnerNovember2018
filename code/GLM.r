data(tips, package='reshape2')
head(tips)
table(tips$time)

time1 <- glm(time ~ total_bill, data=tips, family=binomial)
summary(time1)

library(coefplot)
coefplot(time1, sort='magnitude')

time2 <- glm(time ~ total_bill + day, data=tips, family=binomial)
coefplot(time2, sort='magnitude')

time3 <- glm(time ~ total_bill + smoker, data=tips, family=binomial)
coefplot(time3, sort='magnitude')

AIC(time1, time2, time3)
BIC(time1, time2, time3)

coefplot(time2, sort='magnitude') + xlim(-25, 25)

table(tips$size)

size1 <- glm(size ~ total_bill + day + time, data=tips, family=poisson)
coefplot(size1, sort='magnitude')
