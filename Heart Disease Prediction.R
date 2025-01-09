library(tidyverse)
library(dslabs)
library(dplyr)
library(caret)
library(lubridate)
library(tidytext)
library("RColorBrewer")
library(randomForest)
library(tictoc)
library(e1071)
library(ggpubr)
install.packages("ggplot2") 
heart_disease_data <- read_csv("Cleveland_hd.csv")
hd_data <- read_csv("heart_cleveland_upload.csv")


hd_data%>%mutate(cond_labelled = ifelse(condition == 1, "Disease", "No Disease")) -> hd_data
ggplot(data = hd_data, aes(x = cond_labelled, y = age, fill = condition)) + geom_boxplot()

#library(tidyverse)
hd_data%>%
  group_by(age, condition)%>%
  summarise(count = n())%>%
  ggplot() + geom_bar(aes(age, count, fill = as.factor(condition)),
                      stat = "Identity") +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 90, size = 10)) +
  ylab("Count") + xlab("Age") + labs(fill = "Condition")

hd_data%>% 
  filter(condition == 1)%>% 
  group_by(age, cp)%>%
  summarise(count = n())%>%
  ggplot() + geom_bar(aes(age, count, fill = as.factor(cp)),stat = 
                        "Identity") +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 90, size = 10)) +
  ylab("Count") + xlab("Age") + labs(fill = "Chest Pain") +
  ggtitle("Age v Count (disease only) for various chest pain 
conditions") +
  scale_fill_manual(values=c("red", "blue", "green", "black"))

#library(ggpubr)
options(repr.plot.width = 20, repr.plot.height = 8)
        hd_data %>% 
          ggballoonplot(x = "age", y = "sex", size = "chol", 
                        size.range = c(5, 30), fill = "condition",
                        show.label = FALSE, ggtheme = theme_bw()) +
          scale_fill_viridis_c(option = "C") +
          theme(axis.text.x = element_text(angle = 90, size = 10)) +
          ggtitle("Age vs. Sex Map") + labs(fill = "Condition")
        
t.test(hd_data$chol~hd_data$condition)
#p-value = 0.165 > 0,05 nen “chol” khong anh huong den “condition” (do tin cay 95%)

chisq.test(hd_data$fbs, hd_data$condition)
#p-value = 1 > 0,05 nen “fbs” khong anh huong den “condition” (do tin cay 95%)

chisq.test(hd_data$restecg, hd_data$condition)
#p-value = 0.008331 < 0,05 nen “restecg” co anh huong den “condition” (do tin cay 95%)

t.test(hd_data$thalach~ hd_data$condition)
#p-value = 6.108e-14 < 0.05 nen "thalach" co anh huong den "condition" (do tin cay 95%)

chisq.test(table(hd_data$exang, hd_data$condition))
#p-value = 9.511e-13 < 0.05 nen "exang" co anh huong den "condition" (do tin cay 95%)

t.test(hd_data$oldpeak~ hd_data$condition)
#p-value = 3.429e-13 < 0.05 nen "oldpeak" co anh huong den "condition" (do tin cay 95%)

chisq.test(table(hd_data$slope, hd_data$condition))
#p-value = 3,63e-10 < 0.05 nen "slope" co anh huong den "condition" (do tin cay 95%)

chisq.test(table(hd_data$ca, hd_data$condition))
#p-value = 1,373e-15 < 0.05 nen "ca" co anh huong den "condition" (do tin cay 95%)

chisq.test(table(hd_data$thal, hd_data$condition))
#p-value = 2.2e-16 < 0.05 nen "thal" co anh huong den "condition" (do tin cay 95%)

# use glm() function from base R and specify the family argument as binomial
model <- glm(data = hd_data, condition ~ age + sex + cp + trestbps + restecg + thalach + exang + oldpeak + slope + ca + thal, family = "binomial")
# extract the model summary
summary(model)



# get the predicted probability in our dataset using the predict() function
pred_prob <- predict(model, hd_data, type = "response")
pred_prob[1:10]

# compare pred_hd column with condition column to check how much correct prediction
hd_data$pred_hd <- ifelse(pred_prob >= 0.5, 1, 0)

# create a newdata data frame to save a new case information or get from dataset hd_data

data = hd_data[c(25,142,251),]
newdata <- data.frame(age = 54,         #Tuoi
                      sex = 1,          #Gioi tinh
                      cp = 3,           #Cac loai dau nguc
                      trestbps = 110,   #Huyet ap
                      restecg = 0,      #Ket qua dien tam do
                      thalach = 70,     #Nhip tim
                      exang = 0,        #Tap the duc gay ra con dau that nguc
                      oldpeak = 0.2,    #ST trầm cảm gây ra do tập thể dục liên quan đến nghỉ ngơi 
                                        #(‘ST’ liên quan đến các vị trí trên đồ thị ECG)
                      slope = 1,        #độ dốc của đoạn ST tập luyện đỉnh cao 
                                        #(Giá trị 1: dốc lên, Giá trị 2: bằng phẳng, Giá trị 3: dốc xuống)
                      ca = 2,           #So luong dong mach chu
                      thal = 0)         #Khiem khuyet o tim

# predict probability for this new case and print out the predicted value
p_new <- predict(model,newdata, type = "response")
p_new 


p_new <- predict(model,hd_data, type = "response")
p_new
temp = 0
for(i in 1:297) {
  if (hd_data[i,14] == hd_data[i,15]) {
    temp = temp + 1
  }
}
temp
percent = temp/297
percent






