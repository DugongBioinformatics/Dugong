[![DOI](https://zenodo.org/badge/88288867.svg)](https://zenodo.org/badge/latestdoi/88288867)

![Dugong](https://github.com/fabianomenegidio/dugong-bioinformatics/blob/master/.misc/dugongo.png)

# Dugong - Scientific Linux Container

[Dugong](https://hub.docker.com/r/bigscience/dugongo/) is a powerful workstation platform especially designed for scientific computational analysis, mainly of bioinformatics and computational biology, that can be installed in any computational ecosystem, regardless of the operating system and hardware used. In general terms, it is a Linux operating system designed specifically for the development of the [Open Science](https://en.wikipedia.org/wiki/Open_science) concept, based on the reproducibility and replicability of the research.

It's an implementation built under the MIT license using the Docker platform, an open-source project that automates the implementation of applications within software containers, providing an additional layer of abstraction and automation of operating system-level virtualization on Linux. Docker uses the Linux kernel resource isolation features, such as cgroups and namespaces, as well as the file system AuFS (advanced multi layered unification filesystem) to allow independent "containers" to run In a single Linux instance, avoiding an overload of initialization and maintenance of virtual machines. The Dugong project enables efficient creation of reusable containers for bioinformatics analysis, making the analysis environment and all computational results reproducible by the scientific community.

Dugong is based on version 16.04 of the Ubuntu image (https://hub.docker.com/r/_/ubuntu), a Linux operating system inspired by the Debian distribution. The Ubuntu project is publicly committed to the principles of open source software development, where people are encouraged to use free software, study how they function, improve and distribute them freely. 

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

Dugong - VNC access:

![Dugong](http://i.imgur.com/r9LdKlx.png)

Dugong - Web VNC access (noVNC) and Linuxbrew:

![Dugong](http://i.imgur.com/r6X6Lxa.png)

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

## Deploy and access Dugong

The Docker project provides a public cloud called the [Docker Hub](https://hub.docker.com) for sharing the developed containers. This cloud allows access to the application in a centralized and simple way, that is, it is possible to obtain a complete Dugong environment with command lines for its implementation.

To start a container, the user must have Docker installed on his operating system, according to the tutorials available in the project documentation. The Dugong image is available in the [Docker Hub](https://github.com/fabianomenegidio/dugong-bioinformatics) and its use is the recommended method of installation.

Two steps are required to start a container containing Dugong. In the first step, the Dugong image is downloaded from the Docker Hub servers to the host, and in the second, a container is created on the host machine with the default Dugong installation. If the host machine is a Linux, the following commands must be performed in the terminal:

```
docker pull bigscience/dugong
docker run -d -p 5901:5901 -p 6901:6901 --name Dugong -h Dugong --privileged bigscience/dugong
```

At the end of the commands a Dugong instance will be available in the container named Dugong. Details about the container can be obtained through the command below:

```
docker ps
```
The default installation version of Dugong is DugongGUI with Xfce4. To change the installed version simply add one of the tags in the deploy command: ***xfce4***, ***icewm*** or ***cmd***.

Install DugongGUI Xfce4:

```
docker run -d -p 5901:5901 -p 6901:6901 --name DugongGUI -h DugongGUI --privileged bigscience/dugong:xfc4
```

Install DugongGUI iceWM:

```
docker run -d -p 5901:5901 -p 6901:6901 --name DugongGUI -h DugongGUI --privileged bigscience/dugong:icewm
```

Install DugongCMD:

```
docker run -d -p 3000:3000 --name DugongCMD -h DugongCMD --privileged bigscience/dugong:cmd
```

Access to the Dugong container can be done in a variety of ways, with access through the simplest Docker console. This access will not be of great attraction to the user and should be used only in case of problems during the execution of Dugong and for the analysis of problems with the container. Through this access the user can restart Linux services, analyze system and application logs, among other functions.

To access the Docker console and access Dugong's bash, simply run the following command on the Linux terminal on your host machine:

```
docker exec -it Dugong /bin/bash
```

Two other methods for accessing DugongGUI is through VNC or noVNC. Ports 6901 and 5901 are respectively the VNC and noVNC execution ports. These ports are specified during container creation on the host machine and can be changed as per Docker documentation.

To access noVNC it is enough that the user directs his navigator to the address below, after starting the Dugong container. The default password for noVNC access is ***vncpassword*** and can be changed at any time.

```
http://<IP or Host>:<port>/vnc_auto.html?password=vncpassword
```

A client is required for Dugong access through the VNC protocol. During the tests, the VNC® Viewer for Google Chrome application was used in the Chrome Web Store.

For access to DugongCMD the user can use an SSH client of his choice. We also provide access through the tty application, requiring only that the user direct their browser to the address below followed by port 3000. The default DugongCMD user is the ***docker*** with the ***docker*** password.

```
http://<IP or Host>:3000
```

## Extending or adapting the Dugong image

Dugong can be expanded or adapted to the most diverse needs in a research or teaching environment. All Dugong environment configuration scripts are available in the Git Hub (https://github.com/fabianomenegidio/dugong), including Dockerfile for building your image.

# Learn more about Docker 

[Docker](https://www.docker.com) is an open platform for developing, shipping, and running applications. Docker enables you to separate your applications from your infrastructure so you can deliver software quickly. With Docker, you can manage your infrastructure in the same ways you manage your applications. By taking advantage of Docker’s methodologies for shipping, testing, and deploying code quickly, you can significantly reduce the delay between writing code and running it in production.

Docker provides the ability to package and run an application in a loosely isolated environment called a container. The isolation and security allow you to run many containers simultaneously on a given host. Containers are lightweight because they don’t need the extra load of a hypervisor, but run directly within the host machine’s kernel. This means you can run more containers on a given hardware combination than if you were using virtual machines. You can even run Docker containers within host machines that are actually virtual machines!

Docker provides tooling and a platform to manage the lifecycle of your containers:

- Develop your application and its supporting components using containers.
- The container becomes the unit for distributing and testing your application.
- When you’re ready, deploy your application into your production environment, as a container or an orchestrated service. This works the same whether your production environment is a local data center, a cloud provider, or a hybrid of the two.

![Docker](https://www.docker.com/sites/default/files/Docker_Supply-chain-V1.5-01.png)


## Docker architecture

Docker uses a client-server architecture. The Docker client talks to the Docker daemon, which does the heavy lifting of building, running, and distributing your Docker containers. The Docker client and daemon can run on the same system, or you can connect a Docker client to a remote Docker daemon. The Docker client and daemon communicate using a REST API, over UNIX sockets or a network interface.

![Docker](https://docs.docker.com/engine/article-img/architecture.svg)

### The Docker daemon

The Docker daemon (dockerd) listens for Docker API requests and manages Docker objects such as images, containers, networks, and volumes. A daemon can also communicate with other daemons to manage Docker services.

### The Docker client

The Docker client (docker) is the primary way that many Docker users interact with Docker. When you use commands such as docker run, the client sends these commands to dockerd, which carries them out. The docker command uses the Docker API. The Docker client can communicate with more than one daemon.

### Docker registries
A Docker registry stores Docker images. Docker Hub and Docker Cloud are public registries that anyone can use, and Docker is configured to look for images on Docker Hub by default. You can even run your own private registry. If you use Docker Datacenter (DDC), it includes Docker Trusted Registry (DTR).

When you use the docker pull or docker run commands, the required images are pulled from your configured registry. When you use the docker push command, your image is pushed to your configured registry.

Docker store allows you to buy and sell Docker images or distribute them for free. For instance, you can buy a Docker image containing an application or service from a software vendor and use the image to deploy the application into your testing, staging, and production environments. You can upgrade the application by pulling the new version of the image and redeploying the containers.

## Docker objects

When you use Docker, you are creating and using images, containers, networks, volumes, plugins, and other objects. This section is a brief overview of some of those objects.

### Images

An image is a read-only template with instructions for creating a Docker container. Often, an image is based on another image, with some additional customization. For example, you may build an image which is based on the ubuntu image, but installs the Apache web server and your application, as well as the configuration details needed to make your application run.

You might create your own images or you might only use those created by others and published in a registry. To build your own image, you create a Dockerfile with a simple syntax for defining the steps needed to create the image and run it. Each instruction in a Dockerfile creates a layer in the image. When you change the Dockerfile and rebuild the image, only those layers which have changed are rebuilt. This is part of what makes images so lightweight, small, and fast, when compared to other virtualization technologies.

### Containers

A container is a runnable instance of an image. You can create, run, stop, move, or delete a container using the Docker API or CLI. You can connect a container to one or more networks, attach storage to it, or even create a new image based on its current state.

By default, a container is relatively well isolated from other containers and its host machine. You can control how isolated a container’s network, storage, or other underlying subsystems are from other containers or from the host machine.

A container is defined by its image as well as any configuration options you provide to it when you create or run it. When a container stops, any changes to its state that are not stored in persistent storage disappears.

### Services

Services allow you to scale containers across multiple Docker daemons, which all work together as a swarm with multiple managers and workers. Each member of a swarm is a Docker daemon, and the daemons all communicate using the Docker API. A service allows you to define the desired state, such as the number of replicas of the service that must be available at any given time. By default, the service is load-balanced across all worker nodes. To the consumer, the Docker service appears to be a single application. Docker Engine supports swarm mode in Docker 1.12 and higher.


## What can I use Docker for?

### Fast, consistent delivery of your applications

Docker streamlines the development lifecycle by allowing developers to work in standardized environments using local containers which provide your applications and services. Containers are great for continuous integration and continuous development (CI/CD) workflows.

Consider the following example scenario.

- Your developers write code locally and share their work with their colleagues using Docker containers.
- They use Docker to push their applications into a test environment and execute automated and manual tests.
- When developers find bugs, they can fix them in the development environment and redeploy them to the test environment for testing and validation.
- When testing is complete, getting the fix to the customer is as simple as pushing the updated image to the production environment.

### Responsive deployment and scaling

Docker’s container-based platform allows for highly portable workloads. Docker containers can run on a developer’s local laptop, on physical or virtual machines in a data center, on cloud providers, or in a mixture of environments.

Docker’s portability and lightweight nature also make it easy to dynamically manage workloads, scaling up or tearing down applications and services as business needs dictate, in near real time.

### Running more workloads on the same hardware

Docker is lightweight and fast. It provides a viable, cost-effective alternative to hypervisor-based virtual machines, so you can use more of your compute capacity to achieve your business goals. Docker is perfect for high density environments and for small and medium deployments where you need to do more with fewer resources.

## OBSERVATION

The information above about the Docker platform has been made available based on its documentation. You can find more details at: https://docs.docker.com/engine/docker-overview


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

[![DOI](https://zenodo.org/badge/88288867.svg)](https://zenodo.org/badge/latestdoi/88288867)
