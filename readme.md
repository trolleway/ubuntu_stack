


## Run in NextGIS infrastructure

```
docker build -t harbor.nextgis.net/trolleway_ubuntu:0.1.0 .
```
or
```
docker build -t harbor.nextgis.net/trolleway_ubuntu:0.1.0 https://github.com/trolleway/ubuntu_stack.git
```

```
docker push harbor.nextgis.net/trolleway_ubuntu:0.1.0
docker run -it --rm --cpus 10 -v ${PWD}:/data harbor.nextgis.net/trolleway_ubuntu:0.1.0  /bin/bash
```



