args <- commandArgs(TRUE)

package	<- args[1]
expfile	<- args[2]
outfile	<- args[3]
regulon	<- args[4]
regtype	<- args[5]
mtd		<- args[6]
userLib	<- args[7]

if (!is.na(userLib))  .libPaths(userLib)

if (!("viper" %in% installed.packages()[, "Package"])){
   res <- try(install.packages(package, repos=NULL, type="source"))
   if(inherits(res, "try-error")) q(status=1)
}

library(viper)

expset <- as.matrix(read.table(file=expfile, header=TRUE, row.names=1, sep="\t", check.names=FALSE))

regfile <- paste(path.package(package='viper'), "/data/", regulon, ".rda", sep="")
load(regfile)
#'data(mcf7_cmap2_expset, mcf7_cmap2_tf_regulon)

#'dset <- expset[, 1:100]
tfa <- viper(expset, get(regtype), method=mtd)

dim(tfa)
write.table(tfa, outfile, col.names=NA, sep="\t", quote=FALSE)