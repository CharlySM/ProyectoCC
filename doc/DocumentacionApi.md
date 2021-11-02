Para este proyecto se van a usar dos apis, la primera api esta desarrollada en lengueje ruby con la gema sinatra. Esto se ha hecho por que se tenia experiencia usando esta gema para hacer apis tanto en la asignatura de infraestructura virtual del grado de ingeniería informática de la Universidad de Granada como para proyectos personales. La segunda api se ha hecho en leguaje R, esto se ha elegido por que con esta api se pretende hacer un tratamiento de datos y devolverlos a la api desarrollada en ruby.

Las apis se desarrollarán como microservicios independientes una de la otra, de forma que sean independientes una de la otra. El microservicio de la api desarrollada en ruby es una api con la que un usuario que usa nuestra api interactuará con ella. Para la api desarrollada en R, lo que hace es mandar datos tratados a la api desarrollada en ruby. El usuario no verá, ni conocerá de la existencia de la api desarrollada en R. Para la api desarrollada en R que se encarga de tratar datos y mandarlos cunado reciba una petición de la api de ruby, se podía haber elegido una api desarrollada en python, esto no se ha elegido ya que tengo más experiencia en tratamiento de datos con R, como hacer un modelo de redes neuronales para lanzar la petición de predicción del resultado de un partido que se quiere desarrollar.

Para la api desarrollada en Ruby se han creado una serie de rutas, acordando a la necesidad del usuario de pedir la infomración para un equipo, para comparar dos equipos o para hacer una predicción del resultado de un partido entre dos equipos. Además también se han creado rutas para poder registrarse en la aplicación y poder hacer loggin en la aplicación. Las rutas que se han creado son:

* La ruta **raíz** representada por el símbolo ```/```: Donde se redirige a la página principal de la api. Esta ruta es una petición de tipo get
* La ruta **registro**: Te redirige a un formulario de registro en la aplicación. Es una petición de tipo get.
* La ruta **registrado**: En esta ruta se manda una petición a una base de datos mongodb para guardar los datos de registro. Es una petición de tipos post.
* Si la ruta anterior no ha podido guardar con exito los datos, te redirige a una nueva ruta que manda una excepción al usuario para conocer el error esta ruta se llama **registroErroneo**. Es una petición de tipo get.
* La ruta **login**: Esta ruta te rediríge a un formulario para loguear al usuario en la aplicación. Es una petición de tipo get.
* La ruta **logueando**: Es una ruta donde se hace una petición a una base de datos mongodb para comprobar el usuario que hace login. Si el usuario es correcto y existe le rediríge a la ruta **Principal**. Si el usuario no existe o tiene algún dato erróneo se rediríge a la ruta **loginErroneo**. Es una petición de tipo post.
* La ruta **loginErroneo**: Esta ruta muestra una excepción al usaurio de su acción de login errónea. Es una petición de tipo get.
* La ruta **Principal**: Esta ruta te rediríge a la página principal del usuario logueado. Esta petición es de tipo get.
* La ruta **equipoStatistics**: Esta ruta manda una petición a la api de R para recibir los datos de las estadísticas solicitadas del equipo solicitado. Además hace una petición a una base de datos mongodb para guardar los datos de esta petición y el usuario que la mando. Esta petición es de tipo post.
* La ruta **manyStatistics**: Esta ruta manda una petición a la api de R para recibir las estadísticas de los equipos solicitados y las estadísticas solicitadas. Además hace una petición a una base de datos mongodb para guardar los datos de esta petición y el usuario que la mando. Esta petición es de tipo post.

Aunque ahora hay estas rutas se espera poder agregar más a lo largo del desarrollo de la api.

Desglose de las rutas según las historias de usuario:

* [HU 5 - Como usuario que quiere usar el sistema quiero poder registrarme en la aplicación:](https://github.com/CharlySM/ProyectoCC/issues/15)
   * get '/registro': Se utiliza un método get, se muestra un formulario para poder registrar el usuario en la aplicación.
   * post '/registrado': Se utiliza un método post, si el registro se ha hecho correctamente se rediríge a la página de la ruta raíz. Si el registro ha fallado se redirige a la ruta **registroErroneo** y devuelve una excepción con un mensaje al usuario.
   * get '/registroErroneo': Se utiliza un método get, se devuelve una excepción con un mensaje para el usuario.
* [HU 1 - Como usuario que quiere usar el sistema quiero poder hacer logging en la aplicación:](https://github.com/CharlySM/ProyectoCC/issues/11)
   * post '/login': Se utiliza el método post, esto te redirige a una página que muestra un formulario para hacer login en la aplicación.
   * post '/logueando': Se utiliza un metodo post, si el login se ha hecho correctamente se rediríge al usuario a la página principal de login, si el login ha fallado se rediríge a la ruta **loginErroneo** y se lanza una excepción mostrando un mensaje al usuario.
   * get '/loginErroneo': Se utiliza el método get, se lanza una excepción mostrando un mensaje al usuario.
   * get '/Principal': Se utiliza el método get, se redirige a la página principal del usuario.
* [HU 2 - Consulta estadísticas para un equipo:](https://github.com/CharlySM/ProyectoCC/issues/12)
   * post '/equipoStatistics': Se utiliza un método post, manda una petición a la api de R para recibir datos, si los datos no los encuentra se manda una excepción al usuario, si los datos se reciben correctamente se rediríge a la ruta **Principal** y muestra la información al usuario.
* [HU 3 - Consulta de comparación de estadísticas para dos equipos:](https://github.com/CharlySM/ProyectoCC/issues/13)
   * post '/manyStatistics': Se utiliza un método post, manda una petición a la api de R para recibir datos, si los datos no los encuentra se manda una excepción al usuario, si los datos se reciben correctamente se rediríge a la ruta **Principal** y muestra la información al usuario.
