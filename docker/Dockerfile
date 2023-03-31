FROM openjdk:17-alpine

ARG JAR_FILE=target/*.jar
ARG AGENT_FILE=java-pipeline-templates/resources/otel/opentelemetry-javaagent.jar

COPY ${JAR_FILE} application.jar

COPY ${AGENT_FILE} opentelemetry-javaagent.jar

RUN chmod 777 opentelemetry-javaagent.jar

EXPOSE 8080

ENV JAVA_TOOL_OPTIONS="-javaagent:opentelemetry-javaagent.jar"

ENTRYPOINT ["java","-jar","/application.jar", "$JAVA_TOOL_OPTIONS"]