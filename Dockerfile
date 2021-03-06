FROM debian:stable
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y curl wget gnupg apt-transport-https
RUN curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
RUN echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list
RUN apt-get update
RUN apt-get install -y kubectl

RUN wget "https://github.com/rancher/cli/releases/download/v2.4.13/rancher-linux-amd64-v2.4.13.tar.gz"
RUN tar -xvzf rancher-linux-amd64-v2.4.13.tar.gz
RUN cp rancher-v2.4.13/rancher /usr/local/bin/rancher
ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
