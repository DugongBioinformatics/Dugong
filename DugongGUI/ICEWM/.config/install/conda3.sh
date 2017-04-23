#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "Install Miniconda 3"

wget --quiet https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
    /bin/bash Miniconda3-latest-Linux-x86_64.sh -b -p ~/.conda3 && \
    rm Miniconda3-latest-Linux-x86_64.sh && \
    echo "export PATH=~/.conda3/bin:$PATH" >> ~/.bashrc && \
    echo "export PATH=~/.conda3/bin:$PATH" >> /home/dugong/.bashrc && \
    chown -R dugong:dugong ~/.conda3

############### Add bioconda channels
~/.conda3/bin/conda config --add channels r && \
    ~/.conda3/bin/conda config --add channels bioconda && \
    ~/.conda3/bin/conda clean -tipsy
