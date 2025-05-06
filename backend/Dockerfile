# Use an OpenJDK image
FROM openjdk:11
WORKDIR /app
COPY . .
COPY . .
RUN chmod +x mvnw
RUN ./mvnw clean package
CMD ["java", "-jar", "target/backend-0.0.1-SNAPSHOT.jar"]
