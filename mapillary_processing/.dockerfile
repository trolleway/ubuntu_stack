

ARG DEBIAN_FRONTEND=noninteractive
ARG APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=DontWarn

#у меня в деревне такой инет, что сразу все зависимости не выкачиваются, и этот уровень завершается.
#попробую ставить зависимости по частям, чтоб меньше качать

RUN apt-get update && apt-get install --no-install-recommends -y git 

RUN apt-get install wget tree

# isntall mapillary_tools

RUN apt-get install python2
RUN pip install git+https://github.com/mapillary/Piexif
RUN pip install --upgrade git+https://github.com/mapillary/mapillary_tools

ARG uid=1000
ARG gid=1000
RUN groupadd -g $gid trolleway && useradd --home /home/trolleway -u $uid -g $gid trolleway  \
  && mkdir -p /home/trolleway && chown -R trolleway:trolleway /home/trolleway
RUN echo 'trolleway:user' | chpasswd


#add to sudoers
RUN apt-get install -y apt-utils
RUN apt-get install -y sudo
RUN adduser trolleway sudo
RUN usermod -aG sudo trolleway


#-p "$(openssl passwd -1 trolleway)"