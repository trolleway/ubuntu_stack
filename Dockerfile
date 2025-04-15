FROM ubuntu:22.04
ARG DEBIAN_FRONTEND=noninteractive
ARG APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=DontWarn

RUN apt-get update -y && apt-get upgrade -y

ENV LANG ru_RU.UTF-8
ENV LANGUAGE ru_RU:ru
ENV LC_ALL ru_RU.UTF-8


# INSTALL PYTHON

RUN apt-get -y install --no-install-recommends --yes python3 python3-psycopg2 python3-setuptools python3-pip 


# INSTALL NEXTGIS GDAL

RUN apt-get -y update && \
  apt-get -y install --no-install-recommends --yes language-pack-ru \
  apt-transport-https ca-certificates curl gnupg && \
  echo "deb https://rm.nextgis.com/api/repo/11/deb jammy main" | tee -a /etc/apt/sources.list && \
  curl -s -L https://rm.nextgis.com/api/repo/11/deb/key.gpg | apt-key add - && \
  apt-get update -y
RUN apt-get install -y  gdal-bin 

# INSTALL PAYLOAD


RUN apt-get install --no-install-recommends -y time curl #ffmpeg mc htop

WORKDIR /data
