FROM openjdk:11-jre-slim

WORKDIR /app

# Copy the JAR file
COPY target/demo-app-1.0-SNAPSHOT.jar app.jar

# Expose the application port
EXPOSE 8080

# Command to run the application
CMD ["java", "-jar", "app.jar"]