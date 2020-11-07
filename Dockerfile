FROM openjdk:8
ADD app/target/springboot-0.0.1-SNAPSHOT.jar docker-spring-boot.jar
EXPOSE 8085
ENTRYPOINT ["java", "-jar", "docker-spring-boot.jar"]
