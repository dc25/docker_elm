FROM sshd

RUN apt-get update && apt-get install -y \
    cpio \
    curl \
    entr \
    net-tools \
    python 

WORKDIR /workarea

COPY build_scripts/install_node .
RUN su ${DEVL} -c ./install_node

COPY build_scripts/install_elm .
RUN su ${DEVL} -c ./install_elm

COPY build_scripts/setup_elm_vim_plugins .
RUN su ${DEVL} -c ./setup_elm_vim_plugins

COPY build_scripts/elmBashrc .
RUN su ${DEVL} -c "echo . elmBashrc" | tee -a .bashrc


RUN chown -R ${DEVL} .
