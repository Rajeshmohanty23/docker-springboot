FROM openjdk:8-jdk-alpine

EXPOSE 8002

WORKDIR /app

ADD target/*.jar /app/

ENTRYPOINT ["java", "-jar", "docker-sb.jar"]