FROM navikt/java:13

ENV FOLDER /app
WORKDIR ${FOLDER}
RUN wget https://repo1.maven.org/maven2/no/nav/arxaas/2020.02.24-16.04-366f0cde73f4/arxaas-2020.02.24-16.04-366f0cde73f4.jar --output-document=arxaas.jar
RUN chmod 777 -R ${FOLDER}

EXPOSE 8080

ENTRYPOINT ["java","-jar","arxaas.jar"]
