[![DOI](https://zenodo.org/badge/88288867.svg)](https://zenodo.org/badge/latestdoi/88288867)

![Dugong](https://raw.githubusercontent.com/fabianomenegidio/dugong-bioinformatics/gh-pages/.misc/dugongo.png)

# Dugong - Scientific Linux Container

[Dugong](https://hub.docker.com/r/dugong/dugong) is a powerful workstation platform especially designed for scientific computational analysis, mainly of bioinformatics and computational biology, that can be installed in any computational ecosystem, regardless of the operating system and hardware used. In general terms, it is a Linux operating system designed specifically for the development of the [Open Science](https://en.wikipedia.org/wiki/Open_science) concept, based on the reproducibility and replicability of the research.

It's an implementation built under the MIT license using the Docker platform, an open-source project that automates the implementation of applications within software containers, providing an additional layer of abstraction and automation of operating system-level virtualization on Linux. Docker uses the Linux kernel resource isolation features, such as cgroups and namespaces, as well as the file system AuFS (advanced multi layered unification filesystem) to allow independent "containers" to run In a single Linux instance, avoiding an overload of initialization and maintenance of virtual machines. The Dugong project enables efficient creation of reusable containers for bioinformatics data, making the analysis environment and all computational results reproducible by the scientific community.

Dugong is based on version 16.04 of the Ubuntu image (https://hub.docker.com/r/_/ubuntu), a Linux operating system inspired on the Debian distribution. The Ubuntu project is publicly committed to the principles of open source software development, where people are encouraged to use free software, study how they function, improve and distribute them freely. 

For more details on the Ubuntu operating system: [http://www.ubuntu.com](http://www.ubuntu.com).

Dugong requires a minimum of knowledge about Docker, Linux or computing for its implementation, being compatible with Linux, Windows and MacOS operating systems. It also enables the execution of a complete work environment in high performance computing environments (HPC), virtual private server (VPS), as well as private, public or hybrid cloud computing.

## Dugong flavours

Today, the Dugong operating system is available in two versions: ***DugongGUI*** and ***DugongCMD***.

### DugongGUI

Our great differential for applications in bioinformatics and computational biology. Based on Ubuntu 16.04, the ***DugongGUI*** image has two graphical interface (GUI) options: ***Xfce4*** or ***IceWM***.

- [Xfce4](https://www.xfce.org/) (translated as four individual letters) is a free and open source desktop environment for Unix platforms such as Linux, Solaris and BSD. As a fast, easy-to-use open-source workbench, it was selected as the official GUI for the Dugong project.
- [IceWM](http://www.icewm.org/) is a window manager designed for lightweight simplicity and ease of use, but not focused on customizability. It looks similar to Windows 95.

Access as graphical interfaces available in DugongGUI can be performed through two options:

- [VNC](https://www.realvnc.com/): a graphical desktop sharing system that uses the Remote Frame Buffer (RFB) protocol to remotely control another computer. It transmits the keyboard and mouse events from one computer to another, transmitting as graphical screen updates back in the other direction, over a network.
- [noVNC](http://kanaka.github.io/noVNC/noVNC/vnc.html): a client implemented through HTML5 Canvas and WebSockets technologies that allow execution of a graphical desktop sharing system through VNC using a simple browser.

***DugongGUI*** also has a set of preinstalled software packages that allow a better use of the operating system, especially:

- [Google Chrome](https://www.google.com/chrome/browser/): a browser that combines a minimalist design with sophisticated technology to make the web faster, safer and easier.
- [Mozilla Firefox](https://www.mozilla.org/en/firefox): a free and open source web browser developed by the Mozilla Foundation and its subsidiary, Mozilla Corporation.
- [MEGASync](https://mega.nz/#sync): a desktop client for MEGA Service Cloud providing easy automatic synchronization of files and folders between our computer and the cloud drive with 10Gb storage.

***DugongGUI*** allows a simple, quick and easy distribution of any bioinformatics application that can be installed on an Ubuntu operating system.  It also allows the generated containers to be used for a wide range of purposes, such as training, data analysis, tool implementation, devops, etc.

### DugongCMD

***DugongCMD*** is a version of the Dugong image that works exclusively in the command line environment, without a graphical interface.

With a focus on fast access and availability of command line bioinformatics tools, ***DugongCMD*** has an interactive terminal developed in node.js that can be accessed directly by the browser. It also features a set of preinstalled software that allow better use of the operating system, especially:

- [MEGAcmd](https://mega.nz/cmd): tool that allows access through the Mega cloud command line and provides a set of powerful commands for a file manipulation.
- [Showterm](https://showterm.io/): is an open source terminal record and upload application that lets you easy to record how-to in your terminal. It will record all your terminal activity in text-base and upload to showterm.io as a video and then generates a link for you to share with your team-mates or embed it in your website as an iframe.

## Bioinformatics Software

Two open-source projects were integrated with ***Dugong***, [Linuxbrew](http://linuxbrew.sh/) and [Conda](http://conda.pydata.org/), for the simple distribution of bioinformatics packages. 

***Linuxbrew*** is a fork for Linux from Homebrew, the MacOS package manager, developed and maintained by Shaun Jackman. The project has [Homebrew Science](https://github.com/Homebrew/homebrew-science), a version focused on the distribution of scientific software. ***Conda*** is a package manager that allows the installation, distribution and updating of different packages and their respective dependencies. It has a software distribution channel focused on bioinformatics tools called [Bioconda](https://bioconda.github.io).

Bioconda consists of:

- a repository of recipes hosted on GitHub
- a build system that turns these recipes into conda packages
- a repository of >1500 bioinformatics packages ready to use with conda install
- Over 130 contributors that add, modify, update and maintain the recipes

The installation of bioinformatics software in ***Dugong*** is extremely simple and can be run by Linuxbrew and Bioconda. In addition, it provides the Bio-Linux 8 and Linux Mint repositories for the apt-get package manager and for Synaptic.

For the installation of software of bioinformatics through Linuxbrew it is enough to execute the command below in the terminal of ***Dugong***:

```
brew install homebrew/science/<software>
```

or

```bash 
brew tap homebrew/science
brew install <software> 
```

Already for a bioinformatics software installation by Bioconda, the command below is necessary not to bash the ***Dugong***:

```
conda install <software>
```

There are currently 2707 bioinformatics packages available in the Bioconda repository, 673 in the Linuxbrew repository, and 250 in the BioLinux 8 repository.

The installation of bioinformatics packages in Dugong is not restricted to the methods presented. An example is BaseMount, the tool for mounting your BaseSpace Sequence Hub data as a Linux file system. With it, you can navigate projects, samples, runs, and application results and interact directly with associated files, just like any other local file system.

Sources such as GitHub, for example, can be used to install new tools simply and quickly.

![line](http://skstroi.ru/wp-content/uploads/2016/05/foot-line.png)

## Install Docker

### Ubuntu:

1. Set up the repository

Set up the Docker CE repository on Ubuntu. The lsb_release -cs sub-command prints the name of your Ubuntu version, like xenial or trusty.

    $ sudo apt-get -y install \
        apt-transport-https \
        ca-certificates \
        curl

    $ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

    $ sudo add-apt-repository \
        "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
        $(lsb_release -cs) \
        stable"

    $ sudo apt-get update

2. Get Docker CE

Install the latest version of Docker CE on Ubuntu:

    $ sudo apt-get -y install docker-ce

3. Test your Docker CE installation

Test your installation:

    $ sudo docker run hello-world


### Fedora

1. Set up the repository

Set up the Docker CE repository on Fedora:

    $ sudo dnf -y install dnf-plugins-core

    $ sudo dnf config-manager \
        --add-repo \
        https://download.docker.com/linux/fedora/docker-ce.repo

    $ sudo dnf makecache fast
    
2. Get Docker CE

Install the latest version of Docker CE on Fedora:

    $ sudo dnf -y install docker-ce

Start Docker:

    $ sudo systemctl start docker

or

    $ sudo service docker start

3. Test your Docker CE installation

Test your installation:

    $ sudo docker run hello-world

### Windows:

Access: https://store.docker.com/editions/community/docker-ce-desktop-windows

### MacOS:

Access: https://store.docker.com/editions/community/docker-ce-desktop-mac

![line](http://skstroi.ru/wp-content/uploads/2016/05/foot-line.png)

## Deploy and access Dugong

The Docker project provides a public cloud called the [Docker Hub](https://hub.docker.com) for sharing the developed containers. This cloud allows access to the application in a centralized and simple way, that is, it is possible to obtain a complete Dugong environment with command lines for its implementation.

To start a container, the user must have Docker installed on his operating system, according to the tutorials available in the project documentation. The Dugong image is available in the [Docker Hub](https://github.com/fabianomenegidio/dugong-bioinformatics) and its use is the recommended method of installation.

Two steps are required to start a container containing Dugong. In the first step, the Dugong image is downloaded from the Docker Hub servers to the host, and in the second, a container is created on the host machine with the default Dugong installation. If the host machine is a Linux, the following commands must be performed in the terminal:

```
docker pull dugong/dugong
docker run -d -p 5901:5901 -p 6901:6901 --name Dugong -h Dugong -v $HOME/dugong/:/data/ \
--privileged dugong/dugong
```

At the end of the commands a Dugong instance will be available in the container named Dugong. Details about the container can be obtained through the command below:

```
docker ps
```
The default installation version of Dugong is DugongGUI with Xfce4. To change the installed version simply add one of the tags in the deploy command: ***xfce4***, ***icewm*** or ***cmd***.

Install DugongGUI Xfce4:

```
docker run -d -p 5901:5901 -p 6901:6901 --name DugongGUI -h DugongGUI -v $HOME/dugong/:/data/ \
--privileged dugong/dugong:xfce
```

Install DugongGUI iceWM:

```
docker run -d -p 5901:5901 -p 6901:6901 --name DugongGUI -h DugongGUI -v $HOME/dugong/:/data/ \
--privileged dugong/dugong:icewm
```

Install DugongCMD:

```
docker run -d -p 3000:3000 --name DugongCMD -h DugongCMD -v $HOME/dugong/:/data/ \
--privileged dugong/dugong:cmd
```

Access to the Dugong container can be done in a variety of ways, with access through the simplest Docker console. This access will not be of great attraction to the user and should be used only in case of problems during the execution of Dugong and for the analysis of problems with the container. Through this access the user can restart Linux services, analyze system and application logs, among other functions.

To access the Docker console and access Dugong's bash, simply run the following command on the Linux terminal on your host machine:

```
docker exec -it Dugong /bin/bash
```

Two other methods for accessing DugongGUI is through VNC or noVNC. Ports 6901 and 5901 are respectively the VNC and noVNC execution ports. These ports are specified during container creation on the host machine and can be changed as per Docker documentation.

To access noVNC it is enough that the user directs his navigator to the address below, after starting the Dugong container. The default password for noVNC access is ***vncpassword*** and can be changed at any time. The default DugongGUI user is the ***dugong*** with the ***dugong*** password.

```
http://<IP or Host>:<port>/vnc_auto.html?password=vncpassword
```

A client is required for Dugong access through the VNC protocol. During the tests, the VNC® Viewer for Google Chrome application was used in the Chrome Web Store.

For access to DugongCMD the user can use an SSH client of his choice. We also provide access through the tty application, requiring only that the user direct their browser to the address below followed by port 3000. The default DugongCMD user is the ***dugong*** with the ***dugong*** password.

```
http://<IP or Host>:3000
```

## Video installation:

- Click to watch the installation of ***DugongGUI*** on ***Linux Ubuntu Server***:

[![Watch the video](https://raw.githubusercontent.com/fabianomenegidio/dugong-bioinformatics/master/.misc/Screenshot%202017-05-08%20at%2021.49.05.png)](http://showterm.io/2920acd0725f9fe78d3e5)

- Click to watch the installation of ***DugongGUI*** on ***Linux CentOS 7*** in the [CloudatCost](http://cloudatcost.com/) provider:

[![Watch the video](https://raw.githubusercontent.com/fabianomenegidio/dugong-bioinformatics/master/.misc/Screenshot%202017-05-10%20at%2006.30.41.png)](http://showterm.io/b521d2099d4e440461167#fast)


- Click to watch the installation of ***DugongCMD*** on ***Linux Ubuntu Server***:

[![Watch the video](https://raw.githubusercontent.com/fabianomenegidio/dugong-bioinformatics/master/.misc/Screenshot%202017-05-08%20at%2022.00.42.png)](http://showterm.io/65f18305c3a1dc80d7a2a)

- Click to watch the installation of ***DugongCMD*** on ***Linux CentOS 7*** in the [CloudatCost](http://cloudatcost.com/) provider:

[![Watch the video](https://raw.githubusercontent.com/fabianomenegidio/dugong-bioinformatics/master/.misc/Screenshot%202017-05-08%20at%2022.00.42.png)](http://showterm.io/65f18305c3a1dc80d7a2a)

## Extending or adapting the Dugong image

Dugong can be expanded or adapted to the most diverse needs in a research or teaching environment. All Dugong environment configuration scripts are available in the Git Hub (https://github.com/fabianomenegidio/dugong), including Dockerfile for building your image.

![line](http://skstroi.ru/wp-content/uploads/2016/05/foot-line.png)

![Docker](https://static1.squarespace.com/static/513914cde4b0f86e34bbb954/t/58409793bebafb1c4cfe75e3/1480628120385/DockerBanner.png)

## Author

Current development is led by Fabiano Menegidio.

## Contributing

You are invited to contribute new features, fixes, or updates, large or small; we are always thrilled to receive pull requests, and do our best to process them as fast as we can.

Before you start to code, we recommend discussing your plans through a GitHub issue, especially for more ambitious contributions. This gives other contributors a chance to point you in the right direction, give you feedback on your design, and help you find out if someone else is working on the same thing.

## MIT License

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

***The software is provided "as is", without warranty of any kind, express or implied, including but not limited to the warranties of merchantability, fitness for a particular purpose and noninfringement. in no event shall the authors or copyright holders be liable for any claim, damages or other liability, whether in an action of contract, tort or otherwise, arising from, out of or in connection with the software or the use or other dealings in the software.***


## Learn More

![QRCode](https://raw.githubusercontent.com/fabianomenegidio/dugong-bioinformatics/master/.misc/qrcode.png)

[![DOI](https://zenodo.org/badge/88288867.svg)](https://zenodo.org/badge/latestdoi/88288867)
