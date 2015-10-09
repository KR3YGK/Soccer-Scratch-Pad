#read data and remove empty rows (not sure how these got here but I blame Microsoft)
data<-read.csv("C:/Users/cakerr/Desktop/percent tie 1996-2014.csv")
attach(data)


#for the plot without the lines, exlude the "abline" lines
plot(year,pct_tie,main="% Games Tied in Regulation",ylab="% tied",pch=1,col=4,xaxt="n")
axis(1, at = seq(1996, 2014, by = 1),las=2)
abline(v=1999.5,col="red")
abline(v=2002.5,col="red")
detach(data)