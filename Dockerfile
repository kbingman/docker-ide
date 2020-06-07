FROM node:erbium-alpine3.11

ARG git_user_name
ARG git_user_email

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

# Install Vim Plugins
# Coc for vim8
RUN mkdir -p /home/node/.vim/pack/coc/start
RUN chown -R node /home/node/.vim/pack/coc/start
RUN cd /home/node/.vim/pack/coc/start && curl --fail -L https://github.com/neoclide/coc.nvim/archive/release.tar.gz|tar xzfv -

# Add Coc Extensions
RUN mkdir -p /home/node/.config/coc/extensions
ADD coc.package.json /home/node/.config/coc/extensions/package.json
RUN chown -R node /home/node/.config

# Install global NPM packages
RUN npm i -g npm-check
RUN npm i -g vercel

# Start using the 'node' user
USER node

# Install coc extensions
RUN cd /home/node/.config/coc/extensions && npm i

# Set git user
RUN git config --global user.name "${git_user_name}"
RUN git config --global user.email "${git_user_email}"

RUN mkdir /home/node/work

# Do everything from now in that users home directory
WORKDIR /home/node

ENV HOME /home/node
ENV PORT 3000

EXPOSE 3000

ENTRYPOINT /bin/bash
