FROM debian

ENV INSTALL_PACKAGES software-properties-common python-software-properties apt-transport-https
ENV CORE_PACKAGES nodejs
ENV BUILD_PACKAGES build-essential
ENV SHARED_NODE_PACKAGES bower coffee-script gulp-cli node-static pm2

COPY nodesource.gpg.key /

RUN apt-key add /nodesource.gpg.key && \
    apt-get update && \
    apt-get install -y --no-install-recommends ${INSTALL_PACKAGES} && \
    add-apt-repository http://deb.nodesource.com/node_5.x && \
    apt-get update && \
    apt-get install -y --no-install-recommends ${CORE_PACKAGES} && \
    apt-get install -y --no-install-recommends ${BUILD_PACKAGES}


RUN npm install -g ${SHARED_NODE_PACKAGES}

# Copy entrypoint
WORKDIR src
COPY entrypoint.sh /src/
ENTRYPOINT ["./entrypoint.sh"]
CMD ["pm2"]
