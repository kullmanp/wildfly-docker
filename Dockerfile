FROM jboss/wildfly

ADD customization /opt/jboss/wildfly/customization/
RUN \
  curl -o /tmp/mysql-connector-java-8.0.19.jar https://repo1.maven.org/maven2/mysql/mysql-connector-java/8.0.19/mysql-connector-java-8.0.19.jar && \
  /opt/jboss/wildfly/customization/execute.sh && \
  rm /tmp/mysql-*

CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0"]
