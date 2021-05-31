FROM ubuntu
RUN apt-get update
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get install -y apache2
RUN apt-get install -y apache2-utils
RUN apt-get clean
CMD ["apache2ctl", "-D", "FOREGROUND"]
EXPOSE 80
