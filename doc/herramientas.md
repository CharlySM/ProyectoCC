Para este proyecto se van a usar varias herramientas distintas, en los siguientes apartadas las vamos a describir.

### Lenguaje.
Tenemos varios microservicios, para los que usaremos lenguajes distintos. Para el primer microservicio que se encarga de entrenar un modelo vamos a usar el lenguaje R ya que este lenguaje te da muchas librerias para poder realizar el entrenamiento. Nosotros vamos a usar keras que es un framework de alto nivel que usa tensorflow. Los datos usados para la predicción estan en un fichero csv. Aunque keras es una librería de python se va a usar la librería miciconda instalada en R para poder usar keras y tensorflow, esto nos permitirá usar también código python junto con el código R, por lo que tendremos mas flexibilidad a la hora de tratar los datos.

Para el segundo microservicio vamos a hacer una api realizada en R, esta api se desarrollará con la librería plumber. Para la predicción se usara keras también como en el entrenamiento del modelo. Se va a realizar esta api en R para poder tener un lenguaje que de facilidades para el tratamiento de los datos. En este caso R es un lencuaje muy usado en DataScience. Para el tratamiento de datos se usara la librería tidyr y dplyr. Los datos se devolverán al tercer microservicio en formato json.

El tercer microservicio es una api que se encargará de mostrar los datos al usuario y realizar las peticiones al segundo microservicio. Este microservicio se va a realizar en ruby con la gema sinatra. Para validar el loggin de los usuarios se guardará la información de los usuarios en una base de datos, también se guardará la información de las peticiones que realiza cada usuario, para poder usar esta información en recomendaciones para los usuarios en el futuro. Se usará ruby con sinatra por el conocimiento que se tiene sobre este lenguaje usando esta gema y por la simplicidad de uso y la gran cantidad de información.

### Base de datos.

La base de datos usada contendrá información sobre los usuarios registrados en la aplicación y las peticiones realizadas por los usuarios registrados. Para el almacenamiento en la base de datos se usará mongoDB, para aprender a usar esta base de datos y base de datos no relacionales.

### Herramientas de integración continua.

Para integración continua se va a usar travis, por el conocimiento que se tiene en esta herramiento que se usó en otras asignaturas y por la gran cantidad de documentación que se puede encontrar.
