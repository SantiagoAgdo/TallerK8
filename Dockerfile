# Etapa 1: Construcción
FROM openjdk:17-jdk-slim AS build
WORKDIR /app
COPY build/libs/k8taller-0.0.1-SNAPSHOT.jar /app/microservice.jar

# Etapa 2: Ejecutar
FROM openjdk:17-jdk-slim
WORKDIR /app
COPY --from=build /app/microservice.jar /app/microservice.jar
ENTRYPOINT ["java", "-jar", "/app/microservice.jar"]
EXPOSE 8080
