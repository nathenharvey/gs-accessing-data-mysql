# Habitat package: gs-accessing-data-mysql

## Description

This is a Habitat package used to demonstrate packaging a Spring Boot project
and using Habitat's native service discovery to connect that application to a
MySQL database.

The application is the
[Accessing data with MySQL](https://spring.io/guides/gs/accessing-data-mysql/)
tutorial taken from the Spring Guides.

## Usage

Launch a mysql service.

* `sudo hab sup run`
* `sudo hab sup load core/mysql`

Add appropriate database and user to the launched mysql

* `$(hab pkg path core/mysql)/bin/mysql -h127.0.0.1 -uroot`
* `create database db_example;`
* `create user 'springuser'@'%' identified by 'ThePassword';`
* `grant all on db_example.* to 'springuser'@'%';`
* `flush privileges;`

Update MySQL to listen on the default IP:

echo "bind = \"$(hostname -i)\"" | sudo hab config apply mysql.default 1

Launch gs-accessing-data-mysql

* `sudo hab sup load nathenharvey/gs-accessing-data-mysql --bind database:mysql.default`

Launch a second instance of the java app

* `sudo hab sup run --peer 172.31.21.2` # replace 172.31.21.2 with the appropriate IP address
* `sudo hab sup load nathenharvey/gs-accessing-data-mysql --bind database:mysql.default`


Load some data into the database

Do this from either of the two java hosts

* `curl localhost:8080/demo/add\?name\=First\&email\=someemail@someemailprovider.com`
* `curl localhost:8080/demo/add\?name\=Habicat\&email\=cat@habitat.sh`

See the data

Do this from either of the two java hosts

* `curl localhost:8080/demo/all | jq`

