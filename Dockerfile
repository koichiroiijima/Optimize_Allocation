ARG BASE_IMAGE=3.10.1-debian-bullseye-0.0.1-20220103

FROM koichiroiijima/python_base:${BASE_IMAGE}

ARG IMAGE_NAME=optimize_allocation
ARG IMAGE_VERSION=0.0.1

LABEL \
    NAME=${IMAGE_NAME} \
    VERSION=${IMANGE_VERSION} 

RUN set -ex \
# Install Python packages
    && \
    apt-get update \
    && \
    apt-get install -y cmake glpk-utils libglpk40 libopenblas-base \
    && \
    pip install -U  --no-cache-dir pip \
    && \
    pip --version \
    && \
    pip install -U --no-cache-dir \
    numpy \
    pandas \
    scikit-learn \
    jupyterlab \
    pandas-datareader \
    yfinance \
    yahoo_finance_api2 \
    matplotlib \
    cvxpy \
    cvxopt \
    PyPortfolioOpt \
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
