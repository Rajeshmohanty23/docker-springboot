FROM maven:3.5.2-jdk-8-alpine AS MAVEN_TOOL_CHAIN
COPY pom.xml pom.xml
COPY src src
WORKDIR /
RUN mvn package
FROM gcr.io/distroless/java:11
COPY --from=MAVEN_TOOL_CHAIN /target /app
WORKDIR /app
EXPOSE 8085
ENTRYPOINT ["nohup","java","-jar","docker-sb.jar","&"]

#FROM adoptopenjdk:11-jre-hotspot as builder
#FROM maven:3.5.2-jdk-8-alpine AS MAVEN_TOOL_CHAIN
#WORKDIR application
#ARG JAR_FILE=target/*.jar
#RUN mvn package
#RUN java -Djarmode=layertools -jar application.jar extract
#COPY $JAR_FILE application.jar
#FROM adoptopenjdk:11-jre-hotspot
#WORKDIR application
#COPY --from=builder application/dependencies/ ./
#COPY --from=builder application/snapshot-dependencies/ ./
#COPY --from=builder application/resources/ ./
#COPY --from=builder application/application/ ./
#ENTRYPOINT ["java", "org.springframework.boot.loader.JarLauncher"]


