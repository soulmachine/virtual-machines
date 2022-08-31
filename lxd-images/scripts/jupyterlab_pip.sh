#!/bin/bash

echo "#################### Install JupyterLab ####################"

export LANG=C.UTF-8
export LC_ALL=C.UTF-8

echo "##### Installing Python3" && apt update && apt install -y --no-install-recommends \
    build-essential nodejs npm  python3 python3-pip python3-dev python3-distutils python3-venv \
 && echo "##### Installing JupyterLab and necessary plugins" && pip3 install \
    ipywidgets \
    jupyterlab \
    nbconvert \
    jupyterlab-git \
    jupyter_http_over_ws \
    nbdime && \
    jupyter nbextension install nbdime --py --sys-prefix --symlink && \
    jupyter nbextension enable nbdime --py --sys-prefix && \
    jupyter nbextension enable widgetsnbextension --py --sys-prefix && \
    jupyter serverextension enable nbdime --py --sys-prefix && \
    jupyter serverextension enable jupyter_http_over_ws --py --sys-prefix && \
    jupyter labextension install nbdime-jupyterlab --no-build  && \
    jupyter labextension install jupyterlab-plotly --no-build  && \
    jupyter labextension install plotlywidget --no-build  && \
    jupyter lab build --minimize=True && \
    jupyter lab clean && \
    jlpm cache clean && \
    npm cache clean --force && \
    nbdime config-git --enable --global \
 && echo "##### Installing necessary python libraries" && pip install \
    dask \
    matplotlib \
    numpy \
    pandas \
    pyarrow \
    scikit-learn \
    scipy \
    seaborn \
    statsmodels \
    tqdm \
 && echo "##### Installing python libraries for dYdX" && pip install \
    web3 \
    python-dateutil \
    ecdsa \
    mpmath \
    sympy

