
# http://www.dodomira.com/2016/04/21/arima_in_r/

str(AirPassengers)
AirPassengers

plot(AirPassengers)
plot(stl(AirPassengers, s.window="periodic"))

#install.packages("tseries")
#install.packages("forecast")
library(tseries)
library(forecast)
# 로그 차분

adf.test(diff(log(AirPassengers)), alternative="stationary", k=0)
auto.arima(diff(log(AirPassengers)))
tsdiag(auto.arima(diff(log(AirPassengers))))


fit <- arima(log(AirPassengers), c(1, 0, 1), 
             seasonal = list(order = c(0, 1, 1),period = 12))

pred <- predict(fit, n.ahead = 10*12)
ts.plot(AirPassengers,2.718^pred$pred, log = "y", lty = c(1,3))
pred$pred
2.718^pred$pred
AirPassengers
