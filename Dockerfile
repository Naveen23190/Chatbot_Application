#
# FROM maven:3.9-eclipse-temurin-21 AS build
#
# WORKDIR /app
#
# COPY pom.xml .
# COPY src ./src
#
# RUN mvn clean package -DskipTests
#
# FROM eclipse-temurin:21-jre
#
# WORKDIR /app
#
# COPY --from=build /app/target/*.war app.war
#
# EXPOSE 8086
#
# ENTRYPOINT ["java", "-jar", "app.war"]


FROM eclipse-temurin:21-jdk AS build

WORKDIR /app

COPY . .

RUN chmod +x mvnw && ./mvnw clean package -DskipTests

FROM eclipse-temurin:21-jre

WORKDIR /app

COPY --from=build /app/target/*.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]

