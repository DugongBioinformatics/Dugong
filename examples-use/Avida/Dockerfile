FROM bigscience/avida
MAINTAINER Fabiano Menegidio

RUN echo "deb http://ppa.launchpad.net/chris-lea/node.js/ubuntu precise main\n\
">> /etc/apt/sources.list

# Configs essentials
RUN apt-get update -y
RUN apt-get install sudo build-essential -y

# Install tty.js
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C7917B12
RUN apt-get install -y --force-yes nodejs
RUN apt-get clean
ADD tty.js /tty.js/


# Install showterm - record terminal / shell
RUN apt-get install ruby rubygems -y
RUN gem install showterm

ADD startup.sh /
RUN chmod +x /startup.sh

EXPOSE 3000
EXPOSE 22

ENTRYPOINT ["/startup.sh"]
