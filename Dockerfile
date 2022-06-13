FROM oraclelinux:8.6

WORKDIR /projeto

RUN yum -y update
RUN dnf -y update
RUN yum -y install tar
RUN yum -y install python3-pip
RUN curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-389.0.0-linux-x86_64.tar.gz
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
RUN install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

RUN tar -xf google-cloud-cli-389.0.0-linux-x86_64.tar.gz
RUN ./google-cloud-sdk/install.sh

CMD ./google-cloud-sdk/bin/gcloud init
#CMD ["chmod +x kubectl", "mkdir -p ~/.local/bin", "mv ./kubectl ~/.local/bin/kubectl"]

#CMD tar -xf /temp/gcloud.tar.gz
#"./google-cloud-sdk/install.sh","./google-cloud-sdk/bin/gcloud init"]