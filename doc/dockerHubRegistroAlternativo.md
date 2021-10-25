En este fichero lo que hemos hecho es definir la automatización de la actualización de la imagen en dockerhub y github registry container.

Para usar dockerhub lo primero que tenemos que hacer es darnos de alta en dockerhub, en mi caso ya tenía cuenta de la asignatura de infraestructura virtual del grado de ingeniería informática de la Universidad de Granada. Como no podía linkar mi cuenta de github a mi cuenta de docker para la automatización de la actualización de la imagen se ha usado un github actions, donde al hacer push a nuestro repositorio se actualizará directamente en dockerhub. Además aprovechando la creación del actions para actualizar la imagen en dockerhub se va a utilizar este action creado en github para crear la imagen en github registry container y que esta se actualice también automáticamente.

Primero vamos a ver como se ha creado el action para actualizar docker y github registry container. En primer lugar hemos creado dos secret para poder conectar con dockerhub y un token para poder acceder a github registry container. Para ello nos dirigimos a nuestro repositorio, una vez en el repositorio nos dirigimos al apartado de settings del repo. Aqui nos dirigimos al apartado secret, después le damos a *New repository secret*.

![secret Apartado](https://github.com/CharlySM/ProyectoCC/blob/master/doc/img/secretIndex.png)

Una vez aquí ponemos el nombre de nuestro secret y añadimos el valor del secret. Este valor no se podrá ver en ningún momento.

![new secret](https://github.com/CharlySM/ProyectoCC/blob/master/doc/img/CreatingSecret.png)

Los secret que creamos es uno con el nombre de usuario de dockerhub y otro con el password para acceder a dockerhub.

Para crear el token de acceso personal nos vamos a la foto de nuestro perfil arriba a la izquierda, despues seleccionamos la opción settings, luego nos vamos a develop settings y por último nos dirigimos al apartado personal acces token. Seleccionamos generate new token.

![new token](https://github.com/CharlySM/ProyectoCC/blob/master/doc/img/tokenGithub.png)

Después nos vamos a una terminal al directorio de nuestro repo en nuestra máquina o sistema donde lo tengamos en local. Creamos una carpeta llamada **.github/workflows** con el comando ```mkdir -p .github/workflows```. En esta carpeta se guardarán todos los actions que creemos para nuestro repositorio.

En nuestro caso vamos a crear un action donde actualizará la imagen en dockerhub y en github repository container. Para ello dentro de la carpeta workflows creamos un fichero con el nombre que queramos con formato .yml. Ahora vamos a añadir el contenido del fichero para que se actualice nuestras imágenes cuando hagamos un push a nuestro repositorio.

Primero añadimos las siguientes lineas a nuestro fichero.

```
name: Publish Docker image

on: push
```

Con estas lineas le damos un nombre a nuestro action y le indicamos que se ejecute al hacer un push. Ahora añadiremos los jobs que tiene que realizar el actions.

El primer trabajo viene dado por la sigientes lineas. Antes le indicamos como ejecutamos las órdenes que necesitamos ejecutar.

```
runs-on: ubuntu-latest
```

Aquí le decimos que use un ubuntu última versión para ejecutar nuestras órdenes.

```
permissions:
  packages: write
  contents: read
```

Aquí le damos los permisos a nuestro action. Ahora añadiremos los pasos del action.

```
steps:
  - name: Check out the repo
    uses: actions/checkout@v2
```
 En este primer paso lo que hacemos es usar un proceso ya predefinido en github que se encarga de checkear nuestro repositorio para ver el contenido, en nuestro caso tiene que buscar el fichero dockerfile.

 ```
 - name: Log in to Docker Hub
   uses: docker/login-action@f054a8b539a109f9f41c372932f1ae047eff08c9
   with:
     username: ${{ secrets.DOCKER_USERNAME }}
     password: ${{ secrets.DOCKER_PASSWORD }}
 ```

 Con este paso lo que hacemos es loguearnos en dockerhub con los secretos creados anteriormente. Este proceso tambiés esta definido ya en github.

 ```
 - name: Log in to the Container registry
   uses: docker/login-action@f054a8b539a109f9f41c372932f1ae047eff08c9
   with:
     registry: ghcr.io
     username: ${{ github.actor }}
     password: ${{ secrets.GITHUB_TOKEN }}
 ```

 En este paso lo que se hace es loguearnos en github repository container para poder guardar nuestra imagen, para esto también hay un proceso definido en github para hacer esto de manera automática. Para hacer esto se usa nuestro usuario de github que esta en la variable **github.actor** y el token personal que creamos anteriormente, para acceder al token usamos la variable de entorno que tiene por defecto github **secret.GITHU_TOKEN**.

 ```
 - name: Extract metadata (tags, labels) for Docker
   id: meta
   uses: docker/metadata-action@98669ae865ea3cffbcbaa878cf57c20bbf1c6c38
   with:
     images: |
       ${{ secrets.DOCKER_USERNAME }}/proyectocc
       ghcr.io/${{ github.repository }}
 ```

Con este paso lo que hacemos es recoger metadatos para generar los tags y labels en dockerhub y github registry container. Para esto tambien hay definido una tarea en github para ejecutar esto.

```
- name: Build and push Docker images
  uses: docker/build-push-action@ad44023a93711e3deb337508980b4b5e9bcdc5dc
  with:
    context: .
    push: true
    tags: ${{ steps.meta.outputs.tags }}
    labels: ${{ steps.meta.outputs.labels }}
```

En este último paso hacemos push de la imagen nuestra en dockerhub y github registry container. Para esto también hay una tarea definida en github.

Esto nos va a permitir tener nuestra imagen actualizada cuando hagamos un push en nuestro repositorio de github. Este push debe ser hecho sobre la rama master.

El código o template para poder hacer esto en un action viene dado en este [enlace](https://docs.github.com/es/actions/publishing-packages/publishing-docker-images#publishing-images-to-github-packages)

Se ha usado como registro de imagen alternativo github registry container, ya que para este tipo de registro hay una inmensa documentación y esto hace más fácil el aprender a usarlo. Además que también se puede usar para las cuentas estándar de github que no requieren pagos.

Para este proceso de automátización también se puede hacer ejecutando las órdenes como lo hariamos en nuestro sistema local poniendo la key **run** seguida del comando que se quiera usar, en vez de usar las tareas que están predefinidas en github.

Referencias.
- [Creación tokens](https://docs.github.com/es/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token)
- [Creación actions](https://docs.github.com/es/actions/publishing-packages/publishing-docker-images)
- [Creación action con github registry](https://docs.github.com/es/actions/publishing-packages/publishing-docker-images#publishing-images-to-github-packages)
- [Creación secret](https://docs.github.com/es/actions/security-guides/encrypted-secrets)
- [registro contenedore](https://docs.github.com/es/packages/working-with-a-github-packages-registry/working-with-the-container-registry)
