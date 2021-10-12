La arquitectura que se va a usar para el proyecto es la arquitectura de microservicios. Donde habrá tres microservicios:

1. Un microservicio entrenará un modelo para hacer las predicciones.
2. El segundo microservicio se encargará de enviar las respuestas de las peticiones con los datos o predicciones que se soliciten.
3. El tercer microservicio será un servicio desde donde se podrá mandar peticiones para la información que se quiere disponer y de mostrar los datos devueltos por el segundo microservicio.

### Descripción de microservicios.

Como se ha descrito antes en la app va a haber 3 microservicios.

1. El primer microservicio entrenará el modelo para realizar una predicción para un resultado de un partido siendo el resultado devuelto si el equipo gana o no. Este microservicio se ejecuta antes de lanzar la applicación ya que el entrenamiento del modelo puede tardar bastante y ralentizar el funcionamiento de la aplicación. Por eso nuestra app cuando haga la predicción solo ejecutará la parte donde se realiza la predicción con el modelo ya entrenado.

2. El segundo microservicio es una api que recibirá peticiones de otra api, las peticiones que recibe puede ser para pedir información sobre el equipo que se consulta, como número de partidos ganados, o para hacer una predicción sobre un partido entre dos equipos. Después devolverá la información a la otra api.

3. El tercer microservicio se encargará de realizar peticiones al segundo microservicio para solicitar cierta información sobre un equipo que se elija o hacer una predicción sobre un partido de fútbol. Después recibirá una respuesta y esta api se encargará de mostrar y organizar la información que se presenta al usuario. También se encargará de validar el loggin de los usuarios para usar la aplicación.

### Diagrama de arquitectura de la aplicación.

![](https://github.com/CharlySM/ProyectoCC/blob/master/doc/img/diagrama.PNG)
