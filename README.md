
# ABACBS Workshop: Docker Containers and Singularity Images

Date: November 29, 9am-12:30pm
University of Melbourne

Run by:
- Jan Buchmann (jan.buchmann@sydney.edu.au): University of Sydney
- Jimmy Breen (jimmy.breen@adelaide.edu.au): South Australian Health and Medical Research Institute (SAHMRI) & University of Adelaide

## Quick setup

**NOTE**: _REGARDING NECTAR: To run the first docker example (bwa/samtools etc) you will need a reasonably large VM_

        ## Move to a larger area of the file system
        sudo chown -R ubuntu:ubuntu /mnt
        cd /mnt

        ### Install build stuff
        sudo apt-get update && \
        sudo apt-get install git python dh-autoreconf \
            build-essential libarchive-dev python-pip vim

        # Pygame and numpy are needed for Singularity
        pip install pygame
        pip install numpy

        ### Install Docker
        wget -qO- https://get.docker.com/ | sh
        sudo usermod -aG docker ubuntu
        newgrp docker

        #### Install Singularity 2.5.2
        VER=2.5.2
        wget https://github.com/singularityware/singularity/releases/download/$VER/singularity-$VER.tar.gz
        tar xvf singularity-$VER.tar.gz
        cd singularity-$VER
        ./configure --prefix=/usr/local --sysconfdir=/etc
        make
        sudo make install

        #### Install Singularity  3
        #### Follow the steps described on (https://github.com/sylabs/singularity.git)

        # Install cromwell jar executables for workflows
        mkdir -p /mnt/cromwell
        wget -c https://github.com/broadinstitute/cromwell/releases/download/36/cromwell-36.jar -O "/mnt/cromwell/cromwell-36.jar"
        wget -c https://github.com/broadinstitute/cromwell/releases/download/36/womtool-36.jar -O "/mnt/cromwell/womtool-36.jar"

## Outline

Docker containers allow you to test and distribute simple and complex pipelines. You can write pipelines with different dependencies without the need to install them on your machine. Users can then pull your pipelines or tools and start using them without having to worry about dependencies or adventurous installation instructions. If your tool or pipeline can run on a HPC cluster, you can also deploy them as Singularity images, a more secure variant of docker containers. The workshop will introduce you to Docker Containers and Singularity Images. You will learn how to create, run, and distribute them using typical biological tasks as examples. Participants are invited to bring their own pipelines they wish to "Dockerize" in the last part of the workshop.

## Run down

9am (30mins): Setup
- Configuring Nectar Virtual Machine for workshop
  - Setting Security Groups

9:30am: Introduction to Docker

[https://gitpitch.com/jimmybgammyknee/ABACBS_workshop_prep/master?grs=github](https://gitpitch.com/jimmybgammyknee/ABACBS_workshop_prep/master?grs=github#/3)

---
**Note:** If you have a pipeline that you would like to containerise, let us know in the break because at 12pm we will break into two groups based on pipeline category
- For example: One group could be running pipeline for variant calling (qc, mapping, duplicate removal, variant calls), and one group could be running RNA transcript quantification (trimming, `kallisto/salmon` or `STAR` and `featureCounts` for quantification)
---

10am: Workshop 1: Using docker for pipeline management
- Using Dockerhub to run local docker images
- Running a pipeline using multiple docker images
- Running `RStudio` in docker over the web

10:30am - Break

11am: Introduction to Singularity and dockers on HPC
- Singularity vs docker
- Converting docker containers
- Working with queuing systems (PBS, Slurm)

11:15am: Workshop 2: Creating a docker/singularity pipeline from scratch
- Building docker and singularity containers
- Build a RAxML image for HPC use

12:00pm: "Bring your own pipeline"

12:30pm: Workshop end

### Basic Containerisation resources
- Dockerhub (https://hub.docker.com/)
- Singularity container registry (https://singularity-hub.org/)
