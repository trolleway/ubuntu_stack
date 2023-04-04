
name=trolleway_ubuntu

```
docker build -t registry.nextgis.com/trolleway_ubuntu:0.1.0 .
```
or
```
docker build -t registry.nextgis.com/trolleway_ubuntu:0.1.0 https://github.com/trolleway/ubuntu_stack.git
```

```
docker push registry.nextgis.com/trolleway_ubuntu:0.1.0
docker run -it --rm --cpus 10 -v ${PWD}:/data registry.nextgis.com/trolleway_ubuntu:0.1.0  /bin/bash
```



