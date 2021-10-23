Para esta aplicación se ha creado un contenedor dockerfile, con la imagen alpine/bundle. Se ha escogido una imagen alpine por que ocupa menos en memoria, y se ha seleccionado alpine/budle ya que esta imagen además de ser alpine y minimizar su tamaño tiene solo las herramientas necesarias para pasar nuestros tests. Los tests son los realizados en entregas anteriores más otros que se añadirán en esta entrega.

Para ejecutar nuestras pruebas en el contenedor docker se ha creado un fichero [Dockerfile](https://github.com/CharlySM/ProyectoCC/blob/master/Dockerfile) donde se carga la imagen con nuestras herramientas para pasar los test, pero además tendremos que instalar una serie de gemas para que nuestros tests funcionen. Contenido fichero [Dockerfile](https://github.com/CharlySM/ProyectoCC/blob/master/Dockerfile).

```
FROM alpine/bundle:2.4.2

WORKDIR /usr/src/app

ADD ./src ./src
ADD ./test ./test
ADD ./views ./views
COPY ./index.rb .
COPY ./Gemfile .
COPY ./Rakefile .

RUN bundle install

CMD ["rake"]
```

Para que los test funcionen primero copiamos los directorios de nuestra aplicación en el directorio de trabajo. que son los comandos **ADD** del fichero [Dockerfile](https://github.com/CharlySM/ProyectoCC/blob/master/Dockerfile). Después añadimos el fichero principal de la aplicación **index.rb**, luego copiamos el fichero **Rakefile** para poder ejecutar nuestros test y por último copiamos el fichero **Gemfile** el cuál contendra las gemas que tenemos que instalar para poder ejecutar nuestras pruebas.

Para crear nuestra imagen lanzaremos el comando.
```
sudo docker build -t proyecto .
```

Una vez creada nuestra imagen, esta también contendrá las gemas que necesitamos instaladas, ya que al ejecutar el comando anterior se ejecuta también el comando
```
bundle install
```
Este comando instalará todas las gemas que necesitamos para ejecutar nuestras pruebas. Luego ponemos que cuando ejecutemos el contenido del contenedor se ejecute el comando ```rake```. Este comando lanzará el gestor de tareas que es el fichero de configuración **Rakefile**.

Para ejeceutar el contenido de nuestro contenedor ejecutamos el comando.
```
sudo docker run --rm proyecto
```

Esto ejecutará nuestras pruebas que contenga nuestro directorio test. 
