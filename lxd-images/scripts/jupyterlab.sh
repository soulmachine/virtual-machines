#!/bin/bash
# Docs:
# * https://docs.anaconda.com/anaconda/install/multi-user/
# * https://github.com/conda/conda/issues/9895
# * https://medium.com/@pjptech/installing-anaconda-for-multiple-users-650b2a6666c6

echo "#################### Install JupyterLab ####################"
apt update

export LANG=C.UTF-8
export LC_ALL=C.UTF-8
export CONDA_HOME="/opt/anaconda3"
export PATH="${CONDA_HOME}/bin:${PATH}"
# printf "export LANG=C.UTF-8\nexport LC_ALL=C.UTF-8\nexport PATH=\"/opt/conda/bin:\${PATH}\"\n" >> /etc/profile

INSTALLER_URL="https://repo.anaconda.com/archive/Anaconda3-2022.05-Linux-x86_64.sh"

echo "##### Installing Anaconda3" && \
    wget -q $INSTALLER_URL -O ~/installer.sh && \
    /bin/bash ~/installer.sh -b -p ${CONDA_HOME} && \
    rm ~/installer.sh && \
    eval "$(conda shell.bash hook)" && conda init && \
    echo "conda activate base" >> /root/.bashrc && \
    echo "##### Set conda-forge as primary channel to reduce conflicts." && \
    conda config --add channels conda-forge && \
    conda update -y --all && \
    echo "##### Switch to the new conda user" && \
    adduser --gecos '' --no-create-home --disabled-login conda && \
    chown -R conda:conda $CONDA_HOME && chmod -R u=rwX,g=rwX,o=rX $CONDA_HOME && \
    sudo su conda && export PATH="$PATH:/opt/anaconda3/bin" \
 && echo "##### Installing JupyterLab and necessary plugins" && \
    conda install nodejs -y -c conda-forge --repodata-fn=repodata.json && \
    conda install -y -c conda-forge \
    ipywidgets \
    jupyterlab \
    nbconvert \
    nb_conda \
    nb_conda_kernels \
    jupyterlab-git \
    jupyter_http_over_ws \
    nbdime && \
    jupyter nbextension install nb_conda --py --sys-prefix --symlink && \
    jupyter nbextension install nbdime --py --sys-prefix --symlink && \
    jupyter nbextension enable nb_conda --py --sys-prefix && \
    jupyter nbextension enable nbdime --py --sys-prefix && \
    jupyter nbextension enable widgetsnbextension --py --sys-prefix && \
    jupyter serverextension enable nb_conda --py --sys-prefix && \
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
 && echo "##### Installing necessary python libraries" && \
    conda install -y -c conda-forge \
    dask \
    matplotlib \
    numpy \
    pandas \
    pyarrow \
    pytables \
    scikit-learn \
    scipy \
    seaborn \
    statsmodels \
    tqdm \
 && conda update -y --all && conda clean -afy

