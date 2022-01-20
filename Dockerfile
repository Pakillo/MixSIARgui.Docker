FROM rocker/r-ver:3.6.3
LABEL maintainer="frs"
RUN export DEBIAN_FRONTEND=noninteractive; apt-get -y update \
  && apt-get install -y jags libgtk2.0-dev
RUN ["install2.r", "versions"]
RUN ["install2.r", "gWidgets", "gWidgetsRGtk2", "MixSIAR"]
RUN ["Rscript", ]
WORKDIR /payload/
CMD ["R"]
