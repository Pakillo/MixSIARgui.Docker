FROM rocker/r-ver:3.6.3
LABEL maintainer="frs"
RUN export DEBIAN_FRONTEND=noninteractive; apt-get -y update \
  && apt-get install -y jags libgtk2.0-dev
RUN ["install2.r", "versions"]
RUN ["Rscript", "-e", "versions::install.versions('MixSIAR', '3.1.11')"]
RUN ["Rscript", "-e", "versions::install.versions('gWidgets', '0.0-54')"]
RUN ["Rscript", "-e", "versions::install.versions('gWidgetsRGtk2', '0.0-86')"]
RUN ["install2.r", "remotes"]
RUN ["installGithub.r", "brianstock/MixSIARgui@HEAD"]
WORKDIR /payload/
CMD ["R"]
