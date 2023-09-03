#load("/Users/Rob/Dropbox/Mac (6)/Downloads/COMPADRE_v.6.23.5.0.RData")

load("~/Dropbox/GitHub_Dropbox_Drive/GitHub/Diagnostico_Poblacional/Diagnostico_Poblacional/COMPADRE_v.6.23.5.0.RData")


clon <- rep(NA, dim(compadre$metadata)[1])
for (i in 1:dim(compadre$metadata)[1]){
  if (!is.na(sum(compadre$mat[[i]]$matC))) {
    if (sum(compadre$mat[[i]]$matC)>0) {clon[i]<-1} else {clon[i]<-0}
  }
}

library(Rcompadre)
library(tidyverse)

#Which species have clonality:
clone_species=compadre$metadata[which(clon==1),]

clone_species

names(clone_species)
clone=as_cdb(clone_species)

unique(clone_species$Species)
unique(clone_species$Family)

clone_O=clone_species |> 
  filter(Family == "Orchidaceae")

unique(clone_O$Genus) # Only Cyp. calceolus has evidence of clonal growth using clonal matrices
