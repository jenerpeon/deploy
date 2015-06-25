tcos-dev
========

container for developing tcos packages


requirements
============

- docker

installation
============

manual way:

1. clone the git repo to "$some_place"
2. cd "$some_place"

```
docker build -t tcos-dev:latest .
```
-or-

from docker hub:
```
docker pull steffenhoenig/tcos-dev
```

source tcosdev.rc

```
D --user=$USER [optional docker options]
```


D = interactive development profile

little hint, if you'd like to use the Docker session over ssh, don't forget "ssh -A"
