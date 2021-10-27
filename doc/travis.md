Esto se hizo en los ejercicios del tema 2 para pasar los test por lo que vamos a poner el mismo procedemiento que se realizó en ese momento.

Primero vamos a la página de travis nos logueamos con nuestra cuenta de github y aceptamos lo que nos pide travis para poder usarlo.

![autorizacion travis](https://github.com/CharlySM/EjerciciosCC2021/blob/main/tema2/img/travis1.PNG)

Después vemos como podemos acceder a travis con nuestra cuenta de github, en mi caso ya tenia acceso ya que en la asignatura de IV del grado de informática se uso travis con esta misma cuenta, en la imagen siguiente se puede ver un ejemplo de test pasado con travis para el proyecto de la asignatura IV, del grado de informática de la UGR.

![acceso travis](https://github.com/CharlySM/EjerciciosCC2021/blob/main/tema2/img/travis2.PNG)

Además vemos añadido el repositorio usado en convocatorias anteriores de la asignatura.

Para añadir el repositorio actual a travis para que lance directamente los test con un fichero de configuración de travis hacemos lo siguiente. Primero una vez entramos en nuestra cuenta pulsamos el icono de la cruz para añadir un repo nuevo como mostramos en la siguiente imagen.

![added repo](https://github.com/CharlySM/ProyectoCC/blob/master/doc/img/addedRepo.png)

Después pulsamos el botón Manage repositories Github.

![added repo](https://github.com/CharlySM/ProyectoCC/blob/master/doc/img/manageRepository.png)

Nos llevará a una pagina de github con nuestra cuenta, donde primero seleccionamos la opcion only select repositories, buscmaos nuestro repositorio que queremos aladir, después le damos a approve and install. Esto añadirá nuestro repositorio a travis para poder ejecutar los test.

![added repo](https://github.com/CharlySM/ProyectoCC/blob/master/doc/img/newRepo.png)

Comprobamos que nuestro [fichero de gestor](https://github.com/CharlySM/ProyectoCC/blob/master/Rakefile) de tareas tiene una tarea para poder ejecutar los tests.

![gestor tareas](https://github.com/CharlySM/ProyectoCC/blob/master/doc/img/gestorTareas.png)

Para la ejecución se lanza el comando ```rake test``` que ejecuta la tarea **test** en el [fichero Rakefile](https://github.com/CharlySM/ProyectoCC/blob/master/Rakefile).

Ahora vemos una configuración desde el repo en travis.

Vamos a mostrar en una imagen la ejecución de los test del repositorio.

![test1](https://github.com/CharlySM/ProyectoCC/blob/master/doc/img/test1.png)

![test2](https://github.com/CharlySM/ProyectoCC/blob/master/doc/img/test2.png)

También se puede añadir el badge en el README del proyecto para de un simple vistazo saber si ha fallado o ha pasado con exito los test realizados a través de travis. Y en caso de fallo poder pinchar y te lleva a travis para ver el log.

Para obtener el enlace del badge solo debemos pulsar en el badge build/passing que aparece en el estado del proyecto en travis y seleccionamos el formato que queramos, en nuestro caso Markdown.

![badge](https://github.com/CharlySM/ProyectoCC/blob/master/doc/img/badge.png)

Resultado succed badge.
