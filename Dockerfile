FROM alpine/bundle:latest

# Definimos etiquetas informativas al contenedor
LABEL maintainer = "Carlos <csm89@correo.ugr.es>" \
    org.opencontainers.image.source="https://github.com/CharlySM/ProyectoCC"

WORKDIR /usr/src/app

COPY ./Gemfile .
COPY ./Rakefile .

RUN bundle install

CMD ["rake", "test"]
