[![DOI](https://zenodo.org/badge/88288867.svg)](https://zenodo.org/badge/latestdoi/88288867)

![Dugong](https://raw.githubusercontent.com/fabianomenegidio/dugong-bioinformatics/gh-pages/.misc/dugongo.png)

# Dugong - Scientific Linux Container

[Dugong](https://hub.docker.com/r/dugong/dugong) is a powerful workstation platform especially designed for scientific computational analysis, mainly of bioinformatics and computational biology, that can be installed in any computational ecosystem, regardless of the operating system and hardware used. In general terms, it's a [Linux system](https://en.wikipedia.org/wiki/Linux) designed specifically for the development of the [Open Science](https://en.wikipedia.org/wiki/Open_science) concept, based on the reproducibility and replicability of the research.

It's an implementation built under the [MIT license](https://opensource.org/licenses/MIT) using the [Docker platform](https://www.docker.com/), an open-source project that automates the implementation of applications within software containers, providing an additional layer of abstraction and automation of operating system-level virtualization on [Linux](https://en.wikipedia.org/wiki/Linux). [Docker](https://www.docker.com/) uses the [Linux kernel](https://en.wikipedia.org/wiki/Linux_kernel) resource isolation features, such as [cgroups](https://en.wikipedia.org/wiki/Cgroups) and [namespaces](https://en.wikipedia.org/wiki/Linux_namespaces), as well as the file system [AuFS](https://en.wikipedia.org/wiki/Aufs) (advanced multi layered unification filesystem) to allow independent *containers* to run in a single Linux instance, avoiding an overload of initialization and maintenance of virtual machines. The [Dugong project](https://hub.docker.com/r/dugong/dugong) enables efficient creation of reusable containers for bioinformatics data, making the analysis environment and all computational results reproducible by the scientific community.

[Dugong](https://hub.docker.com/r/dugong/dugong) is based on version 16.04 of [Ubuntu Image](https://hub.docker.com/r/_/ubuntu), the only [Docker system](https://www.docker.com/) focused on bioinformatics that provides users with a complete graphical user interface (GUI) [XFCE4](https://xfce.org/), independent of the host, which should facilitate user interaction with different computing ecosystems, as well as the installation and use of different bioinformatics software. For the distribution of bioinformatics software, two large open source projects have been integrated [Dugong](https://hub.docker.com/r/dugong/dugong): [LinuxBrew](http://linuxbrew.sh/) and [BioConda](https://bioconda.github.io/), totaling over **3,500 bioinformatics packages** and their respective dependencies. [Dugong](https://hub.docker.com/r/dugong/dugong) is the only system focused on bioinformatics that offers [Anaconda Navigator](https://docs.continuum.io/anaconda/navigator/), a graphical package manager for [Conda](https://conda.io/docs/) and the [BioConda](https://bioconda.github.io/) repository, allowing the installation of packages and tools through its graphical interface. We also added, as an alternative, the [BioLinux](http://environmentalomics.org/bio-linux/) and [CloudBioLinux](http://cloudbiolinux.org/) project repositories for the installation of [DEB packages](https://en.wikipedia.org/wiki/Deb_(file_format)) through the APT command.

Thinking about the replicability and reproducibility of different lines of research that benefit from bioinformatics analysis, [Dugong](https://hub.docker.com/r/dugong/dugong) is the only tool of its kind that provides [Jupyter Notebook](http://jupyter.org/) installed by default on all their versions. 

All of these features, among others, make [Dugong](https://hub.docker.com/r/dugong/dugong) one of the most complete [Docker](https://www.docker.com/) desktop environments available today, and allow any user with minimal computing knowledge to run a [Dugong](https://hub.docker.com/r/dugong/dugong) container in [high performance computing](https://en.wikipedia.org/wiki/Supercomputer) (HPC) environments, [Virtual Private Server](https://en.wikipedia.org/wiki/Virtual_private_server) (VPS), as well as in private, public, or hybrid [cloud computing](https://en.wikipedia.org/wiki/Cloud_computing) environments of different commercial service providers.

The [Dugong project](https://hub.docker.com/r/dugong/dugong) is publicly committed to the principles of open source software development, where people are encouraged to use free software, study how they function, improve and distribute them freely.

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

![Dugong](https://raw.githubusercontent.com/DugongBioinformatics/dugongbioinformatics.github.io/master/.misc/Dugong%20-%20images%20paper.png)

Through the simple Docker Client commands, the user can download the Dugong images **(a)**, and install and manage the containers generated using the Docker Daemon on the host computer **(b)**. The Dugong image is currently available in Docker Hub **(c)**, containing more than 3000 bioinformatics software and its dependencies thanks to the integration of the BioConda and LinuxBrew projects **(d)**. 

Among the software that can be installed in Dugong, and enjoy its graphical interface XFCE4, are: Blast2GO, UGene, Apache Taverna, Integrative Genomics Viewer (IGV), Mauve, RStudio, Cytoscape, QIIME **(e)**, among others. Some of these software are already functional in a Dugong image in our GitHub repository.

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

## Test Dugong NOW!

To test the operation of Dugong and demonstrate the ease of use and the possibility of using the service in different operating systems and platforms we provide some installation templates on dply.co's servers.

**dply.co** allows the creation of an absolutely free server for two hours, and can be used for a longer time for payment. If you choose not to buy more time for the server, it is deleted automatically after 2 hours without any charge.

dply.co servers are hosted in the DigitalOcean cloud and have the following specifications:

1 CPU
512MB RAM
20GB Disk
We currently offer the following operating systems: CentOS 6, CentOS 7, Debian 7, Debian 8, Fedora 24, Fedora 25, Ubuntu 14.04, Ubuntu 16.04.

Test the Dugong on a machine with Ubuntu 16.04 by clicking the button:

[![Dply](https://dply.co/b.svg)](https://dply.co/b/mekdDIAk)

Learn more about Dply and other ways to test Dugong on other operating systems by [clicking here](https://github.com/DugongBioinformatics/Dply/blob/master/README.md).

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

## How to cite

Menegidio, F.B. et al. (2018). Dugong: a Docker image, based on Ubuntu Linux, focused on reproducibility and replicability for bioinformatics analyses. Bioinformatics 34(3):514-515. doi: 10.1093/bioinformatics/btx554.

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

For more information about Dugong, visit the [project page](https://dugongbioinformatics.github.io).
