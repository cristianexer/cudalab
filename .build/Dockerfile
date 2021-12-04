FROM nvidia/cuda:11.4.2-cudnn8-runtime-ubuntu20.04

# Arguments
ARG MINICONDA_BASH_PATH="https://repo.anaconda.com/miniconda/Miniconda3-py39_4.10.3-Linux-x86_64.sh"

# create a working directory
RUN mkdir /home/lab
RUN chmod 1777 /home/lab

RUN apt-get update
# install essentials
RUN apt-get install curl wget build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev libsqlite3-dev wget libbz2-dev -y


# download and install miniconda python 3.9
RUN curl ${MINICONDA_BASH_PATH} -o miniconda.sh
RUN bash miniconda.sh -p /miniconda -b
ENV PATH=/miniconda/bin:${PATH}

RUN conda update -y conda
RUN conda config --add channels conda-forge
RUN conda config --add channels defaults
RUN conda config --add channels pytorch
RUN conda config --add channels nvidia


# copy entrypoint.sh to working directory and set permissions
COPY ./entrypoint.sh /home/entrypoint.sh
RUN chmod +x /home/entrypoint.sh


# install jupyter lab at base
RUN conda install pip jupyterlab nb_conda_kernels ipykernel cudatoolkit=11.5.0 -y

# install NN based packages
RUN conda install pytorch-gpu -y
RUN pip install tensorflow-gpu


# run jupyter lab at mounted volumes
WORKDIR /home/lab

# execute entrypoint.sh
ENTRYPOINT [ "bash","/home/entrypoint.sh" ]