FROM jboss/wildfly

ADD customization /opt/jboss/wildfly/customization/
RUN \
  curl -o /tmp/mysql-connector-java-8.0.19.jar https://repo1.maven.org/maven2/mysql/mysql-connector-java/8.0.19/mysql-connector-java-8.0.19.jar && \
  \
  /opt/jboss/wildfly/customization/execute.sh && \
  \
  rm -rf $JBOSS_HOME/standalone/configuration/standalone_xml_history/ $JBOSS_HOME/standalone/log/* && \
  rm /tmp/*.jar && \
  \
  sed -i 's/DB_USER/${env.DB_USER}/' $JBOSS_HOME/standalone/configuration/standalone.xml && \
  sed -i 's/DB_PASSWORD/${env.DB_PASSWORD}/' $JBOSS_HOME/standalone/configuration/standalone.xml

ADD target/test.war $JBOSS_HOME/standalone/deployments/

CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0"]
