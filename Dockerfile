FROM mcr.microsoft.com/azure-cli:latest

ARG TERRAFORM_VERSION="1.14.2"

RUN tdnf update -y && \
    tdnf install -y wget unzip && \
    tdnf clean all

RUN wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    mv terraform /usr/local/bin/ && \
    rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip

WORKDIR /app