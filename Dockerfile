FROM registry.nextgis.com/sshd:0.1.0
#там ubuntu с gdal

ARG DEBIAN_FRONTEND=noninteractive
ARG APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=DontWarn

RUN apt-get update && apt-get install --no-install-recommends -y mc git nano wget tree
ARG uid=1000
ARG gid=1000
RUN groupadd -g $gid trolleway && useradd --home /home/trolleway -u $uid -g $gid trolleway  \
  && mkdir -p /home/trolleway && chown -R trolleway:trolleway /home/trolleway
RUN echo 'trolleway:user' | chpasswd
RUN apt-get install --no-install-recommends -y gdal-bin

#add to sudoers
RUN apt-get install --no-install-recommends -y sudo
RUN adduser trolleway sudo
RUN usermod -aG sudo trolleway


#-p "$(openssl passwd -1 trolleway)"
