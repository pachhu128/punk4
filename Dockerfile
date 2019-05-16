# build
FROM maven:alpine
WORKDIR /usr/src/app
COPY pom.xml .
RUN mvn -B -e -C -T 1C org.apache.maven.plugins:maven-dependency-plugin:3.0.2:go-offline
COPY . .
RUN mvn -B -e -o -T 1C verify

# package without maven
FROM openjdk:alpine
COPY --from=0 /usr/src/app/target/*.jar ./
