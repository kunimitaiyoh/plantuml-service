FROM openjdk:10-jre

RUN apt-get update \
    && apt-get install -y graphviz
WORKDIR /usr/src/plantuml
COPY . .
RUN ./gradlew stage 

ARG PORT=8080
ENV PORT=${PORT}
CMD bin/plantuml-service ${PORT}
