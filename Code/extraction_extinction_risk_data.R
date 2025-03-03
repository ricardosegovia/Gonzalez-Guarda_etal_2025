## Creating the species list

##Creating databaset

##NeotropTree
# areas <- read.csv("Query 1_ Areas.csv")
# species <- read.csv("Query 2_ Species.csv")
# species$Species<-as.character(species$Species)
# species$Species<-gsub("[^[:alnum:]]", " ", species$Species)
#
# names <- matrix(NA,nrow(species),2)
# for (i in 1:nrow(names)){
#
#   names[i,1] <- unlist(strsplit(species$Species[i],split=" "))[1]
#   names[i,2] <- unlist(strsplit(species$Species[i],split=" "))[2]
#   #names[i,3] <- unlist(strsplit(species$Species[i],split=" "))[3]
#   #names[i,4] <- unlist(strsplit(species$Species[i],split=" "))[4]
#
# }
#
#
# colnames(names) <- c("gen","spp")
# cols <- c("gen", "spp")
#
# names<-as.data.frame(names)
#             names$gen <- as.character(names$gen)
#             names$gen <- gsub("Embotrhyum","Embothrium",names$gen)
#             names$gen <- gsub("Beischmiedia","Beilschmiedia",names$gen)
#             names$gen <- gsub("Macrocapaea","Macrocarpaea",names$gen)
#             names$gen <- gsub("Aspidosperna","Aspidosperma",names$gen)
#             names$gen <- gsub("Aspidoperma","Aspidosperma",names$gen)
#             names$gen <- gsub("Saurauaia","Saurauia",names$gen)
#             names$gen <- gsub("Kielmeyra","Kielmeyera",names$gen)
#             names$gen <- gsub("Dasyohyllum","Dasyphyllum",names$gen)
#             names$gen <- gsub("Nordestamia","Nordenstamia",names$gen)
#             names$gen <- gsub("Chrysoclamys","Chrysochlamys",names$gen)
# ##synonimus
#             names$gen <- gsub("Caphexandra","Capparis",names$gen)
#             names$gen <- gsub("Gentlea","Ardisia",names$gen)
#             names$gen <- gsub("Erythrostemon","Caesalpinia",names$gen)
#             names$gen <- gsub("Tara","Caesalpinia",names$gen)
# ##synonimus according TNRS
#             names$gen <- gsub("Eremosis","Vernonia",names$gen)
#             names$gen <- gsub("Pollalesta","Piptocoma",names$gen)
#             names$gen <- gsub("Yunquea","Centaurodendron",names$gen)
# ###Embothrium grandiflora in unresolved. It could be Oreocalis.
#
#
# names$spp <- do.call(paste, c(names[cols], sep=" "))
#
# names$gen<-names$x<-names$y<-NULL
# species<-cbind(species,names)
# colnames(species)
# head(species)
#
#
#
# speciesXarea <- read.table("Query 4_ Areas-Species.txt",sep=",")
# colnames(speciesXarea)<-c("AreaID","SppID")
#
# ##Let's combine the species and area info and then cut this down to a genus by site table
# speciesXarea_mod <- matrix(NA,nrow(speciesXarea),ncol(speciesXarea))
#
# #first areas
# length(unique(speciesXarea$AreaID))
# length(unique(areas$AreaID))
# ##Difference of 3 sites
#
# speciesXarea_mod[,1] <- as.character(areas$AreaCode[match(speciesXarea$AreaID,areas$AreaID)])
#
# #now let's fill in species
# length(unique(speciesXarea$SppID))
# length(unique(species$spp))
# #5 more species in the species table than are present in the species by area table, need to ask Ary about this at some point
# #anyways, let's add in genus info
# speciesXarea_mod[,2] <- as.character(species$spp[match(speciesXarea$SppID,species$SppID)])
#
# #now let's cut this down to unique genus by site combinations
# sppXarea <- unique(speciesXarea_mod)
# dim(sppXarea)
# sppXarea <- as.data.frame(sppXarea)
#
# head(sppXarea)
# colnames(sppXarea)<-c("AreaCode","spp")
# dim(sppXarea)
# head(areas)
# dim(areas)
# areasNTT<-areas[c("AreaCode","Lat10","Long10")]
# head(areasNTT)
#
# total <- merge(sppXarea,areasNTT,by="AreaCode")
head(total)
dim(total)
write.csv(total,"total_sppXcoord.csv")
#
# #extract IUCNN label per species
# spp_total<-unique(total$spp)


#install.packages("rredlist")
# library(rredlist)
#rl_use_iucn()
#key got in october 08, by mail segovia@ug.uchile.cl
# f91fdd49647ba471d9c1af1acbccd2ce9dd42f994754213c7ebaea9c9f152c8b

# list_temp<-spp_total
##repeti esto porque se interrumpio el proceso en lso 7000 especies. Por eso cree iucn_cat
# list_done<-read.csv("iucn_cat.csv")
# list_temp2<-list_temp[!list_temp%in%list_done$spp]
#
# list_temp3<-as.data.frame(list_temp2)
# rownames(list_temp3)<-list_temp3$list_temp
#
# names <- matrix(NA,nrow(list_temp3),2)
# for (i in 1:nrow(names)){
#
#   names[i,1] <- rownames(list_temp3)[i]
#   dd2<-rl_search(rownames(list_temp3)[i], key= "f91fdd49647ba471d9c1af1acbccd2ce9dd42f994754213c7ebaea9c9f152c8b")
#   dd3<-as.data.frame(dd2$result)
#   if (nrow(dd3)>0) {
#   names[i,2] <- dd3$category}
#
# }

# head(names)
# colnames(names)<-c("spp","iucn_cat")
# names_df<-as.data.frame(names)
# table(names_df$iucn_cat)
#
# write.csv(names_df,"iucn_cat2.csv")

temp_df_1<- read.csv("iucn_cat.csv")
temp_df_11<-temp_df_1[complete.cases(temp_df_1$spp),]

temp_df_2<- read.csv("iucn_cat2.csv")

iucn_list<-rbind(temp_df_11,temp_df_2)

write.csv(iucn_list,"iucn_list_total.csv")

table(iucn_list$iucn_cat)

##10973 de 20557 tienen categoria
