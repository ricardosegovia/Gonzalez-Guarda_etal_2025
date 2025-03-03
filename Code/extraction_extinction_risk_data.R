## Data preparation

## Creating database

##NeotropTree dataser (required in http://www.neotroptree.info)
# total <- netroptree$speciesXarea 

# #extract IUCNN label per species
# spp_total<-unique(total$spp)


#install.packages("rredlist")
#library(rredlist)
#rl_use_iucn()
#key got in october 08, by mail segovia@ug.uchile.cl
# XXX (hidden key)

# list_temp<-spp_total
## "I repeated this because the process was interrupted around 7000 species. That's why I created iucn_cat."
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
#   dd2<-rl_search(rownames(list_temp3)[i], key= "XXX")
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

##10973 out of 20557 species in NeoTropTree dataser have IUCN category
