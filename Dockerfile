FROM openjdk:8
ADD target/springboot-0.0.1-SNAPSHOT.jar docker-spring-boot.jar
EXPOSE 8080
EXPOSE 3306
ENTRYPOINT ["java", "-jar", "docker-spring-boot.jar"]
