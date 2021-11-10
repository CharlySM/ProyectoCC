FROM rstudio/plumber
LABEL maintainer = "Carlos <csm89@correo.ugr.es>" \
    org.opencontainers.image.source="https://github.com/CharlySM/ProyectoCC"

RUN mkdir -p /app/src/R; apt-get install -y libssl-dev libsasl2-dev; R -e "install.packages('tidyverse')"; R -e "install.packages('jsonlite')"; R -e "install.packages('mongolite')"

WORKDIR /app

COPY ./src/R/plumber.R ./src/R
COPY ./execute.R ./


CMD Rscript execute.R
