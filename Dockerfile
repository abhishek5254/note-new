# Use a Maven base image with JDK 11 for building the project
FROM maven:3.8.5-openjdk-11 AS builder

# Set the working directory in the container
WORKDIR /app

# Copy the Maven project files
COPY pom.xml .
COPY src ./src

# Build the project, which generates the .war file
RUN mvn clean package

# Use the official Tomcat image with JDK 11 to deploy the application
FROM tomcat:9.0-jdk11-openjdk

# Remove the default ROOT web app in Tomcat (optional)
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Copy the generated .war file from the builder stage to the Tomcat webapps directory
COPY --from=builder /app/target/*.war /usr/local/tomcat/webapps/ROOT.war

# Expose the default Tomcat port
EXPOSE 8080
