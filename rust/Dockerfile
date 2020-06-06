FROM rust:1.44-alpine3.11

ARG git_user_name
ARG git_user_email

# Install dependencies
RUN apk add -U --no-cache  \
    vim git git-perl \
    tmux openssh-client bash \
    curl less man openssl

# ENV TERM xterm-256color
# 
# # mv config files
# ADD profile /home/rust/.profile
# ADD bashrc /home/rust/.bashrc
# ADD vimrc /home/rust/.vimrc
# ADD vim /home/rust/.vim
# ADD tmux.conf /home/rust/.tmux.conf
# 
# # Update permissions
# RUN chown rust /home/rust/.profile
# RUN chown rust /home/rust/.bashrc
# RUN chown rust /home/rust/.vimrc
# RUN chown -R rust /home/rust/.vim
# RUN chown rust /home/rust/.tmux.conf
# 
# # Install Vim Plugins
# # Coc for vim8
# RUN mkdir -p /home/rust/.vim/pack/coc/start
# RUN chown -R rust /home/rust/.vim/pack/coc/start
# RUN cd /home/rust/.vim/pack/coc/start && curl --fail -L https://github.com/neoclide/coc.nvim/archive/release.tar.gz|tar xzfv -
# 
# # Add Coc Extensions
# RUN mkdir -p /home/rust/.config/coc/extensions
# ADD coc.package.json /home/rust/.config/coc/extensions/package.json
# RUN chown -R rust /home/rust/.config
# 
# # Start using the 'rust' user
# USER rust
# 
# # Install coc extensions
# RUN cd /home/rust/.config/coc/extensions && npm i
# 
# RUN git config --global user.name "${git_user_name}"
# RUN git config --global user.email "${git_user_email}"
# 
# RUN mkdir /home/rust/work
# 
# # Do everything from now in that users home directory
# WORKDIR /home/rust
# 
# ENV HOME /home/rust
# ENV PORT 3000
# 
# EXPOSE 3000

ENTRYPOINT /bin/bash
