FROM node:13.3.0 AS compile-image
RUN npm install
RUN npm i git-install
RUN git clone https://github.com/Fabian918/DockerAutoBuild.git




