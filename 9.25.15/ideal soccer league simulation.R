######################################
#this code simulates a cometitive MLS# 
#season where each team has equal    #
#probability to win, lose, or tie    #
#and compares simulated mean/sd to   #
#theoretical mean/sd                 #
#                                    #
#written by Craig Kerr               #
#cakerr@cpp.edu                      #
######################################

#20 teams playing 28 games.
#change these numbers to match any year's actual numbers
gp=28
teams=20
season<-t(rmultinom(n=teams,size=gp,prob=c(1/3,1/3,1/3)))

#name col row and convert to data frame
colnames(season)<-c("W","L","T")
rownames(season) <- rownames(season, do.NULL = FALSE, prefix = "Team")
season<-data.frame(season)

#calculate points and %points
attach(season)
season$points<-3*W+T
season$pct<-season$points/(3*gp)
detach(season)

#histogram and mean/sd comparison to ideal
hist(season$pct,freq=F)
idealmean<-4/9
mean<-mean(season$pct)
idealsd<-sqrt(14/(81*gp))
sd<-sd(season$pct)

