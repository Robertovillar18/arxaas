FROM navikt/java:13

# Se instalan las librerias necesarias para matplotlib
# RUN apt-get update
# RUN apt-get install ffmpeg libsm6 libxext6  -y

ENV FOLDER /app
WORKDIR ${FOLDER}
RUN wget https://repo1.maven.org/maven2/no/nav/arxaas/2020.02.24-16.04-366f0cde73f4/arxaas-2020.02.24-16.04-366f0cde73f4.jar --output-document=arxaas.jar
RUN chmod 777 -R ${FOLDER}


RUN touch ${FOLDER}/exec.sh 
RUN echo '#!/bin/sh' > ${FOLDER}/exec.sh
RUN echo "echo 'Application initialized'" >> ${FOLDER}/exec.sh
RUN echo 'tail -f /dev/null' >> ${FOLDER}/exec.sh

EXPOSE 8080

#ENTRYPOINT [ "/bin/sh", "/app/exec.sh"]

ENTRYPOINT ["java","-jar","arxaas.jar"]
# ENTRYPOINT ["python3"]
# CMD ["main.py"]



##FROM navikt/java:13
# FROM maven:latest

# USER 0
# RUN mkdir -p /app/arx
# RUN wget https://arx.deidentifier.org/?ddownload=1921 --output-document=/app/arx/arx-gtk-64.jar

# USER 1001

# ENV FOLDER /app
# RUN touch ${FOLDER}/exec.sh 
# RUN echo '#!/bin/sh' > ${FOLDER}/exec.sh
# RUN echo "echo 'Application initialized'" >> ${FOLDER}/exec.sh
# RUN echo 'tail -f /dev/null' >> ${FOLDER}/exec.sh

# VOLUME /app
# EXPOSE 8080/tcp
# ENV SPRING_PROFILES_ACTIVE=prod
# ENV JAVA_OPTS="-Xmx8g -XshowSettings:vm"

# RUN chmod +x /app/exec.sh
# RUN chmod +x /app/arx/arx-gtk-64.jar
# ENTRYPOINT [ "/bin/sh", "/tmp/exec.sh"]
