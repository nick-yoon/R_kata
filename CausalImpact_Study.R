
# https://google.github.io/CausalImpact/CausalImpact.html#installing-the-package 

rm(list = ls())

#install.packages("CausalImpact")
library(CausalImpact)

set.seed(1)

x1 <- 100 + arima.sim(model = list(ar = 0.999), n = 100)
y <- 1.2 * x1 + rnorm(100)
y[71:100] <- y[71:100] + 10
data <- cbind(y, x1)
#data <- y
#data<-as.data.frame(data)

dim(data)
head(data)
str(data)

matplot(data, type = "l")

pre.period <- c(1, 70)
post.period <- c(71, 100)

impact <- CausalImpact(data, pre.period, post.period)
impact
plot(impact)

time.points <- seq.Date(as.Date("2014-01-01"), by = 1, length.out = 100)
#time.points
data <- zoo(cbind(y, x1), time.points)
data


pre.period <- as.Date(c("2014-01-01", "2014-03-11"))
post.period <- as.Date(c("2014-03-12", "2014-04-10"))

impact <- CausalImpact(data, pre.period, post.period)
plot(impact)



