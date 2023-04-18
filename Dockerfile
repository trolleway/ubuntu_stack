FROM ubuntu:22.04
ARG DEBIAN_FRONTEND=noninteractive
ARG APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=DontWarn


RUN apt-get update -y && apt-get upgrade -y



RUN 	apt-get -y install  --yes language-pack-ru software-properties-common \
	apt-transport-https ca-certificates curl gnupg 
#RUN	apt-add-repository ppa:nextgis/ppa && \
#	apt-get update -y && \
#	apt-get -y install --no-install-recommends --yes python3 python3-pip python3-psycopg2 gdal-bin python3-gdal python3-setuptools && \
#	update-locale LANG=ru_RU.UTF-8 && \
#	pip3 install --upgrade pip

RUN apt-get -y install --no-install-recommends --yes language-pack-ru apt-transport-https ca-certificates curl python3 python3-pip python3-psycopg2 
RUN pip3 install --upgrade pip
	


ENV LANG ru_RU.UTF-8
ENV LANGUAGE ru_RU:ru
ENV LC_ALL ru_RU.UTF-8


RUN apt-get update && apt-get install --no-install-recommends -y mc git nano wget tree
ARG uid=1000
ARG gid=1000
RUN groupadd -g $gid trolleway && useradd --home /home/trolleway -u $uid -g $gid trolleway  \
  && mkdir -p /home/trolleway && chown -R trolleway:trolleway /home/trolleway
RUN echo 'trolleway:user' | chpasswd


RUN apt-get install --no-install-recommends -y time curl mc ffmpeg

#add to sudoers
RUN apt-get install -y apt-utils
RUN apt-get install -y sudo
RUN adduser trolleway sudo
RUN usermod -aG sudo trolleway

WORKDIR /data
#-p "$(openssl passwd -1 trolleway)"
