FROM maven:latest as build

WORKDIR /usr/src/app

COPY pom.xml .

RUN mvn dependency:go-offline

COPY . .

RUN mvn package -DskipTests



FROM openjdk:latest

WORKDIR /usr/src/app

COPY --from=build /usr/src/app/target/demo-0.0.1-SNAPSHOT.jar .

CMD ["java", "-jar", "demo-0.0.1-SNAPSHOT.jar"]
