# Realización de tests.

Para la realización de test hemos usado rack-test y minitest. La gema minitest la hemos usado para el desarrollo del resto de test. La gema  rack-test la vamos a usar para probar las rutas de nuestra api, como nuestra api tiene rutas que hacen una conexión a una base de datos vamos a hacer mocking de estas rutas.

Las rutas a las que se ha hecho mocking han sido.
* Ruta registrado.
* Ruta login.
* Ruta logueando.
* Ruta equipoStatistics.
* Ruta manyStatistics.

He creado un fichero llamado [**Variables_test**](https://github.com/CharlySM/ProyectoCC/blob/hito-5/test/Variables_test.rb) para guardar en variables la devolución esperada por enviar una petición a nuestra api, en este caso guardaremos la salida esperada del body.

fichero [Variables_test.rb](https://github.com/CharlySM/ProyectoCC/blob/hito-5/test/Variables_test.rb)

Se han realizado test para las peticiones creadas hasta el momento para la api.

* Ruta [raíz](https://github.com/CharlySM/ProyectoCC/blob/hito-5/test/Routes_test.rb#:~:text=def%20test_default,end).
* Ruta [registro](https://github.com/CharlySM/ProyectoCC/blob/hito-5/test/Routes_test.rb#:~:text=def%20test_registro,end).
* Ruta [registrado](https://github.com/CharlySM/ProyectoCC/blob/hito-5/test/Routes_test.rb#:~:text=end-,def%20test_registradoCorrecto,end,-def%20test_registroErroneo).
* Ruta [registroErroneo](https://github.com/CharlySM/ProyectoCC/blob/hito-5/test/Routes_test.rb#:~:text=def%20test_registroErroneo,end).
* Ruta [login](https://github.com/CharlySM/ProyectoCC/blob/hito-5/test/Routes_test.rb#:~:text=end-,def%20test_login,end,-def%20test_loginCorrecto).
* Ruta [logueando](https://github.com/CharlySM/ProyectoCC/blob/hito-5/test/Routes_test.rb#:~:text=end-,def%20test_loginCorrecto,end,-def%20test_loginErroneo).
* Ruta [loginErroneo](https://github.com/CharlySM/ProyectoCC/blob/hito-5/test/Routes_test.rb#:~:text=def%20test_loginErroneo,end).
* Ruta [Principal](https://github.com/CharlySM/ProyectoCC/blob/hito-5/test/Routes_test.rb#:~:text=def%20test_principal,end).
* Ruta [equipoStatistics](https://github.com/CharlySM/ProyectoCC/blob/hito-5/test/Routes_test.rb#:~:text=end-,def%20test_equipoStatistics,end,-def%20test_manyStatistics).
* Ruta [manyStatistics](https://github.com/CharlySM/ProyectoCC/blob/hito-5/test/Routes_test.rb#:~:text=def%20test_manyStatistics).

Los test de las rutas lo podemos encontrar en el fichero [Routes_test](https://github.com/CharlySM/ProyectoCC/blob/hito-5/test/Routes_test.rb).

Los test de las rutas se ejecutan con la tarea creada en el fichero gestor de tareas [Rakefile](https://github.com/CharlySM/ProyectoCC/blob/master/Rakefile), para ejecutar los test con el comando ```rake test```
