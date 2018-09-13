FROM sshd

ARG user
ARG id

RUN apt-get update && apt-get install -y \
    apt-utils \
    cpio \
    curl \
    entr \
    gnupg2 \
    net-tools \
    python 

COPY build_scripts/install_node /tmp
RUN /tmp/install_node

COPY build_scripts/install_elm /tmp
RUN /tmp/install_elm

RUN apt-get update && apt-get install -y \
    vim 

COPY build_scripts/setup_basic_vim_plugins /tmp
RUN su ${user} -c /tmp/setup_basic_vim_plugins

COPY build_scripts/setup_elm_vim_plugins /tmp
RUN su ${user} -c /tmp/setup_elm_vim_plugins

COPY build_scripts/elmBashrc /tmp
RUN su ${user} -c 'cp /tmp/elmBashrc ~'
RUN su ${user} -c "echo . elmBashrc" | tee -a .bashrc

