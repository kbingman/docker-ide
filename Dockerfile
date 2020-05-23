FROM node:latest

RUN bash
RUN apt-get update -y --fix-missing
RUN apt-get upgrade -y

RUN apt-get install -y locales-all
RUN apt-get install -y vim
RUN apt-get install -y tmux 

WORKDIR /home/app
USER node
ENV PORT 3000

EXPOSE 3000

ENTRYPOINT /bin/bash
