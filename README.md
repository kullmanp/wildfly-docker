# How to customize wildfly with a mysql datasource

This is based on 
<https://goldmann.pl/blog/2014/07/23/customizing-the-configuration-of-the-wildfly-docker-image/>.

## Runnable example

Start mysql
```
docker run --name my-mysql -e MYSQL_ROOT_PASSWORD=secret -d -p 3306:3306 mysql:8.0.19
```

Build and start this container
```
mvn clean install && docker build . -t wildfly-docker   
docker run -it --rm -p 8080:8080 --name wildfly-docker -e DB_USER=root -e DB_PASSWORD=secret wildfly-docker
```

Test by visiting <http://localhost:8080/test/resources/contacts>
