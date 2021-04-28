FROM openjdk:8-jdk-alpine
EXPOSE 8085
WORKDIR /app
ADD target/*.jar /app/
ENTRYPOINT ["java", "-jar", "docker-sb.jar"]