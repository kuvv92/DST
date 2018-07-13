data = read.csv("data3.csv", sep=";")
model = lm(Y~T,data=data)
summary(model)
periodogram = spectrum(model$residuals, plot=FALSE)
Z = which.max(periodogram$spec)
frequency = 1/periodogram$freq[Z[1]]
data["SINZ"]=sin(seq(1,nrow(data))*2*pi/90)
data["COSZ"]=cos(seq(1,nrow(data))*2*pi/90)
data["Z"]=seq(1,nrow(data))*2*pi/90