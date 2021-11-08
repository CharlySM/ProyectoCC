# Documentación y justificación de la estructura del clúster.

En un principio con lo que se ha definido, la idea era crear las historias de usuario correspondientes para crear dos servicios, uno para una api en R que trate los datos y los sirve a otra api y otra api desarrollada en ruby para mostrar los datos. Se quería crear la clase usuario para poder loguear en la aplicación y poder registrarse. También crear historias de usuario para desarrollar las distintas peticiones que se van a servir.

Finalmente para hacer algo que tuviese mas sentido se utilizó una base de datos para almacenar los usuarios registrados en la aplicación, además los datos que se querían usar estaban pensado almacenarlos en un csv, pero con el uso de la base datos se van a almacenar finalmente en la base de datos. De esta forma ahora tenemos una base de datos como un microservicio a parte, el cuál va a ser usado por los otros dos microservicios.

De esta forma nos queda un cluster el cuál esta formado por tres microservicios, uno para la api R que trata los datos para servírselos a otra api, otro microservicio para hacer peticiones de los datos y mostrarlos y el último microservicio que es nuestra base de datos.
