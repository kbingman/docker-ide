FROM node:erbium-alpine3.11

# Install dependencies
RUN apk add -U --no-cache  \
    vim git git-perl \
    tmux openssh-client bash \
    curl less man openssl

ENV TERM xterm-256color

# mv config files
ADD profile /home/node/.profile
ADD bashrc /home/node/.bashrc
ADD vimrc /home/node/.vimrc
ADD vim /home/node/.vim
ADD tmux.conf /home/node/.tmux.conf

# Update permissions
RUN chown node /home/node/.profile
RUN chown node /home/node/.bashrc
RUN chown node /home/node/.vimrc
RUN chown -R node /home/node/.vim
RUN chown node /home/node/.tmux.conf

# Start using the 'node' user
USER node

RUN mkdir /home/node/files

# Do everything from now in that users home directory
WORKDIR /home/node

# Install Vim Plugins
# for vim8
RUN mkdir -p /home/node/.vim/pack/coc/start
RUN cd /home/node/.vim/pack/coc/start && curl --fail -L https://github.com/neoclide/coc.nvim/archive/release.tar.gz|tar xzfv -

ENV HOME /home/node
ENV PORT 3000

EXPOSE 3000

ENTRYPOINT /bin/bash
