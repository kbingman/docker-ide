FROM node:erbium-alpine3.11

RUN apk add -U --no-cache  \
    vim git git-perl \
    tmux openssh-client bash \
    curl less man openssl

# mv config files
# ADD . /home/default/Config
ADD vimrc /home/node/.vimrc
# ADD bashrc /home/node/.bashrc
ADD profile /home/node/.profile
ADD bashrc /home/node/.bashrc
ADD vim /home/node/.vim

RUN chown node /home/node/.vimrc
RUN chown -R node /home/node/.vim

ENV TERM xterm-256color

# Start using the 'node' user
USER node

RUN mkdir /home/node/files

# Do everything from now in that users home directory
WORKDIR /home/node
ENV HOME /home/node


ENV PORT 3000

EXPOSE 3000

RUN source /home/node/.profile

ENTRYPOINT /bin/bash
