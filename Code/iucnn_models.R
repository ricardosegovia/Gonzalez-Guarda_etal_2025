library(reticulate)
library(tidyverse)
library(IUCNN)
library(magrittr)
library(dplyr)

install.packages("devtools")
library(devtools)
install_github("IUCNN/IUCNN")

total_spp <- read.csv("total_sppXcoord.csv")
head(total_spp)
unique(total_spp$spp)
temp_spp_cat2 <- read.csv("iucn_list_total.csv")
head(temp_spp_cat2)
dim(temp_spp_cat2)
table(temp_spp_cat2$iucn_cat)

##removing labels DD, LR/lc, LR/nt, LR/cd, EW and EX
temp_spp_cat2[is.na(temp_spp_cat2)] <- "NA"
temp_spp_cat2$iucn_cat <- gsub("DD", "NA", temp_spp_cat2$iucn_cat)
temp_spp_cat2$iucn_cat <- gsub("LR/lc", "LC", temp_spp_cat2$iucn_cat)

selected <- c("CR", "EN", "LC", "NT", "VU", "NA")
temp_spp_cat <- temp_spp_cat2[temp_spp_cat2$iucn_cat %in% selected, ]
spp_cat <- temp_spp_cat[!temp_spp_cat$iucn_cat == "NA", ]
spp_no_cat <- temp_spp_cat[temp_spp_cat$iucn_cat == "NA", ]

total_spp <- total_spp[c(3, 4, 5)]
head(total_spp)
##predict spp from the 3 sub data set##
subdata_spp <- read.csv("speciesXcountry.csv")
head(subdata_spp)
table(subdata_spp$LEVEL3_NAM)
spp_no_cat2 <- spp_no_cat[spp_no_cat$spp %in% subdata_spp$species, ]
dim(spp_no_cat2)
head(spp_no_cat2)
unique(spp_no_cat2$spp)

##data for models
training_occ <- total_spp[total_spp$spp %in% spp_cat$spp, ]
training_occ <- training_occ[c(1, 3, 2)]
head(training_occ)
dim(training_occ)
unique(training_occ$spp)
colnames(training_occ) <- c("species", "decimallongitude", "decimallatitude")
training_labels <- spp_cat[c(3, 4)]
head(training_labels)
dim(training_labels)
colnames(training_labels) <- c("species", "labels")


prediction_occ <- total_spp[total_spp$spp %in% spp_no_cat2$spp, ]
prediction_occ <- prediction_occ[c(1, 3, 2)]
colnames(prediction_occ) <- c("species", "decimallongitude", "decimallatitude")
unique(prediction_occ$species)
head(prediction_occ)
# 1. Feature and label preparation
head(training_occ)
unique(training_occ$species)



features <- iucnn_prepare_features(training_occ) # Training features
str(features)
features_predict <- iucnn_prepare_features(prediction_occ) # Prediction features
str(features_predict)
labels_train <- iucnn_prepare_labels(x = training_labels,
                                     y = features) # Training labels
str(labels_train)
# Model testing
# For illustration models differing in dropout rate and number of layers

# mod_test <- iucnn_modeltest(x = features,
#                            lab = labels_train,
#                            logfile = "model_testing_results-2.txt",
#                            model_outpath = "iucnn_modeltest-2",
#                            mode = "nn-class",
#                            dropout_rate = c(0.0, 0.1, 0.3),
#                            n_layers = c("30", "40_20", "50_30_10"),
#                            cv_fold = 5,
#                            init_logfile = TRUE)

# saveRDS(mod_test, file = "mod_test.rds")

mod_test <- readRDS("mod_test.rds")

str(mod_test)
mod_test$test_acc
mod_test$n_layers
mod_test$dropout_rate
m_best <- iucnn_best_model(x = mod_test,
                          criterion = "val_acc",
                          require_dropout = TRUE)


# Inspect model structure and performance
summary(m_best)
plot(m_best)

# Train the best model on all training data for prediction
m_prod <- iucnn_train_model(x = features,
                            lab = labels_train,
                            production_model = m_best)

str(m_prod)
#Predict RL categories for target species for nn-class
pred <- iucnn_predict_status(x = features_predict,
                             model = m_prod)
plot(pred)

str(pred)

names <- pred$names
iucn_cat <- pred$class_predictions

pred_cat <- as.data.frame((cbind (names, iucn_cat)))
head(pred_cat)
table(pred_cat$iucn_cat)
write.csv(pred_cat, "pred_cat.csv")

colnames(pred_cat) <- c("species", "labels")

table(training_labels$labels)

model_extinctions <- rbind(pred_cat, training_labels)
dim(model_extinctions)

write.csv(model_extinctions, "model_extinction_risk.csv")
