#!/bin/bash
echo "#################### Install JupyterLab ####################"
sudo apt update

export LANG=C.UTF-8
export LC_ALL=C.UTF-8
export CONDA_HOME="/opt/conda"
export PATH="${CONDA_HOME}/bin:${PATH}"
# printf "export LANG=C.UTF-8\nexport LC_ALL=C.UTF-8\nexport PATH=\"/opt/conda/bin:\${PATH}\"\n" >> /etc/profile

INSTALLER_URL="https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh"

echo "Installing Miniconda3" && \
    wget -q $INSTALLER_URL -O ~/installer.sh && \
    /bin/bash ~/installer.sh -b -p ${CONDA_HOME} && \
    rm ~/installer.sh && \
    ln -s ${CONDA_HOME}/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
    echo ". ${CONDA_HOME}/etc/profile.d/conda.sh" >> /etc/profile && \
    echo "conda activate base" >> /etc/profile && \
    echo "Set conda-forge as primary channel to reduce conflicts." && \
    conda config --add channels conda-forge && \
    conda update -y --all \
 && echo "Installing JupyterLab and necessary plugins" && \
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
 && echo "Installing necessary python libraries" && \
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
 