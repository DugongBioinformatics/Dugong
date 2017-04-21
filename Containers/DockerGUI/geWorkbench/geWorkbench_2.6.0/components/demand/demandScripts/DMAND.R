print(Sys.time())
library(MASS)

## Load parameters #############################################################################
args <- commandArgs(TRUE)
paramFile <- args[1]
par <- read.table(paramFile, sep="\t", header=T)
exp.file <- as.character(par$value[which(par$parameter=="expfile")])
network.file <- as.character(par$value[which(par$parameter=="network_file")])
annotation.file <- as.character(par$value[which(par$parameter=="ANNOTFILE")])
sample.info.file <- as.character(par$value[which(par$parameter=="phenotypefile")])
result.dir <- as.character(par$value[which(par$parameter=="DIR")])
dir.create(result.dir, showWarnings=FALSE)

## Prepare data
r.exp.data <- read.table(exp.file, sep="\t", header=T)
exp.data <- r.exp.data[,c(3:ncol(r.exp.data))]; exp.anno <- as.character(r.exp.data$Annotation)
r.interactome <- as.matrix(read.table(network.file, sep="\t", header=T))
r.anno <- read.table(annotation.file, sep=",", header=T)

# preprocessing interactome file (convert GI to Gene symbol)
gi.to.symbol.network <- function(yy){
	gene.1 <- yy[1]
	gene.2 <- yy[2]
	gene.1.idx <- which(r.anno[,"Entrez.Gene"] == gene.1)
	gene.2.idx <- which(r.anno[,"Entrez.Gene"] == gene.2)
	if( length(gene.1.idx)==0 | length(gene.2.idx) ==0){
		return()
		}
	gene.1.symbol <- as.character(r.anno[,"Gene.Symbol"][gene.1.idx[1]])
	gene.2.symbol <- as.character(r.anno[,"Gene.Symbol"][gene.2.idx[1]])
	rs <- c(gene.1.symbol, gene.2.symbol, yy[3:length(yy)])
	return(rs)
	}
proc.interactome <- apply(r.interactome, 1, gi.to.symbol.network)
interactome.all <- matrix(unlist(proc.interactome), ncol=ncol(r.interactome),byrow=T)
colnames(interactome.all) <- colnames(r.interactome)

## Prep interactome
platform.gene <- unique(as.character(r.exp.data[,2]))
temp.idx <- apply(interactome.all, 1, temp <- function(yy){
                        if( length(intersect(yy[1:2], platform.gene)) ==2){return(1)}
                        else{return(0)}
                        })
interactome.all <- interactome.all[which(temp.idx==1),]
interactome <- interactome.all[,1:2]
all.gene <- intersect(unique(as.vector(as.matrix(interactome))), platform.gene)

## Prep expression data matrix
p.exp.data <- c()
flush <- apply(as.matrix(all.gene), 1, temp <- function(g){
                probe.idx <- which(r.exp.data[,2]==g)
                if(length(probe.idx)==1){
                        p.exp.data <<- rbind(p.exp.data, exp.data[probe.idx,])
                        }else{
                        temp.exp.mat <- exp.data[probe.idx,]
                        temp.cv <- apply(temp.exp.mat, 1, temp <- function(yy){
                                                        rs <- sd(yy) / mean(yy)
                                                        return(rs)
                                                        })
                        p.exp.data <<- rbind(p.exp.data, temp.exp.mat[which(temp.cv == max(temp.cv))[1],])
                        }
                })
rownames(p.exp.data) <- all.gene
colnames(p.exp.data) <- colnames(exp.data)
exp.data <- p.exp.data


## Prep Sample
fg.id <- as.numeric(strsplit(readLines(sample.info.file)[1], split="\t")[[1]][-1])
bg.id <- as.numeric(strsplit(readLines(sample.info.file)[2],  split="\t")[[1]][-1])



####### D-MAND Function Definitions #############################################################

# For each gene, this function integrates all the p-value (significance of dysregulation) of edges surrounding the gene using Fisher's Method
# Correction is done for Fisher's Method 
get.comb.p <- function(g){
        nbs.ix <- nbs.idx[[g]];if(length(nbs.ix)<2){return(1)} # get information for neighbors from index list
        nbs <- setdiff(as.character(kl.edge[nbs.ix,1:2]), g);if(length(nbs) < 2){return(1)}
        temp.kl.edge <- kl.edge[nbs.ix,]
        pvec <- apply(as.matrix(nbs),1,temp<-function(nb){temp.kl.edge[which(temp.kl.edge[,1]==nb|temp.kl.edge[,2]==nb)[1],4]}) #this step is needed if there is a duplication in the interactome. If so, # of nbs and #of pvec is different. so that the chisq will be inflated.

        # Integrate p-value ifrom Fisher's method
        pvec <- as.numeric(pvec); pvec[which(pvec==0)] <- 10^-20
        int.p.chisq <- -2 * sum(log(pvec))

        # Correct  dependency structure among edges (partial correlation)
        # Get partial correlation among all-pairwise neighbors
	g.exp.vec <- exp.data[g,]

        ## Precalculate residual expression for all neighbors
	res.exp <- list()
        flush <- apply(as.matrix(nbs),1,temp<-function(n){
                                y <- as.numeric(exp.data[n,])
                                x <- as.numeric(g.exp.vec)
                                xp <- cbind(x,rep(1,length(x)))
                                res <- y- (xp %*% ginv(xp) %*% y)
                                res <- as.vector(res)
                                res.exp[[n]] <<-  res
                               })

        comb.nbs <- combn(nbs,2)
        comb.nbs.cor <- apply(comb.nbs,2, temp<-function(nn){
                                #Measure correlation only for PDI edges
                                n1.ppi.idx <- ppi.idx[[g]][which(ppi.idx[[g]][,1]==nn[1]),2]
                                n2.ppi.idx <- ppi.idx[[g]][which(ppi.idx[[g]][,1]==nn[2]),2]
                                if(n1.ppi.idx==1 | n2.ppi.idx==1){return(0)}else{
                                res.n1.exp <- res.exp[[nn[1]]];res.n2.exp <- res.exp[[nn[2]]]
                                cor <- abs(as.vector(cor(res.n1.exp,res.n2.exp)))
                                }
                                return(cor)}
                                )

        # Calculate values for correction
        mean.chisq <- 2 * length(nbs) # mean for Fisher's method chisq
        # variance for Fisher's method chisq
        cov.chisq <- comb.nbs.cor*(3.25+0.75*comb.nbs.cor)
        var.chisq <- 4*length(nbs) + 2*sum(cov.chisq)
        f = (2*(mean.chisq)^2)/var.chisq
        c = var.chisq/(2*(mean.chisq))
        # correct the original chisq value
        corr.p.chisq <- int.p.chisq/c
        rs <- pchisq(corr.p.chisq ,df=f,lower=FALSE) # corrected p-value
        return(rs)

        }


# This function get variance for Gaussian kernel
kernelDensityBandwidth <- function(data,varargin){

        # Written by Jung Hoon Woo 2012.01.11
        # Original MATLAB code was written by Mukesh Bansal
        # Set Default Parameters
        prop <- 1.06 # Gaussian
        dim <- 1 # Dimension of data

        # Parse input parameters
        sig <- sd(data)
        iqrSig <- .7413*IQR(data)     # find interquartile range sigma est.
        if (max(iqrSig)==0){
                iqrSig<-sig
                }
        sig = min(sig,iqrSig)

        # Computing bandwidth
        n = length(data)
        h = prop * sig * n^(-1/(4+dim))

        return(h)
        }


# Compute 2-dimensional Gaussian distribution
mvn <- function(arg, mu,covariancematrix){
        x = arg[1]; y=arg[2]
        y = exp(-0.5*(((x - mu[1])/sqrt(covariancematrix[1,1]))^2
                +((y - mu[2])/sqrt(covariancematrix[2,2]))^2))
        y = y/(2*pi*sqrt(covariancematrix[1,1])*sqrt(covariancematrix[2,2]))
        return(y)
        }


# Measure probability density matrix for each edge
get.pdm <- function(xdata, ydata, xrange, yrange, sigmaX, sigmaY, covarianceMatrix){
	# Make entire space
        sum.mvn.p.matrix<- matrix(0, ncol=max(yrange), nrow=max(xrange))
        colnames(sum.mvn.p.matrix) <- as.character(xrange)
        rownames(sum.mvn.p.matrix) <- as.character(rev(yrange))
	
        for(n in c(1:length(xdata))){
                mu.x <- xdata[n]
                mu.y <- ydata[n]

                # Check if it is already cacluated for a certain set of parameters
                mvn.p.matrix <- global.prob.matrix[[paste(mu.x, "-", mu.y, "-", sigmaX, "-", sigmaY, sep="")]]

                if(is.null(mvn.p.matrix)){
                        mvn.p.matrix <- matrix(0,  ncol=max(yrange), nrow=max(xrange))
                        colnames(mvn.p.matrix) <- as.character(xrange)
                        rownames(mvn.p.matrix) <- as.character(rev(yrange))
			
			# Measure probability for each point in the matrix based on Gaussian kernel
                        for(i in xrange){
                                for(j in yrange){
                                        temp.mvn.p <- mvn(c(i, j), c(mu.x, mu.y), covarianceMatrix)
                                        mvn.p.matrix[as.character(j),as.character(i)] <- temp.mvn.p
                                        }
                                }
                        global.prob.matrix[[paste(mu.x, "-", mu.y, "-",sigmaX, "-", sigmaY,sep="")]] <<- mvn.p.matrix
                        sum.mvn.p.matrix <- sum.mvn.p.matrix + mvn.p.matrix
                        } else{
                        sum.mvn.p.matrix <- sum.mvn.p.matrix + mvn.p.matrix
                        }
                }
	return(sum.mvn.p.matrix)
	}



# Measure KL divergence between 2d-mesional distribution of FG and BG to measure the significance of an edge
# yy is an each row of the interactome
get.sigEdge.KLD <- function(yy, bg.id, fg.id){
        edge.1 <- yy[1] #assuming that 2nd and 4th element of each row of interatome are genes (symbol)
        edge.2 <- yy[2]

        # get expression values of the genes which consist the edge
        temp.x <- exp.data[edge.1,c(bg.id,fg.id)]
        temp.y <- exp.data[edge.2,c(bg.id,fg.id)]

        # rank transformation
        x <- rank(temp.x, ties.method="first")
        y <- rank(temp.y, ties.method="first")

        # column space is changed into the {foreground smaples + background samples) onlt
        temp.bg.id <- c(1:length(bg.id))
        temp.fg.id <- c((length(bg.id)+1):(length(bg.id)+length(fg.id)))

        xdata.bg <- x[temp.bg.id]; xdata.fg <- x[temp.fg.id]
        ydata.bg <- y[temp.bg.id]; ydata.fg <- y[temp.fg.id]
        xrange <- c(1:max(x))
        yrange <- c(1:max(y))

        # Kernel for Reference samples
        sigmaX.bg <- round(kernelDensityBandwidth(xdata.bg));if(sigmaX.bg==0){sigmaX.bg<-0.1}
        sigmaY.bg <- round(kernelDensityBandwidth(ydata.bg));if(sigmaY.bg==0){sigmaY.bg<-0.1}
        if(sigmaX.bg <= 0.5){sigmaX.bg <- 0.1}
        if(sigmaY.bg <= 0.5){sigmaY.bg <- 0.1}
        covarianceMatrix.bg <- matrix(c(sigmaX.bg^2,0,0,sigmaY.bg^2),nrow=2, byrow=T)
        sigmaX.fg <- round(kernelDensityBandwidth(xdata.fg))
        sigmaY.fg <- round(kernelDensityBandwidth(ydata.fg))
        if(sigmaX.fg <= 0.5){sigmaX.fg <- 0.1}
        if(sigmaY.fg <= 0.5){sigmaY.fg <- 0.1}
        covarianceMatrix.fg <- matrix(c(sigmaX.fg^2,0,0,sigmaY.fg^2),nrow=2, byrow=T)

        sum.mvn.p.matrix.bg <- get.pdm(xdata.bg, ydata.bg, xrange, yrange, sigmaX.bg, sigmaY.bg, covarianceMatrix.bg)
        sum.mvn.p.matrix.fg <- get.pdm(xdata.fg, ydata.fg, xrange, yrange, sigmaX.fg, sigmaY.fg, covarianceMatrix.fg)

        sum.mvn.p.matrix.bg[which(sum.mvn.p.matrix.bg==0)] <- 10^-100 # remove 0 for log calculation
        sum.mvn.p.matrix.fg[which(sum.mvn.p.matrix.fg==0)] <- 10^-100
        kld.1 <- sum(sum.mvn.p.matrix.bg*log(sum.mvn.p.matrix.bg / sum.mvn.p.matrix.fg))
        kld.2 <- sum(sum.mvn.p.matrix.fg*log(sum.mvn.p.matrix.fg / sum.mvn.p.matrix.bg))
        kld <- kld.1 + kld.2
        result <- c(edge.1, edge.2, kld)

        return(result)
        }


get.KLD.p <- function(kld){
        kld.value <- as.numeric(kld[3])
        kld.p <- length(which(null > kld.value)) / length(null)
        return(kld.p)
        }



## Preprocessing
global.prob.matrix <- list() # Set global variable to store probability density genetred from Gaussian kernel. If probability density is already calculated for  certain meanX, meanY, varX, varY, just use it to reduce the computing time


# Make a null distribution for KL divergence.
p.1 <- sample(all.gene, 100, replace=T); p.2 <- sample(all.gene, 100, replace=T);p.out <- which(p.1==p.2)
if( length(p.out) > 0){p.1 <- p.1[-p.out]; p.2 <- p.2[-p.out]}
permute.interactome <- cbind(p.1, p.2) # Make permuted interactome
temp.null <- apply(permute.interactome, 1, get.sigEdge.KLD, bg.id, fg.id)
null <- as.numeric(temp.null[3,])


## Run main step
kld.mat <- apply(interactome, 1, get.sigEdge.KLD, bg.id, fg.id) # Measure KL divergence for each edge
kld.mat <- t(kld.mat)
kl.pvec <- apply(kld.mat, 1, get.KLD.p) #get p-value from the kl.edge
kl.edge <- cbind(kld.mat, kl.pvec)
colnames(kl.edge) <- c("gene1", "gene2", "KLD", "KLD.p")
write.table(kl.edge, paste(result.dir, "KL_edge.txt",sep=""), sep="\t", col.names=T, row.names=F, quote=F)


## Extra steps for optimization (make it fast)
## Indexing probe ID, and neighboing genes
nbs.idx <- list()
flush <- apply(as.matrix(all.gene),1,temp<-function(g){nbs.idx[[g]]<<-which(kl.edge[,1]==g | kl.edge[,2]==g)})
ppi.idx <- list()
flush <- apply(as.matrix(all.gene),1,temp<-function(g){
		nbs.ix <- nbs.idx[[g]]
       		nbs <- setdiff(as.character(kl.edge[nbs.ix,1:2]), g)
		nbs.ppi.idx <- apply(as.matrix(nbs), 1, temp <- function(n, g){
			temp <- interactome.all[,"ppi"][which((interactome[,1]==n & interactome[,2]==g)|(interactome[,1]==g & interactome[,2]==n))][1]
			return(temp)
			}, g)
		ppi.idx[[g]] <<- cbind(nbs, nbs.ppi.idx)
		})

# Scan network and check if significant dysregulation is enriched in a certain part of network using Fisher's Method
print("Fisher's Method test") 
fp.vec <- apply(as.matrix(all.gene),1,get.comb.p) # Integrating p-values using Fisher's Method
fp.adjp <- p.adjust(fp.vec)

## add info
nbs.length <- apply(as.matrix(all.gene), 1, temp<-function(g){
				rs <- length(nbs.idx[[g]])
				return(rs)
				})
chr.loc <- apply(as.matrix(all.gene), 1, temp<-function(g){
				temp.idx <- which(r.anno[,"Gene.Symbol"] == g)[1]
                                rs <- as.character(r.anno[temp.idx,"Chromosomal.Location"])
                                return(rs)
                                })

fp.result <- data.frame(Gene=all.gene, ChrLocation=chr.loc, Conn=nbs.length, Pvalue=fp.vec, Adjp=fp.adjp)
fp.result <- fp.result[sort(fp.vec, decreasing=F, index.return=T)$ix,]
write.table(fp.result, paste(result.dir, "DMAND_result.txt",sep=""),sep="\t", col.names=T, row.names=F, quote=F)

## Generate Module (Cytoscape input)
top.gene <- fp.result$Gene[1:40]
edges <- kl.edge
idx <- apply(edges, 1, temp <-function(yy){
                                if( length(intersect(yy[1:2], top.gene))==2){return(1)}else{return(0)}
                                })
edges <- edges[which(idx==1),]
dys <- apply(edges, 1, temp <- function(yy){
                                if( as.numeric(yy[4]) < 0.05) {return("dys")}else{return("none")}
                                })
dir <- apply(edges, 1, temp <- function(yy){
                                dir <- interactome.all[,"Dir"][which(interactome.all[,"Gene1"] == yy[1] & interactome.all[,"Gene2"] == yy[2])]
                                return(dir)
                                })
rs <- cbind(Gene1=edges[,1], Gene2=edges[,2], Dysreg=dys, Dir=dir)
write.table(rs, paste(result.dir, "Module.txt", sep=""), sep="\t", col.names=T, row.names=F, quote=F)
print(Sys.time())
