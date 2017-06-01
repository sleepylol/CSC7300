# REF: http://jura.wi.mit.edu/bio/education/bioinfo2007/arrays/array_exercises_1R.html

# Install Bioconductor
# source("http://bioconductor.org/biocLite.R")
# biocLite()

# Install Affy
# biocLite("affy")
 require(affy)
 setwd("./Su_CELs/")
 
 #MAS5
 affy.data = ReadAffy()
 eset.mas5 = mas5(affy.data)
 exprSet.nologs = exprs(eset.mas5)
 # List the column (chip) names
 colnames(exprSet.nologs)
 # Rename the column names if we want
 colnames(exprSet.nologs) = c("brain.1", "brain.2", 
                              "fetal.brain.1", "fetal.brain.2",
                              "fetal.liver.1", "fetal.liver.2", 
                              "liver.1", "liver.2")
 exprSet = log2(exprSet.nologs)
 
 ## RMA
 eset.rma = justRMA()
 
 ## GCRMA
 library(gcrma)
 eset.gcrma = justGCRMA()
 
 
 ## dChip (also known as MBEI) 
 eset.dChip = expresso(affy.data, normalize.method="invariantset", 
                       bg.correct=FALSE, pmcorrect.method="pmonly",summary.method="liwong")
 
 eset.dChip.Log = log2(exprs(eset.dChip))
