FROM python:3

RUN apt-get update -y \
    && apt-get install -y \
    curl \
    libssl-dev \
    libffi-dev \
    python3-dev \
    build-essential

# install azure cli
COPY ./InstallAzureCli /InstallAzureCli

RUN chmod a+x /InstallAzureCli \
    && /InstallAzureCli

# install docker
RUN curl -sSL https://get.docker.com | sh

ENV PATH=$PATH:/root/bin

CMD ["az"]
