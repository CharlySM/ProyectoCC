---
layout: default
title: Elección de gestor de tareas
---

A la hora de decidir el gestor de tareas para mi proyecto, lo primero que he hecho ha sido investigar las distintas herramientas que existian ya que yo conocía la herramienta [rake](https://github.com/ruby/rake) que he usado en la asignatura de IV del grado de informática. También existen las herramientas [Thor](https://github.com/rails/thor) y la herramienta [Toys](https://github.com/dazuma/toys).

En primer lugar descarte usar Thor, ya que según entendí se usa más para proyectos de ruby on rails y además me pareció bastante difícil aprender a usarlo. En segundo lugar descarte Toys, ya que aunque si parece mejor para hacer test e integración y además puede incluir también rake, esta pensado para proyectos más complejos. Además que como se mencionó antes ya se conocía la herramienta rake y si se tuviera que usar uno u otro se elgiría la herramienta rake.

Rake es una herramienta como Make que puede ejecutar código ruby. Esto permitirá hacer los test de ruby más fáciles, además que en este proyecto se usa también como lenguaje R para desarrollar una api, la cual también tendrá sus test las funciones desarrolladas aquí. Con rake podemos ejecutar comandos shell que nos permitirán ejecutar los test del lenguaje R, mediante un comando que nos permitá ejecutar codigo R desde terminal.
