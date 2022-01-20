FROM rocker/r-ver:3.6.3
LABEL maintainer="frs"
RUN export DEBIAN_FRONTEND=noninteractive; apt-get -y update \
  && apt-get install -y git-core
RUN ["install2.r", "remotes"]
RUN ["installGithub.r", "brianstock/MixSIARgui@HEAD"]
WORKDIR /payload/
CMD ["R"]
