
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

FROM dugong/dugong-xfce
MAINTAINER Fabiano Menegidio

################### Install geWorkbench
WORKDIR /root/
ADD geWorkbench_2.6.0 /root/geWorkbench_2.6.0
RUN ln -s /root/geWorkbench_2.6.0/geWorkbench /root/Desktop/geWorkbench
    
VOLUME ["/data", "/config"]

ENTRYPOINT ["tini", "--"]
ENTRYPOINT ["/dockerstartup/vnc_startup.sh"]
CMD ["--tail-log"]
