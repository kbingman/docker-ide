FROM node:erbium-alpine3.11

RUN apk add -U --no-cache  \
    vim git git-perl \
    tmux openssh-client bash \
    curl less man openssl

# Create a user called 'me'
USER node

# Do everything from now in that users home directory
WORKDIR /home/app
ENV HOME /home/app


ENV PORT 3000

EXPOSE 3000

# mv config files
# ADD . /home/default/Config
ADD vimrc /home/app/.vimrc
# ADD bashrc /home/app/.bashrc
ADD profile /home/app/.profile
ADD vim /home/app/.vim

RUN source /home/app/.profile

ENTRYPOINT /bin/bash
