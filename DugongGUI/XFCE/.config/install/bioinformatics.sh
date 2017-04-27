#!/usr/bin/env bash
### every exit != 0 fails the script
set -e
echo "Install some bioinformatics tools: Linuxbrew, Basemount and Bioconda"
git clone https://github.com/Linuxbrew/linuxbrew.git ~/.linuxbrew && \
bash -c "$(curl -L https://basemount.basespace.illumina.com/install)" && \
wget --quiet https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
/bin/bash Miniconda3-latest-Linux-x86_64.sh -b -p ~/.conda3 && \
rm Miniconda3-latest-Linux-x86_64.sh && \
~/.conda3/bin/conda config --add channels r && \
~/.conda3/bin/conda config --add channels bioconda && \
~/.conda3/bin/conda clean -tipsy
