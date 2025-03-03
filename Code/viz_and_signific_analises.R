library(ggplot2)
library(scales)
library(dplyr)
library(ggsci) 


model_risk <- read.csv("model_extinction_risk.csv")
head(model_risk)
fruit_type <- read.csv("dataset_fruit_type.csv")
head(fruit_type)
dim(fruit_type)

dataset_temp <- merge(fruit_type, model_risk, by = "species")
dim(dataset_temp)
head(dataset_temp)

table(dataset$labels)

# grouping megafauna and labels
dataset$labels2 <- dataset$labels
dataset$labels2 <- gsub("NT","LC",dataset$labels2)
dataset$labels2 <- gsub("CR","UR",dataset$labels2)
dataset$labels2 <- gsub("EN","UR",dataset$labels2)
dataset$labels2 <- gsub("VU","UR",dataset$labels2)
table(dataset$labels2)

dataset$Megafauna2 <- dataset$Megafauna
dataset$Megafauna2 <- gsub("2","1",dataset$Megafauna2)
dataset$Megafauna2 <- gsub("3","1",dataset$Megafauna2)
dataset$Megafauna2 <- gsub("4","1",dataset$Megafauna2)
table(dataset$Megafauna2)
write.csv(dataset, "spp_table.csv")

# Plot

plot1 <- ggplot(dataset, aes(fill = labels2, x = Megafauna2)) +
  facet_wrap(~ LEVEL3_NAM, ncol = 4) +
  geom_bar(position = "fill") +
  geom_text(aes(label = unlist(tapply(..count.., list(..x.., ..PANEL..), 
                               function(a) paste(round(100 * a / sum(a), 0), '%'))),
                y = ..count..), 
            stat = "count", 
            position = position_fill(vjust = .5)) +
 scale_color_npg() +
       scale_fill_manual(
    values = c("LC" = "#4dbbd5", "UR" = "#e64b35"),
    name = "Extinction risk",
    labels = c("Low Concern", "Under Risk")
  ) +
  xlab("Megafaunal fruit (0=FALSE, 1=TRUE)") +
  ylab("Percentage")

plot1
#############3


# Significance analises

head(dataset_temp)
dataset_2 <- dataset_temp

dataset_2$Megafauna2 <- dataset_2$Megafauna
dataset_2$Megafauna2 <- gsub("2","1",dataset_2$Megafauna2)
dataset_2$Megafauna2 <- gsub("3","1",dataset_2$Megafauna2)
dataset_2$Megafauna2 <- gsub("4","1",dataset_2$Megafauna2)
table(dataset_2$Megafauna2)

dataset_2$bars <- paste(dataset_2$LEVEL3_NAM, dataset_2$Megafauna2, sep="_")
head(dataset_2)



set.seed(1234)
dataset_rep<-dataset_2
head(dataset_rep)
nreps=1000 ###last run will be with 10000 reps

count <- xtabs(~ bars + labels, data = dataset_2)
count_percent <- round((count / rowSums(count)) * 100, 2)

data_null <- array(dim=c(nrow(count_percent),ncol(count_percent),nreps),dimnames=list(bars=rownames(count_percent),labels=colnames(count_percent),rep=1:nreps))

data_null
dim(data_null)
dim(count_temp)
ncol(count_percent)

for(i in 1:nreps) {
    print(i)

    tmp_labels<- sample (dataset_rep$labels)
    tmp_com <- cbind(dataset_rep$bars, tmp_labels)
    colnames(tmp_com) <- c("bars", "labels")

    count_temp <- xtabs(~ bars + labels, data = tmp_com)
    percent_temp <- round((count_temp / rowSums(count_temp)) * 100, 2)
    data_null[, , i] = percent_temp

save(data_null, file = "percent_null3.RData")
}



load("percent_null3.RData")
ls()
str(data_null)

null_mean <- apply(data_null,c(1,2),quantile,probs=c(0.025,0.975))
dim(null_mean)
str(null_mean)
zz<-as.data.frame.table(null_mean)
zz
zz5<-zz[zz$Var1=="2.5%",]
zz5<-zz5[,c(2,4)]
zz95<-zz[zz$Var1=="97.5%",]
zz95<-zz95[,c(2,4)]
percent_obs<-as.data.frame.table(count_percent)
colnames(percent_obs)<-c("bars","labels","Freq.obs")
zz3<-cbind(zz5, zz95)
zz4<-cbind(zz3, percent_obs)
head(zz4)

write.csv(zz4, "table_freq2.csv")



## significance analysis for UR and LC
# Significance analises

head(dataset_temp)
table(dataset_temp$labels)
dataset_2 <- dataset
head(dataset_2)
table(dataset_2$Megafauna2)


dataset_2$bars <- paste(dataset_2$LEVEL3_NAM, dataset_2$Megafauna2, sep="_")
head(dataset_2)


set.seed(1234)
dataset_rep<-dataset_2
head(dataset_rep)
nreps=1000 ###last run will be with 10000 reps

count <- xtabs(~ bars + labels2, data = dataset_2)
count_percent <- round((count / rowSums(count)) * 100, 2)

data_null <- array(dim=c(nrow(count_percent),ncol(count_percent),nreps),dimnames=list(bars=rownames(count_percent),labels=colnames(count_percent),rep=1:nreps))

data_null
dim(data_null)
dim(count_temp)
ncol(count_percent)

for(i in 1:nreps) {
    print(i)

    tmp_labels<- sample (dataset_rep$labels2)
    tmp_com <- cbind(dataset_rep$bars, tmp_labels)
    colnames(tmp_com) <- c("bars", "labels")

    count_temp <- xtabs(~ bars + labels, data = tmp_com)
    percent_temp <- round((count_temp / rowSums(count_temp)) * 100, 2)
    data_null[, , i] = percent_temp

save(data_null, file = "percent_null4.RData")
}



load("percent_null4.RData")
ls()
str(data_null)

null_mean <- apply(data_null,c(1,2),quantile,probs=c(0.05,0.93))
null_mean
dim(null_mean)
str(null_mean)
zz<-as.data.frame.table(null_mean)
zz
zz5<-zz[zz$Var1=="2.5%",]
zz5<-zz5[,c(2,4)]
zz95<-zz[zz$Var1=="97.5%",]
zz95<-zz95[,c(2,4)]
percent_obs<-as.data.frame.table(count_percent)
colnames(percent_obs)<-c("bars","labels","Freq.obs")
zz3<-cbind(zz5, zz95)
zz4<-cbind(zz3, percent_obs)
head(zz4)

write.csv(zz4, "table_freq3.csv")
