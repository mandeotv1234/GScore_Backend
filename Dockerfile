# Use OpenJDK image for Spring Boot
FROM openjdk:21-jdk-slim

WORKDIR /app

COPY . .

# 🔧 Fix permission for gradlew to avoid "Permission denied" error on Render
RUN chmod +x ./gradlew

# Build project without running tests
RUN ./gradlew build -x test

EXPOSE 8080

CMD ["java", "-jar", "build/libs/Backend-0.0.1-SNAPSHOT.jar"]
