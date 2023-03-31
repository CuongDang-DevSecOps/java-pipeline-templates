FROM openjdk:17-alpine

# ARG JAR_FILE=target/*.jar
# ARG AGENT_FILE=java-pipeline-templates/resources/otel/opentelemetry-javaagent.jar

COPY target/*.jar /usr/app/application.jar

# COPY ${AGENT_FILE} /usr/app/opentelemetry-javaagent.jar

RUN chmod +x /usr/app/

EXPOSE 8080

# ENV JAVA_TOOL_OPTIONS="-javaagent:/usr/app/opentelemetry-javaagent.jar"

# ENTRYPOINT ["java","-jar","/usr/app/application.jar", "$JAVA_TOOL_OPTIONS"]
ENTRYPOINT ["java", "-jar", "/usr/app/application.jar"]