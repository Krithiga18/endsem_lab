# Stage 1: Build the application using Maven
FROM maven:3.8.1-openjdk-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests # Optionally skip tests during build to save time

# Stage 2: Set up the runtime environment with OpenJDK 17
FROM openjdk:17
COPY --from=build /app/target/my-microservice-1.0-SNAPSHOT.jar /my-microservice.jar
CMD ["java", "-jar", "/my-microservice.jar"]
EXPOSE 8080

