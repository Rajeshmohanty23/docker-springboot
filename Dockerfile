#FROM openjdk:8
#FROM maven:3.5.2-jdk-8-alpine AS MAVEN_TOOL_CHAIN
#COPY pom.xml /tmp/
#COPY src /tmp/src/
#WORKDIR /tmp/
#RUN mvn package
#ADD target/docker-sb.jar docker-sb.jar
#EXPOSE 8085
#ENTRYPOINT ["java","-jar","docker-sb.jar"]

FROM adoptopenjdk:11-jre-hotspot as builder
FROM maven:3.5.2-jdk-8-alpine AS MAVEN_TOOL_CHAIN
WORKDIR application
ARG JAR_FILE=target/*.jar
RUN mvn package
RUN java -Djarmode=layertools -jar application.jar extract
COPY $JAR_FILE application.jar
FROM adoptopenjdk:11-jre-hotspot
WORKDIR application
COPY --from=builder application/dependencies/ ./
COPY --from=builder application/snapshot-dependencies/ ./
COPY --from=builder application/resources/ ./
COPY --from=builder application/application/ ./
ENTRYPOINT ["java", "org.springframework.boot.loader.JarLauncher"]


