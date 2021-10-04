# Spain Football Statistic
Repositorio para la asignatura de Cloud Computing del curso 2020-2021 del máster de ingeniería informatica de la UGR.

Enlace para documentación de configuración de directorio:[Documentación] (https://github.com/CharlySM/ProyectoCC/doc "configuración de repositorio")

## Descripción
En este curso de cloud computing se va a realizar una aplicación donde se puedan ver estadísticas sobre un equipo de fútbol de la liga española de primera división. Además de poder hacer una predicción sobre el enfrentamiento entre dos clubes elegidos según la forma mostrada por los clubes en los últimos partidos.

Los datos usados van desde la temporada **1995-1996** hasta la temporada **2020-2021**.

Este proyecto se hace por interés personal, con el objetivo de mejorar en el uso de técnicas de tratamiento de datos y de machine learning.

Los datos usados para este aplicación se extraen de un dataset de kaggle llamado [La Liga Complete Dataset] (https://www.kaggle.com/kishan305/la-liga-results-19952020)


## Arquitectura.

La arquitectura que se va a usar para el proyecto es la arquitectura de microservicios. Donde habrá tres microservicios:

1. Un microservicio entrenará un modelo para hacer las predicciones.
2. El segundo microservicio se encargará de enviar las respuestas de las peticiones con los datos o predicciones que se soliciten.
3. El tercer microservicio será un servicio desde donde se podrá mandar peticiones para la información que se quiere disponer y de mostrar los datos devueltos por el segundo microservicio.

## Milestone e issues.

* [Milestone 0] (https://github.com/CharlySM/ProyectoCC/milestone/1)
    * [Issue 1] (https://github.com/CharlySM/ProyectoCC/issues/1)
    * [Issue 2] (https://github.com/CharlySM/ProyectoCC/issues/2)
    * [Issue 3] (https://github.com/CharlySM/ProyectoCC/issues/3)
    * [Issue 4] (https://github.com/CharlySM/ProyectoCC/issues/4)
    * [Issue 5] (https://github.com/CharlySM/ProyectoCC/issues/5)
    * [Issue 6] (https://github.com/CharlySM/ProyectoCC/issues/6)
