FROM ruby:3.0.2-alpine3.14

# Definimos etiquetas informativas al contenedor
LABEL maintainer = "Carlos <csm89@correo.ugr.es>" \
    org.opencontainers.image.source="https://github.com/CharlySM/ProyectoCC"

RUN apk --update add --no-cache --virtual run-dependencies \
      bash \
      build-base

#Añadimos directorio de trabajo si no existe se crea
WORKDIR /app/test

#Copiamos fichero de gemas a usar
COPY ./Gemfile .

#Instalamos las gemas que usamos y borramos fichero de gemas
RUN bundle install \
  && rm Gemfile

#Añadimos comando de ejecucion de test
CMD ["rake", "test"]
