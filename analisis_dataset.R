#library(MASS)

data(dataset_consulta)
head(dataset_consulta)
str(dataset_consulta)
summary(dataset_consulta)

table(dataset_consulta$Region)
str(dataset_consulta$gender)
#para poder graficar se convierte a factor
dataset_consulta$gender <- factor(dataset_consulta$gender, levels = c("FEMALE" , "MALE"))
dataset_consulta$age_levels <- factor(dataset_consulta$age_levels, levels = c("ADULT", "MIDDLE AGED" ,"SENIOR" ,"YOUTH"))
dataset_consulta$Distrito <- factor(dataset_consulta$Distrito)
dataset_consulta$Region <- factor (dataset_consulta$Region)
str(dataset_consulta)
summary(dataset_consulta)
#library(caret)
#library(e1071)
str(dataset_consulta)

boxplot(dataset_consulta)

#Gráficos de barras 
barplot(dataset_consulta$TC)
hist(dataset_consulta$TC)
qplot(TC, data=dataset_consulta,geom="histograma")

#Dispersion
qplot(MontoTrans,age_levels, data=dataset_consulta, color=TC)

#Dispersion
qplot(MontoTrans,Distrito, data=dataset_consulta, color=TC)
qplot(MontoTrans,age_levels, data=dataset_consulta, color=TC)
qplot(CantTransacciones,age_levels, data=dataset_consulta, color=TC)
qplot(CantTransacciones,age, data=dataset_consulta, color=TC)
qplot(age,Region, data=dataset_consulta, color=TC)
qplot(age,age_levels, data=dataset_consulta, color=TC)




