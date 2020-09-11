FROM node:8.15-jessie

#Update and install necessary packages
RUN apt-get update
RUN apt-get install -y --force-yes software-properties-common apt-transport-https
RUN wget -qO - https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public | apt-key add -
RUN add-apt-repository --yes https://adoptopenjdk.jfrog.io/adoptopenjdk/deb/
RUN apt-get update
RUN apt-get install -y adoptopenjdk-8-hotspot

#Copy all project files and install node modules
#.env file is not provided, and must be manually generated.
COPY . /code
WORKDIR /code
RUN npm install

#Build the production directory for React
WORKDIR /code/client
RUN npm install
RUN yarn build

WORKDIR /code
CMD ["npm", "start"]

#Expose port for app, and make /code a volume to persist data between containers
EXPOSE 3001
VOLUME /code