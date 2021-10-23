Para esta aplicación se ha creado un contenedor dockerfile, con la imagen alpine/bundle. Se ha escogido una imagen alpine por que ocupa menos en memoria, y se ha seleccionado alpine/budle ya que esta imagen además de ser alpine y minimizar su tamaño tiene solo las herramientas necesarias para pasar nuestros tests. En este caso la herramienta principar en el lenguaje ruby y la gema bundle para poder instalar el resto de gemas desde el fichero Gemafile. Los tests son los realizados en entregas anteriores más otros que se añadirán en esta entrega.

Para ejecutar nuestras pruebas en el contenedor docker se ha creado un fichero [Dockerfile](https://github.com/CharlySM/ProyectoCC/blob/master/Dockerfile) donde se carga la imagen con nuestras herramientas para pasar los test, pero además tendremos que instalar una serie de gemas para que nuestros tests funcionen. Contenido fichero [Dockerfile](https://github.com/CharlySM/ProyectoCC/blob/master/Dockerfile).

```
FROM alpine/bundle:latest

# Definimos etiquetas informativas al contenedor
LABEL maintainer = "Carlos <csm89@correo.ugr.es>" \
    org.opencontainers.image.source="https://github.com/CharlySM/ProyectoCC"

WORKDIR /usr/src/app

COPY ./Gemfile .
COPY ./Rakefile .

RUN bundle install

CMD ["rake", "test"]
```

Para que los test funcionen primero copiamos los directorios de nuestra aplicación en el directorio de trabajo. que son los comandos **ADD** del fichero [Dockerfile](https://github.com/CharlySM/ProyectoCC/blob/master/Dockerfile). Después añadimos el fichero principal de la aplicación **index.rb**, luego copiamos el fichero **Rakefile** para poder ejecutar nuestros test y por último copiamos el fichero **Gemfile** el cuál contendra las gemas que tenemos que instalar para poder ejecutar nuestras pruebas.

Además de para hacer los test también se puede ejecutar nuestra aplicación, para ello se ha creado una nueva tarea en nuestro fichero [Rakefile](https://github.com/CharlySM/ProyectoCC/blob/master/Rakefile) para poder ejecutar nuestra tarea, de esta forma podemos ejecutar dos tareas desde nuestro [Rakefile](https://github.com/CharlySM/ProyectoCC/blob/master/Rakefile), la tarea test y la tarea exec. Con la primera tarea ejecutamos nuestros tests y con la segunda ejecutamos nuestra aplicación. Nuestra aplicación esta configurada para que se ejecute por defecto en el puerto 80 del contenedor os sistema en el que se lance.

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

Para ejeceutar el contenido de nuestro contenedor ejecutamos el comando.

```
sudo docker run --rm proyecto
```

Esto ejecutará nuestra tarea que lancemos desde el fichero [Rakefile](https://github.com/CharlySM/ProyectoCC/blob/master/Rakefile).

El funcionamiento de la instalación y ejecución dentro del contenedor es similar a como se hace en el fichero [.travis.yml](https://github.com/CharlySM/ProyectoCC/blob/master/.travis.yml), pero aquí en el contenedor, con la imagen que usamos, ya viene con el lenguaje ruby instalado y la gema bundle, listos para poder usarse. El comando de ejecución **rake** también varia con respecto al comadno que se usa en el ficher de travis. En el contenedor se usa tal y como lo haríamos con una distribución de ubuntu que tenga las herramientas para poder ejecutarlo.
