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

FROM dugong/dugong:xfce
MAINTAINER Fabiano Menegidio

################### Download Rockhopper
WORKDIR /root/Desktop
RUN wget http://cs.wellesley.edu/~btjaden/Rockhopper/download/current/Rockhopper.jar \
    && mkdir /root/Desktop/Rockhopper \
    && mv /root/Desktop/Rockhopper.jar /root/Desktop/Rockhopper
    && chmod +x /root/Desktop/Rockhopper/Rockhopper.jar
    && ln -s /root/Desktop/Rockhopper/Rockhopper.jar Rockhopper
    
################### Download example files
WORKDIR /root/Desktop/Rockhopper
RUN wget http://cs.wellesley.edu/~btjaden/Rockhopper/download/Example_Condition1.fastq \
    && wget http://cs.wellesley.edu/~btjaden/Rockhopper/download/Example_Condition2.fastq
    
ADD start.sh /root/Desktop/Rockhopper/
RUN chmod +x /root/Desktop/Rockhopper/start.sh 

VOLUME ["/data", "/config"]

USER $USER

ENTRYPOINT ["tini", "--"]
ENTRYPOINT ["/dockerstartup/vnc_startup.sh"]
ENTRYPOINT ["/root/Desktop/Rockhopper/start.sh"]
CMD ["--tail-log"]

WORKDIR /data
