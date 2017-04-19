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

FROM bigscience/dugong
MAINTAINER Fabiano Menegidio

RUN apt-get update
RUN apt-get install graphviz -y

WORKDIR /root/

### Install Java Cryptography Extension
RUN curl -v -j -k -L -H "Cookie:oraclelicense=accept-securebackup-cookie" \
    http://download.oracle.com/otn-pub/java/jce/8/jce_policy-8.zip  > jce_policy-8.zip
RUN unzip /root/jce_policy-8.zip
RUN rm /root/jce_policy-8.zip
RUN cp -R /root/UnlimitedJCEPolicyJDK8/* /usr/lib/jvm/java-8-openjdk-amd64/jre/lib/security/
RUN rm -rf /root/UnlimitedJCEPolicyJDK8/

WORKDIR /root/Desktop

### Install Taverna Workbench
RUN wget https://bitbucket.org/taverna/taverna-workbench-product/downloads/taverna-workbench-bioinformatics-2.5.0-standalone.zip
RUN unzip taverna-workbench-bioinformatics-2.5.0-standalone.zip
RUN rm taverna-workbench-bioinformatics-2.5.0-standalone.zip
RUN mv /root/Desktop/taverna-workbench-bioinformatics-2.5.0/ /root/Desktop/taverna-workbench/
RUN chmod +x /root/Desktop/taverna-workbench/taverna.sh
RUN ln -s /root/Desktop/taverna-workbench/taverna.sh taverna

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENTRYPOINT ["/root/scripts/vnc_startup.sh"]
CMD ["--tail-log"]
