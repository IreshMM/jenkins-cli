FROM jenkins/jenkins:lts-jdk17 as jenkins_build
RUN unzip /usr/share/jenkins/jenkins.war  WEB-INF/lib/cli-2.452.2.jar -d /tmp

FROM eclipse-temurin:17-jdk-ubi9-minimal
COPY --from=jenkins_build /tmp/WEB-INF/lib/cli-2.452.2.jar /usr/share/jenkins/ref/jenkins-cli.jar

ENTRYPOINT [ "java", "-jar", "/usr/share/jenkins/ref/jenkins-cli.jar"]