FROM ubuntu:16.10
MAINTAINER juliandondero@gmail.com

RUN useradd -ms /bin/bash user
USER user
WORKDIR /home/user
ENV NODE_VERSION 6.8.0

USER root

# supervisord from ubuntu repository
RUN apt-get update && apt-get install -y supervisor
RUN apt-get install -y apt-utils
RUN apt-get install -y git-core
RUN apt-get install -y curl
RUN apt-get install -y vim

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

USER user
WORKDIR /home/user

RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | bash \ 
	&& /bin/bash -c "source ~/.bashrc && source /home/user/.nvm/nvm.sh && nvm install $NODE_VERSION && nvm alias default $NODE_VERSION && nvm use default && npm install bower -g && npm install -g ember-cli && npm install -g less"

USER root
CMD ["/usr/bin/supervisord"]
