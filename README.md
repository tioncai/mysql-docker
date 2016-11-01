# mysql-docker
a docker image base on alpine with mysql

build image
```
docker build -t mysql:alpine .
docker run -it --rm -v $(pwd):/var/lib/mysql -p 3306:3306 mysql:alpine
```
Usage
```
docker run -it --name mysql -p 3306:3306 -v $(pwd):/var/lib/mysql -e MYSQL_ROOT_PASSWORD=ghostcloud mysql:alpine
```
It will create a new db, and set mysql root password(default is ghostcloud)
