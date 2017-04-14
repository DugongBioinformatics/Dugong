[![DOI](https://zenodo.org/badge/20420/menegidio/avidafull.svg)](https://zenodo.org/badge/latestdoi/20420/menegidio/avidafull)

# Digital Evolution Platform

[Docker Avida](https://hub.docker.com/r/bigscience/avida/) is the junction of two softwares:

***Avida*** is a free, open source scientific software platform for conducting and analyzing experiments with self-replicating and evolving computer programs. It provides detailed control over experimental settings and protocols, a large array of measurement tools, and sophisticated methods to analyze and post-process experimental data. Avida was created by Charles Ofria (@mercere99). Current development is led by David M. Bryson (@brysonda).

***Docker*** is an open-source project that automates the deployment of applications inside software containers, by providing an additional layer of abstraction and automation of operating-system-level virtualization on Linux. Docker uses the resource isolation features of the Linux kernel such as cgroups and kernel namespaces, and a union-capable filesystem such as aufs and others to allow independent "containers" to run within a single Linux instance, avoiding the overhead of starting and maintaining virtual machines.

### Images:

![Avida](http://i.imgur.com/oj80eRg.png)

![Avida](http://i.imgur.com/vLZYCds.png)

![Avida](http://i.imgur.com/zYn9EYC.png)

![Avida](http://i.imgur.com/t8SF3C8.png)


## Getting started:

Automated builds of the image are available on [Dockerhub](https://hub.docker.com/r/bigscience/avida/) and is the recommended method of installation.

[Docker Avida FULL](https://hub.docker.com/r/bigscience/avida/) contains only the basic installation of Avida and Avida-Viewer. Also features SSH access, tty.js (web terminal) and [Showterm](http://showterm.io/) (software to record your terminal).

Pull a Avida container:

```bash
docker pull bigscience/avida-full
```

Start a Avida container:

```bash
docker run -di --name avida-full  -h avida-full \
-p 2222:22 \
-p 3000:3000 \
bigscience/avida-full
```

Connect in a Avida container:

```bash
docker exec -ti avida-full /bin/bash
```

## tty.js - Your web terminal

A terminal in your browser using node.js and socket.io. Based on Fabrice Bellard's vt100 for jslinux.

![ttyjs](http://i.imgur.com/Qbg6g0o.png)
![ttyjs](http://i.imgur.com/qAIGGSi.png)
![ttyjs](http://i.imgur.com/QKhL7j0.png)

Multiple terminal

![ttyjs](http://i.imgur.com/Pj7x9Bn.png)


## Recording terminal with Showterm

***Showterm*** is an open source terminal record and upload application that lets you easy to record how-to in your terminal. It will record all your terminal activity in text-base and upload to showterm.io as a video and then generates a link for you to share with your team-mates or embed it in your website as an iframe. 

The syntax to start recording is “showterm [program to run]“. If you omit the program to run and just type in “showterm“.

```# showterm```

It’ll start recording your shell. Once you are done recording, you can stop it by typing in either exit or “Ctrl­D“.

Once you type exit it will record and upload your actions. When finished upload, it will generate a link at the end of each recording which you can share.

```
# showterm recording finished.
Uploading...
http://showterm.io/9d34dc53ab91185448ef8
```

### Contributing

You are invited to contribute new features, fixes, or updates, large or small; we are always thrilled to receive pull requests, and do our best to process them as fast as we can.

Before you start to code, we recommend discussing your plans through a GitHub issue, especially for more ambitious contributions. This gives other contributors a chance to point you in the right direction, give you feedback on your design, and help you find out if someone else is working on the same thing.

### Author

Current development is led by Fabiano Menegidio.

### Cite as

Menegidio, FB. (2016). Docker Avida Full 1.0. Zenodo. 10.5281/zenodo.46047
