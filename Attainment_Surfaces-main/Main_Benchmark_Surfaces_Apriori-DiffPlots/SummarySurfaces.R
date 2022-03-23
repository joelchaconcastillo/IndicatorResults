## Autor: Joel Chacón Castillo
## Descripción: En este fichero se cargan las superficies de cubriemiento del benchmark WFG y se imprime una imagen de cada instancia...
library("eaf")


#pdf("WFG",width=10,height=10,paper='special') 
Instances = c("WFG1", "WFG2", "WFG3", "WFG4","WFG5", "WFG6", "WFG7", "WFG8", "WFG9", "UF1", "UF2", "UF3", "UF4", "UF5", "UF6", "UF7", "DTLZ1", "DTLZ2", "DTLZ3", "DTLZ5", "DTLZ6", "DTLZ7")

for( i in Instances){
	setEPS()
	postscript(paste(i,"_R2.eps", sep=""), width=10, height=4)
#	pdf(file=paste(i,"_R2.pdf", sep=""), width=10, height=5)
	vsdr2=  read_datasets(paste( "data/VSD_R2_", i, sep=""))
	r2=  read_datasets(paste( "data/R2_EMOA_", i, sep=""))
	OPTIMAL =  read_datasets(paste("Optimals/",i,"_2.txt", sep=""))
	data=data.frame(vsdr2, groups="VSD-R2-EMOA")
	data=rbind(data, data.frame(r2, groups="R2-EMOA"))
        colors = c("orange",  "purple")
	eafdiffplot( vsdr2, r2, xlab="Objective 1", ylab="Objective 2", grand.lines=TRUE,title.left="VSD-R2-EMOA", title.right="R2-EMOA", legend.pos="none", xlim=c(0.6,1.1))
	dev.off()
}

Instances = c("WFG1", "WFG2", "WFG3", "WFG4","WFG5", "WFG6", "WFG7", "WFG8", "WFG9", "UF1", "UF2", "UF3", "UF4", "UF5", "UF6", "UF7", "DTLZ1", "DTLZ2", "DTLZ3", "DTLZ5", "DTLZ6", "DTLZ7")

for( i in Instances){
	setEPS()
	postscript(paste(i,"_HV.eps", sep=""), width=10, height=4)
	vsdhv=  read_datasets(paste( "data/VSD_HV_", i, sep=""))
	hv=  read_datasets(paste( "data/SMS_EMOA_", i, sep=""))
	OPTIMAL =  read_datasets(paste("Optimals/",i,"_2.txt", sep=""))
	data=data.frame(vsdhv, groups="VSD-R2-EMOA")
	data=rbind(data, data.frame(hv, groups="R2-EMOA"))
        colors = c("orange",  "purple")
	eafdiffplot( vsdhv, hv, xlab="Objective 1", ylab="Objective 2", grand.lines=TRUE,title.left="VSD-SMS-EMOA", title.right="SMS-EMOA", legend.pos="none", xlim=c(0.6,1.1))
	dev.off()
}
