###########################################################################
# Dugong - Scientific Linux Containers for Bioinformatic
# ======================================================
#
# Current development is led by Fabiano Menegidio.
#
# Bioinformatician/Bioinformaticist at the Laboratory of Functional 
# and Structural Genomics of the Integrated Nucleus of Biotechnology 
# at the University of Mogi das Cruzes, Brazil.
# 
# Contact: fabiano.menegidio@biology.bio.br
# GitHub: https://github.com/fabianomenegidio
#
#
###########################################################################

FROM dugong/dugong:cmd
MAINTAINER Fabiano Menegidio <fabiano.menegidio@biology.bio.br>

RUN conda install qiime=1.9.1 qiime-default-reference=0.1.3 qiimetomaaslin=1.1.0

WORKDIR /data/
