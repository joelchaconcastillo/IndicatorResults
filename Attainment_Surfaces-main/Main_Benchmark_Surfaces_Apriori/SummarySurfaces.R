## Autor: Joel Chacón Castillo
## Descripción: En este fichero se cargan las superficies de cubriemiento del benchmark WFG y se imprime una imagen de cada instancia...
library("eaf")


#pdf("WFG",width=10,height=10,paper='special') 
#Instances = c("WFG1", "WFG2", "WFG3", "WFG4","WFG5", "WFG6", "WFG7", "WFG8", "WFG9", "UF1", "UF2", "UF3", "UF4", "UF5", "UF6", "UF7", "IMB1", "IMB2", "IMB3", "IMB7", "IMB8", "IMB9", "DTLZ1", "DTLZ2", "DTLZ3", "DTLZ4", "DTLZ5", "DTLZ6", "DTLZ7")
Instances = c("WFG1", "WFG2", "WFG3", "WFG4","WFG5", "WFG6", "WFG7", "WFG8", "WFG9", "UF1", "UF2", "UF3", "UF4", "UF5", "UF6", "UF7", "DTLZ1", "DTLZ2", "DTLZ3", "DTLZ4", "DTLZ5", "DTLZ6", "DTLZ7")

for( i in Instances){
	setEPS()
	postscript(paste(i,".eps", sep=""))
#	postscript(paste(i,".eps", sep=""), width=7, height=7)

	vsdhv=  read_datasets(paste( "data/VSD_HV_", i, sep=""))
	vsdr2=  read_datasets(paste( "data/VSD_R2_", i, sep=""))
	r2=  read_datasets(paste( "data/R2_EMOA_", i, sep=""))
	hv=  read_datasets(paste( "data/SMS_EMOA_", i, sep=""))
	OPTIMAL =  read_datasets(paste("Optimals/",i,"_2.txt", sep=""))
	data=data.frame(vsdhv, groups="VSD-SMS-EMOA")
	data=rbind(data, data.frame(hv, groups="SMS-EMOA"))
	data=rbind(data, data.frame(vsdr2, groups="VSD-R2-EMOA"))
	data=rbind(data, data.frame(r2, groups="R2-EMOA"))
        colors = c("orange", "brown", "purple",  "blue")
	#eafplot( data[,1:2],sets=data[,3],groups=data[,4], percentiles=c(50), col=colors, lty = c("dashed", "twodash", "dotdash", "dotted"), xlab="Objective 1", ylab="Objective 2",  main=i, extra.points=OPTIMAL, extra.pch=16, cex=0.1, extra.col="red", extra.legend=c("Pareto Front"))
	eafplot( data[,1:2],sets=data[,3],groups=data[,4], percentiles=c(50), col=colors, lty = c("solid","dotted","solid","dotdash"), xlab="Objective 1", ylab="Objective 2",  main=i, extra.points=OPTIMAL, extra.pch=16, cex=0.000001, extra.col="red", extra.legend=c("Pareto Front"), xlim=c(0.6, 2.3))
	dev.off()
}
