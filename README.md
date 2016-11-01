# mysql-docker
a docker image base on alpine with mysql

build image
```
docker build -t alpine/mysql .
docker run -it --rm -v $(pwd):/app -p 3306:3306 alpine/mysql
```
Usage
```
docker run -it --name mysql -p 3306:3306 -v $(pwd):/app -e MYSQL_DATABASE=admin -e MYSQL_USER=web -e MYSQL_PASSWORD=password -e MYSQL_ROOT_PASSWORD=root_passwd alpine/mysql
```
It will create a new db, and set mysql root password(default is root_passwd)
