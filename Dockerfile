FROM node:8.15-jessie

WORKDIR /code
#Update and install necessary packages


#Copy all project files
#.env file is not provided, and must be manually generated.
COPY . /code

#Install Java
RUN apt-get update &&\
    apt-get install -y --force-yes software-properties-common apt-transport-https &&\
    wget -qO - https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public | apt-key add - &&\
    add-apt-repository --yes https://adoptopenjdk.jfrog.io/adoptopenjdk/deb/ &&\
    apt-get update &&\
    apt-get install -y adoptopenjdk-8-hotspot &&\
    #Install npm and build project
    npm install &&\
    cd client &&\
    npm install &&\
    yarn build &&\
    cd /code

CMD ["npm", "start"]

#Expose port for app, and make /code a volume to persist data between containers
EXPOSE 3001
VOLUME /code/projects