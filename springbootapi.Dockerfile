FROM maven:3.8.3-openjdk-16
COPY spring-boot-projects /spring-boot-projects
COPY mvn-deploy.sh /spring-boot-projects/spring-boot-modules/spring-boot-angular
WORKDIR spring-boot-projects/spring-boot-modules/spring-boot-angular
RUN mvn clean install &&  mvn clean package
ENTRYPOINT ["mvn", "spring-boot:run"]