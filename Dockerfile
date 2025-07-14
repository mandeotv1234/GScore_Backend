# Use OpenJDK image for Spring Boot
FROM openjdk:21-jdk-slim
WORKDIR /app
COPY . .
RUN ./gradlew build -x test
EXPOSE 8080
CMD ["java", "-jar", "build/libs/Backend-0.0.1-SNAPSHOT.jar"]
