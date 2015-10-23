######################################
#data obtained from mlssoccer.com    # 
#plots %points earned for all        #
#team-seasons with the same #of games#
#and compares to ideal distribution  #
#                                    #
#written by Craig Kerr               #
#cakerr@cpp.edu                      #
######################################

#change the working directory to wherever you put mls standings 1996-2013.csv
setwd("~/Desktop/Econ/Cal Poly/MLS/blog")
data<-read.csv("mls standings 1996-2013.csv")

#subset gp=32
data_gp32<-subset(data,year==2005 | year==2006 | year<=2000)

x   <- seq(0,1,length=1000)
y   <- dnorm(x,mean=(4/9), sd=sqrt(2/(9*32)))

#use hypothetical pct b/c shootout era included
plot(density(data_gp32$hypothetical_pct, bw=.01),col="blue",
     main="Actual vs. Ideal Density of %Points (1996-2000, 2004-2005)")
lines(x,y, type="l", lwd=2)

#kolmogorov-smirnov test that dist are diff
ks.test(data_gp32$hypothetical_pct,"pnorm",mean=4/9,sd=sqrt(2/(9*32)))

#subset 2003,2004, 2007-2010 all gp=30
data_gp30<-subset(data,year==2003 | year==2004 | year>=2007 & year<=2010)

x   <- seq(0,1,length=1000)
y   <- dnorm(x,mean=(4/9), sd=sqrt(2/(9*30)))


plot(density(data_gp30$pct, bw=.01),col="blue",
     main="Actual vs. Ideal Density of %Points (2003,2004,2007-2010)")
lines(x,y, type="l", lwd=2)

#kolmogorov-smirnov test that dist are diff
ks.test(data_gp30$pct,"pnorm",mean=4/9,sd=sqrt(2/(9*30)))


#subset 2011-2014 all gp=34
data_gp34<-subset(data,year>2010)

x   <- seq(0,1,length=1000)
y   <- dnorm(x,mean=(4/9), sd=sqrt(2/(9*34)))


plot(density(data_gp34$pct, bw=.01),col="blue",
     main="Actual vs. Ideal Density of %Points (2011-2014)")
lines(x,y, type="l", lwd=2)

#kolmogorov-smirnov test that dist are diff
ks.test(data_gp34$pct,"pnorm",mean=4/9,sd=sqrt(2/(9*34)))

