FROM ubuntu:18.04
ENV tf_version=0.15.3
# Install dependencies
RUN apt-get update && apt-get install -y \
    python3-pip \
    groff \
    git \
    libpq-dev \
    python-dev \
    libssl-dev \
    build-essential \
    libffi-dev \
    wget \
    unzip \
    jq
RUN pip3 install --upgrade cffi
RUN pip3 install cryptography
RUN pip3 install awscli --upgrade
RUN pip3 install virtualenv

RUN wget https://releases.hashicorp.com/terraform/${tf_version}/terraform_${tf_version}_linux_amd64.zip
RUN unzip terraform_${tf_version}_linux_amd64.zip
RUN mv terraform /usr/local/bin/

RUN mkdir /host
ENV PATH="/host:${PATH}"
WORKDIR /host