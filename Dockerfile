# Use OpenJDK image for Spring Boot
FROM openjdk:21-jdk-slim

WORKDIR /app

COPY . .

# Fix permission for gradlew to avoid "Permission denied"
RUN chmod +x ./gradlew

# Build project without running tests
RUN ./gradlew build -x test

EXPOSE 8080

# Avoid hardcoded JAR name
CMD ["sh", "-c", "java -jar build/libs/*.jar"]
