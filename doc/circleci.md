Para el sistema de integración continua alternativo se ha elegido circleci, se ha elegido este por su parecido a travis y por la facilidad de uso y aprendizaje a la hora de usarlo. Además hay mucha documentación para usar circleci.

Para este sistema de integración se va a usar también con nuestro contenedor de dockerhub creado desde nuestro dockerfile en el hito anterior.

Primero nos logueammos en nuestra cuenta de circleci con nuestra cuenta de github. Aceptamos la autorización para que la aplicación de circleci pueda acceder a nuestros repositorios.

![circleci authorized](https://github.com/CharlySM/ProyectoCC/blob/master/doc/img/authorizedCircleCI.png)

Después subimos nuestro fichero de [configuración de circleci.](https://github.com/CharlySM/ProyectoCC/blob/master/.circleci/config.yml)

Después de añadir el fichero de configuración de circleci añadimos nuestro repo a circleci. Nos vamos al apartado projects y bsucamos nuestro proyecto y le damos a **set up project**. Esto buscará el fichero de configuración de circleci y lo añadirá directamente.

![add project](https://github.com/CharlySM/ProyectoCC/blob/master/doc/img/addProjectCI.png)

Para que funcione la ejecución de test usando nuestro dockerhub tenemos que crear primero dos variables de entorno para nuestro proyecto. Una para nuestra password de dockerhub y otra para nuestro username de nuestro dockerhub. Esta variables se usan en el fichero de configuración de circleci.

![file configuration](https://github.com/CharlySM/ProyectoCC/blob/master/doc/img/fileConfiguration.png)

Una vez hecho esto ya solo nos queda probar nuestra configuración de circleci haciendo un push a nuestro proyecto, podemos añadir también el badge para ver claramente de un vistazo el estado de la ejecución de circleci.

![state 1](https://github.com/CharlySM/ProyectoCC/blob/master/doc/img/state1.png)

![state 2](https://github.com/CharlySM/ProyectoCC/blob/master/doc/img/state2.png)

![badge](https://github.com/CharlySM/ProyectoCC/blob/master/doc/img/badgeCircle.png)

Como vemos nuestra ejecución de test en circleci con nuestra imagen de dockerhub ha sido exitosa.

Circle ci esta usando nuestra imagen de dockehub creado en nuestro dockefile en el hito anterior que también usa nuestro fichero de gestor de tareas para ejecutar los test.
