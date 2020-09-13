FROM node:8.15-jessie

WORKDIR /code
#Update and install necessary packages
# RUN apt-get update
# RUN apt-get install -y --force-yes software-properties-common apt-transport-https
# RUN wget -qO - https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public | apt-key add -
# RUN add-apt-repository --yes https://adoptopenjdk.jfrog.io/adoptopenjdk/deb/
# RUN apt-get update
# RUN apt-get install -y adoptopenjdk-8-hotspot
RUN mkdir javabin &&\
    cd javabin &&\
    wget https://github.com/AdoptOpenJDK/openjdk8-binaries/releases/download/jdk8u265-b01/OpenJDK8U-jdk_x64_linux_hotspot_8u265b01.tar.gz &&\
    tar xzf OpenJDK8U-jdk_x64_linux_hotspot_8u265b01.tar.gz &&\
    export PATH=$PWD/jdk8u265-b01/bin:$PATH &&\
    rm OpenJDK8U-jdk_x64_linux_hotspot_8u265b01.tar.gz
    
#Copy all project files and install node modules
#.env file is not provided, and must be manually generated.
COPY . /code
RUN npm install

#Build the production directory for React
WORKDIR /code/client
RUN npm install
RUN yarn build

WORKDIR /code
CMD ["npm", "start"]

#Expose port for app, and make /code a volume to persist data between containers
EXPOSE 3001
VOLUME /code/projects