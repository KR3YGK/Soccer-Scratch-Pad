######################################
#data obtained from mlssoccer.com    # 
#plots graphs used in 10/17/15  post #
#                                    #
#written by Craig Kerr               #
#cakerr@cpp.edu                      #
######################################
#for summaryBy() command
library(doBy)


#set working directory to location of data
#Change this to find the data on your computer
setwd("/Users/Craig/Desktop/Econ/Cal Poly/MLS/blog/Soccer-Scratch-Pad/")
data<-read.csv("10.17.15/MLS team data 1996-2012.csv")

#collapse to year level 
collapse<-summaryBy(gp+w+l+t+sow+goals+pct_div ~ year+num_teams,FUN=sum,data=data)
collapse$pct_tie <- (collapse$t.sum / collapse$gp.sum) * 100

#get rid of '.sum' in variable names
names(collapse) <- gsub(".sum", "", names(collapse))

#non-shootout years
noSO<-subset(collapse,year>1999)

#pos option manually moves labels so they don't overlap
plot(noSO$pct_div,noSO$pct_tie,main="% Ties and % Inter-conference Games",xlab="% conference", ylab="& tied in regulation",pch=19,col='blue')
text(noSO$pct_div,noSO$pct_tie, labels=noSO$year, cex=.7,pos=c(3,2,2,2,4,2,2,2,4,2,4,4,2,2,4,4))

#create shootout indicator - must be factor to work in plot below
collapse$SO<-as.factor(collapse$year < 2000)

par(mar=c(7, 4, 4, 4), xpd=TRUE)
plot(collapse$pct_div,collapse$pct_tie,main="% Ties and % Inter-conference Games",xlab="% conference", ylab="& tied in regulation",pch=19,col=c('blue','red')[collapse$SO])
text(collapse$pct_div,collapse$pct_tie, labels=collapse$year, cex=.7,pos=c(2,1,2,4,3,2,2,2,4,2,2,2,4,2,4,4))

#makes a blank plot to put on top so I can center legend at bottom
reset <- function() {
  par(mfrow=c(1, 1), oma=rep(0, 4), mar=rep(0, 4), new=TRUE)
  plot(0:1, 0:1, type="n", xlab="", ylab="", axes=FALSE)
}

reset()
legend("bottom", legend=c('Post-Shootout Era', 'Shootout Era'), pch=c(19,19),col=c('red', 'blue'),ncol=2,box.col='darkblue')


#FINAL PLOT WITH CIRLCE SIZE REPRESENTING % SINGLE TABLE
#add %of guaranteed conference spots in playoffs by hand
collapse$pct_playoff<-0
collapse$pct_playoff[collapse$year>1999 & collapse$year<2003]<-100
collapse$pct_playoff[collapse$year==2007]<-100*(4/13)
collapse$pct_playoff[collapse$year==2008]<-100*(2/14)
collapse$pct_playoff[collapse$year==2009]<-100*(4/15)
collapse$pct_playoff[collapse$year==2010]<-100*(2/16)
collapse$pct_playoff[collapse$year==2011]<-100*(4/18)



noSO$pct_playoff<-0
noSO$pct_playoff[noSO$year>1999 & noSO$year<2003]<-100
noSO$pct_playoff[noSO$year==2007]<-100*(4/13)
noSO$pct_playoff[noSO$year==2008]<-100*(2/14)
noSO$pct_playoff[noSO$year==2009]<-100*(4/15)
noSO$pct_playoff[noSO$year==2010]<-100*(2/16)
noSO$pct_playoff[noSO$year==2011]<-100*(4/18)

nosingle<-subset(collapse,pct_playoff==0 & SO=="FALSE")

par(mar=c(8, 4, 4, 4), xpd=TRUE)
plot(noSO$pct_div,noSO$pct_tie,main="% Ties and % Inter-conference Games", sub="Area of circle proportional to % of teams that make playoffs using a single table", xlab="% conference", ylab="& tied in regulation",pch=1,cex=noSO$pct_playoff/10,col='blue')
text(noSO$pct_div,noSO$pct_tie, labels=noSO$year, cex=.7,pos=c(2,1,2,2,3,2,2,2,4,2,4,4,2))
points(nosingle$pct_div,nosingle$pct_tie,pch=19,col='red')
reset()
legend("bottom", legend=c('No Single Table', 'Some Teams Use Single Table'), pch=c(19,1),col=c('red', 'blue'),ncol=2,box.col='darkblue')
