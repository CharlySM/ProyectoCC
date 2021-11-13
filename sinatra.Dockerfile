FROM ruby:3.0.2-alpine3.14

# Definimos etiquetas informativas al contenedor
LABEL maintainer = "Carlos <csm89@correo.ugr.es>" \
    org.opencontainers.image.source="https://github.com/CharlySM/ProyectoCC"

RUN apk --update add --no-cache --virtual run-dependencies \
      bash \
      build-base \
      && addgroup -g 1000 sinatra \
      && adduser -u 1000 -G sinatra -s /bin/sh -D charlysm \
      && mkdir -p /app/src \
      && mkdir -p /app/views \
      && mkdir -p /app/public

USER charlysm

#Añadimos directorio de trabajo si no existe se crea
WORKDIR /app/
#Copiamos ficheros a usar
COPY --chown=charlysm:sinatra ["index.rb", "Gemfile", "Rakefile", "Gemfile.lock", "./"]
RUN chmod -R 777 ./Gemfile.lock
RUN chmod -R 777 ./index.rb
RUN chmod -R 777 ./Rakefile
COPY --chown=charlysm:sinatra ["views", "./views"]
COPY --chown=charlysm:sinatra ["src", "./src"]
#COPY --chown=charlysm:sinatra ["public", "./public"]

#Instalamos las gemas que usamos
RUN bundle install

#Añadimos comando de ejecucion de test
CMD ["rake", "exec"]
