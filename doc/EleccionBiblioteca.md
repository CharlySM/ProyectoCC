---
layout: default
title: Elección de biblioteca
---

Para la elección de la biblioteca para realizar los test primero he investigado las posibilidades que tenemos para el lenguaje ruby. Las bibliotecas mas usadas tienen relación también con el marco de pruebas que se va a usar. Las opciones que tenemos son Rspec y la clase Test::unit:test_Case de ruby. Estos dos framework son los mas usados.

Para elegir nuestra libreria tenemos que hablar de estos dos frameworks ya que usan librerías distintas para testear. En primer lugar voy a hablar de del framework Test:unit::test_Case, que usa la librería de assert y se hacen los tests dentro de una clase. Este framework es aconsejable para aquellos programadores mas familiarizados con los lenguajes tradicionales como c++ o java. Además en el proyecto de la asignatura de IV del grado de informática de la universidad de granada se usó este framework por lo que se dispone de cierta familiaridad con este framework y su librería de assert.

En segundo lugar vamos a hablar del framework Rspec, este framework usa la felxibilidad del lenguaje de ruby y además esta más orientado a la filosofía Behavior Driven Development, donde se describe el comportamiento de los componentes de la app. La librería que usa es describe "descripcion del test" do it "describe funcionalidad" do test end.

Para este proyecto he elegido el framework Test::unit::test_Case ya que para este framework ya tengo experiencia en realización de test en ruby y en la bibliotecas que usa de assert, que es la finalidad de este documento el explicar que librería se va a usar.

Para el lenguaje R se va a usar la libería de R testthat que contiene la biblioteca de assert para realizar los test. Esto ha sido elegido así para unificar los test y usar la misma biblioteca en ambos lenguajes.
