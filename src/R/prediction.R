library(dplyr)
library(tidyr)
library(keras)
# Leemos datos
dataTotal <- read.csv(file = "./LaLiga_Matches_1995-2021.csv", check.names=FALSE)

#Comprobamos que no hay rows no informadas ni erroneas.
summary(dataTotal)

#Borramos los datos nulos o no informados
dataTotal <- dataTotal[complete.cases(dataTotal), ]

summary(dataTotal)

#Seleccionamos nuestras columnas para la prediccion
dataTotal<-dataTotal[,c("HomeTeam","AwayTeam","FTR")]

dataTotal<-transform(dataTotal, HomeTeam = as.numeric(as.factor(HomeTeam)),
               AwayTeam = as.numeric(as.factor(AwayTeam)),
             FTR = as.numeric(as.factor(FTR)))

# Creamos el conjunto de entrenamiento y test
ind <- sample(2, nrow(dataTotal), replace=TRUE, prob=c(0.67, 0.33))

dataTotal.training <- dataTotal[ind==1, 1:3]
dataTotal.test <- dataTotal[ind==2, 1:2]

dataTotal.trainingtarget <- dataTotal[ind==1, 3]
dataTotal.testtarget <- dataTotal[ind==2, 3]

# Creamos la variable objetivo para el entrenamiento
trainingtarget <- as.numeric(as.factor(dataTotal.training[,c("FTR")]))  # includes the dependent variable status for the training data
y_trainingtarget<-trainingtarget-1
dataTotal.training<- dataTotal.training[,1:2]
training_labels<-to_categorical(y_trainingtarget)

# Creamos modelo
model <- keras_model_sequential() %>%
    layer_dense(units=16,activation="relu", input_shape =  ncol(dataTotal.training)) %>%
    layer_dense(units=256,activation="softmax") %>%
    layer_dense(units=128,activation="relu") %>%
    layer_dense(units=1)

model %>% compile(
  optimizer = "Nadam",
  loss = "mae",
  metrics = c("accuracy")
)

# Entrenamiento del modelo
history <- model %>% fit(
  x = as.matrix(dataTotal.training),
  training_labels,
  steps_per_epoch = 50,
  epochs = 15,
  batch_size=128)
