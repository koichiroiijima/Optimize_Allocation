ARG BASE_IMAGE=3.13.1-debian-bookworm-0.0.1-20241231

FROM koichiroiijima/python_base:${BASE_IMAGE}

ARG IMAGE_NAME=optimize_allocation
ARG IMAGE_VERSION=0.0.1

LABEL \
    NAME=${IMAGE_NAME} \
    VERSION=${IMANGE_VERSION} 

COPY ./requirements.txt /opt/requirements.txt

RUN set -ex \
# Install Python packages
    && \
    apt-get update \
    && \
    #apt-get install -y cmake glpk-utils libglpk40 libopenblas-base \
    apt-get install -y libopenblas-dev \
    && \
    pip install -U  --no-cache-dir pip \
    && \
    pip --version \
    && \
    pip install -U --no-cache-dir -r ./requirements.txt \
    && \
    pip cache purge \
    && \
    rm -rf ~/.cache/* \
    && \
    rm -rf ~/.pyenv/cache/* \
    && \
    apt-get autoclean \
    && \
    apt-get clean \
    && \
    rm -rf /var/lib/apt/lists/*

CMD ["jupyter-lab"]
