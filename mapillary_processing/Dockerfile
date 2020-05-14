FROM ubuntu:18.04

ARG DEBIAN_FRONTEND=noninteractive
ARG APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=DontWarn

#у меня в деревне такой инет, что сразу все зависимости не выкачиваются, и этот уровень завершается.
#попробую ставить зависимости по частям, чтоб меньше качать

RUN apt-get update && apt-get install --no-install-recommends -y git 

RUN apt-get install --yes wget tree

# isntall mapillary_tools

RUN apt-get install --yes python2 #python-pip
#RUN pip install --yes git+https://github.com/mapillary/Piexif
#RUN pip install --yes --upgrade git+https://github.com/mapillary/mapillary_tools

CMD ["/bin/bash"]
