FROM ubuntu:18.04

ARG HOME="/opt"
ARG APP_NAME="cloudking"
ARG USER_ID="10001"
ARG GROUP_ID="cloudking"

RUN groupadd --gid ${USER_ID} ${GROUP_ID} && \
    useradd --create-home --uid ${USER_ID} --gid ${GROUP_ID} --home-dir /opt ${GROUP_ID}

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends curl \
    ca-certificates \
    locales \
    apt-transport-https \
    gnupg \
    python3 \
    python3-pip \
    python3-setuptools

RUN update-locale LANG=C.UTF-8

RUN curl -sL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | tee /etc/apt/trusted.gpg.d/microsoft.gpg > /dev/null
RUN curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -

RUN echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ bionic main" | tee /etc/apt/sources.list.d/azure-cli.list
RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list


RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    azure-cli \
    google-cloud-sdk \
    awscli

ADD . ${HOME}/${APP_NAME}

WORKDIR ${HOME}/${APP_NAME}

RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install -r requirements.txt

RUN chown -R ${USER_ID}:${GROUP_ID} ${HOME}
USER ${USER_ID}

ENTRYPOINT ["python3", "/opt/cloudking/ck.py"]
