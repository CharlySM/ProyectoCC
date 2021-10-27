Para esta aplicación se ha creado un contenedor dockerfile, con la imagen ruby:2.7-alpine. Se ha escogido una imagen alpine por que ocupa menos en memoria, y se ha seleccionado alpine/budle ya que esta imagen además de ser alpine y minimizar su tamaño tiene solo las herramientas necesarias para pasar nuestros tests. En este caso la herramienta principal es el lenguaje ruby y la gema bundle para poder instalar el resto de gemas desde el fichero Gemafile. Los tests son los realizados en entregas anteriores más otros que se añadirán en esta entrega.

Esta elección se ha hecho después de probar varias imágenes. Las imágenes probadas han sido **ubuntu:latest**, **ruby:2.7-alpine** y **alpine/bundle:latest**. Hemos comparado lo que ocupan en memoria las imágenes probadas, esto lo podemos ver en la siguiente imagen.

![Imagenes docker](https://github.com/CharlySM/ProyectoCC/blob/master/doc/img/imagenesDocker.png)

Podemos ver en imagen que la imagen docker que mas espacio ocupa en memoria es **alpine/bundle:latest** con 894MB de ocupación en memoria, después la imagen que más ocupa es **ubuntu:latest** que ocupa 432MB y finalmente la que menos ocupa de las tres es **ruby:2.7-alpine** con 275MB. Como podemos ver la diferencia entre la que más ocupa y la que menos es abismal siendo mas del doble la ocupación en memoria, en comparación con la imagen de ubuntu, la imagen de ubuntu casi dobla el espacio ocupado por la imagen de **ruby:2.7-alpine**. Por esta razón ha pesado más esta característica a la hora de tomar la decisión que otra.

Viendo la diferencia de ocupación de las imágenes cabe pensar si es necesario mirar otra capacidad para elegir una imagen distinta ya que que ocupe menos es primordial. La cantidad de capas de una imagen puede aumentar la optimización en la construcción de la imagen. Vamos a ver las capas de las imágenes comparadas.

Capas para **alpine/bundle:latest**.

![alpine/bundle](https://github.com/CharlySM/ProyectoCC/blob/master/doc/img/capasAlpineBundle.png)

Capas para **ubuntu:latest**.

![ubuntu](https://github.com/CharlySM/ProyectoCC/blob/master/doc/img/capasUbuntu.png)

Capas para **ruby:2.7-alpine**.

![rubyAlpine](https://github.com/CharlySM/ProyectoCC/blob/master/doc/img/capasRubyAlpine.png)

Podemos ver que la imagen con mas capas es **alpine/bundle:latest**, por lo que esta imagen la descartamos directamente. Ahora vemos que la imagen de **ubuntu:latest** tiene menos capas que la imagen **ruby:2.7-alpine**. Como hemos dicho antes las diferencia de ocupación de memoria vamos a primar esto por encima del número de capas. Por lo tanto nostros hemos elegido como se escribió al principio la imagen **ruby:2.7-alpine**.

Para ejecutar nuestras pruebas en el contenedor docker se ha creado un fichero [Dockerfile](https://github.com/CharlySM/ProyectoCC/blob/master/Dockerfile) donde se carga la imagen con nuestras herramientas para pasar los test, pero además tendremos que instalar una serie de gemas para que nuestros tests funcionen. Contenido fichero [Dockerfile](https://github.com/CharlySM/ProyectoCC/blob/master/Dockerfile).

```
FROM ruby:2.7-alpine3.14

# Definimos etiquetas informativas al contenedor
LABEL maintainer = "Carlos <csm89@correo.ugr.es>" \
    org.opencontainers.image.source="https://github.com/CharlySM/ProyectoCC"

RUN apk --update add --no-cache --virtual run-dependencies \
      bash \
      build-base

#Añadimos directorio de trabajo si no existe se crea
WORKDIR /app/test

#Copiamos fichero de gemas a usar
COPY ./Gemfile .

#Instalamos las gemas que usamos y borramos fichero de gemas
RUN bundle install \
  && rm Gemfile

#Añadimos comando de ejecucion de test
CMD ["rake", "test"]


```

Para que los test funcionen primero copiamos el archivo para instalar nuestras gemas y poder ejecutar nuestros test, para ello usamos el comando **COPY**, después ejecutamos el comando ```bundle install``` para instalar nuestras gemas que necesitaremos para ejecutar nuestros tests. Después de instalar las gemas borramos el fichero [Gemfile](https://github.com/CharlySM/ProyectoCC/blob/master/Gemfile) con el comando ```rm Gemfile```. Por último creamos el comando que se ejecutará al ejecutar nuestro contendor **rake test**, esto ejecutará los tests de la aplicación.

Además de instalar las dependencias necesarias para ejecutar nuestros test también se crea el directorio de trabajo donde se ejecutarán nuestros test, para hacer esto se usa el comando **WORKDIR**, este comando crea el directorio de trabajo si no existe, si existe lo asigna como directorio de trabajo.

Para crear nuestra imagen lanzaremos el comando.

```
sudo docker build -t proyecto .
```

Donde proyecto es el nombre del contenedor que se ha creado.
Una vez creada nuestra imagen, esta también contendrá las gemas que necesitamos instaladas, ya que al ejecutar el comando anterior se ejecuta también el comando.

```
bundle install
```

Este comando instalará todas las gemas que necesitamos para ejecutar nuestras tareas. Luego ponemos que cuando ejecutemos el contenido del contenedor se ejecute el comando ```rake```. Este comando lanzará el gestor de tareas que es el fichero de configuración **Rakefile**.

Para ejecutar el contenido de nuestro contenedor ejecutamos el comando.

```
sudo docker run -v $(pwd):/app/test proyecto
```
Esto copiará los archivos de nuestro directorio de la app a nuestro directorio de trabajo de docker. Después esto ejecutará nuestra tarea que lancemos desde el fichero [Rakefile](https://github.com/CharlySM/ProyectoCC/blob/master/Rakefile).

El funcionamiento de la instalación y ejecución dentro del contenedor es similar a como se hace en el fichero [.travis.yml](https://github.com/CharlySM/ProyectoCC/blob/master/.travis.yml), pero aquí en el contenedor, con la imagen que usamos, ya viene con el lenguaje ruby instalado y la gema bundle, listos para poder usarse. El comando de ejecución **rake** también varia con respecto al comadno que se usa en el fichero de travis. En el contenedor se usa tal y como lo haríamos con una distribución de ubuntu que tenga las herramientas para poder ejecutarlo.

Se ha cambiado la imagen de docker **ruby:2.7-alpine** por la imagen **ruby:3.0.2-alpine**, ya que se ve que la versión antigua ha dejado de tener acceso a algunas gemas, por lo tanto se ha cogido la versión mas actual. Los test y ejecuciones siguen funcionando igual no ha habido alteraciones en la programación de esto.
