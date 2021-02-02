FROM debian as build-maschine
RUN apt update && apt install -y git
RUN apt install -y nodejs npm
RUN node --version
RUN npm --version
RUN npm install -g -y @angular/cli
RUN git clone https://github.com/Fabian918/DockerAutoBuild.git 
WORKDIR /DockerAutoBuild/myapp
RUN npm install
RUN ng build

FROM httpd:2.4
COPY --from=build-maschine /DockerAutoBuild/myapp/dist/myapp /usr/local/apache2/htdocs/