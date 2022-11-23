# FROM openjdk:8-jdk-alpine as build
# WORKDIR /app
# COPY gradlew .
# COPY .gradle .gradle
# RUN mkdir -p /build/libs
# COPY build/libs /app/build/libs
# COPY src src
# RUN mkdir -p build/dependency && (cd build/dependency; jar -xf ../libs/*.jar)
#
# FROM openjdk:8-jre-alpine as production
# ARG DEPENDENCY=/app/build/dependency
#
# COPY --from=build ${DEPENDENCY}/BOOT-INF/lib /app/lib
# COPY --from=build ${DEPENDENCY}/META-INF /app/META-INF
# COPY --from=build ${DEPENDENCY}/BOOT-INF/classes /app
#
# ENTRYPOINT ["java", "-cp", "app:app/lib/*","nanihutagaol.simpleapp.SimpleAppApplication"]

# FROM openjdk
# WORKDIR /docker-app
# EXPOSE 8081
# ADD target/spring-boot-new-jar-file-name.jar spring-boot-new-jar-file-name.jar
# ENTRYPOINT ["java", "-jar", "spring-boot-new-jar-file-name.jar"]
FROM openjdk:8
EXPOSE 8083
ADD build/libs/simple-app-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]