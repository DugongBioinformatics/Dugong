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

RUN conda install soapdenovo2=2.40 soapec=2.03 soapdenovo2-prepare=2.0 soapdenovo2-gapcloser=1.12 soapdenovo2-errorcorrection=2.0

WORKDIR /data
