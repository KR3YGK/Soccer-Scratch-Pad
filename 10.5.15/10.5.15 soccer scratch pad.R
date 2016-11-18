######################################
#data obtained from mlssoccer.com    # 
#                                    #
#written by Craig Kerr               #
#cakerr@cpp.edu                      #
######################################

#set working directory to location of data
#Change this to find the data on your computer
setwd("/Users/Craig/Desktop/Econ/Cal Poly/MLS/blog/Soccer-Scratch-Pad/")
data<-read.csv("10.5.15/percent tied 1996-2014.csv")
attach(data)


#for the plot without the lines, exlude the "abline" lines
plot(year,pct_tie_reg,main="% Games Tied in Regulation",ylab="% tied",pch=1,col=4,xaxt="n")
axis(1, at = seq(1996, 2014, by = 1),las=2)
abline(v=1999.5,col="red")
abline(v=2002.5,col="red")
detach(data)