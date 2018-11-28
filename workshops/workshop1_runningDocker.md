# Workshop 1: Using docker images

- Jimmy Breen (jimmy.breen@adelaide.edu.au)
    - South Australian Health and Medical Research Institute (SAHMRI) & University of Adelaide

- Jan Buchmann (jan.buchmann@sydney.edu.au)
    - University of Sydney

## Introduction

Docker containers can also be used to run specific applications that are completely separate from your local environment, and because of this, they can be invaluable in  This can be used for user testing or for creating specialised environments that serve specific purposes. For example, if I need to run something on a package that was designed for an earlier version of R, I could create a specific docker image that I can call specific functions on the fly.

In this workshop we will:
1. Learn how to pull docker images from dockerhub
2. Detail important docker commands
3. Run an example which uses multiple tools within docker images in a pipeline; and,
4. Run `Rstudio` over the web from within a docker container

## Dockerhub

### Pull a repository

Much like a code repository such as github (https://github.com/) or bitbucket (https://bitbucket.org), Docker Hub is a cloud-based registry service which allows you to link to code repositories, build your images and test them. It is also centralised resource for container development, collaboration, and more importantly, discovery.

In much the same fashion of being able to pull code from a git repository and build a tool for running a program, using docker commands you are able to pull a image and initialise that as a docker container locally. A simple example is to pull the latest ubuntu docker image from dockerhub:

    ubuntu@docker-test:~$ docker pull ubuntu
    Using default tag: latest
    latest: Pulling from library/ubuntu
    ...

Once an image is pulled, we will be able to see that image being run on our machine:

    ubuntu@docker-test:~$ docker images
    REPOSITORY              TAG                 IMAGE ID            CREATED             SIZE
    ubuntu                  latest              cd6d8154f1e1        7 hours ago         84.1MB

Here we can see that we pulled the image (ID = cd6d8154f1e1) from the ubuntu repository and that its currently running on our local machine. Now we have the container installed, we can run commands on that particular file system.

### Execute docker commands

 Given that this is a generic ubuntu image, lets just run a regular bash command that prints the address of our current working directory:

    ubuntu@docker-test:~$ docker run -ti ubuntu /bin/bash -c "echo Our base directory within the container is && echo `pwd`"
    Our base directory within the container is
    /home/ubuntu

## Usage Case: Using docker containers in a pipeline

In this first example, we will pull down docker images from tool developers and use them within a bash script that maps sequence reads to the genome we provide using `bwa`, and then mark duplicates using `picard-tools`.

## Setup

Using the dockerhub website (https://hub.docker.com) we need to pull two images that we can use for our pipeline. These can be version specific, but for now we will use the latest version of both tools.

    # Pull latest docker containers for bwa, picard and samtools
    docker pull lh3lh3/bwa
    docker pull broadinstitute/picard
    docker pull comics/samtools

So we should now have two docker images running on the Nectar VM:

    # Check the status of all docker containers on the VM
    docker images

Now we can use these images with some files that we've included. You will need to download the link using `wget` (we'll do that in the script). The pipeline will firstly index the reference genome, then 

    #!/bin/bash

    bwa="docker run -v `pwd`:/tmp -w /tmp lh3lh3/bwa"
    picard="docker run --rm broadinstitute/picard"
    samtools="docker run -it comics/samtools samtools"
    
    wget -c "https://universityofadelaide.box.com/shared/static/g5dl4tbkrrpphr8t9ssmh09qxxr4g7ft.gz" -O "SRR7726416.fastq.gz"
    wget -c "https://universityofadelaide.box.com/shared/static/igqgwaqqi32mxo3ox7n6kz84jfz8cxwp.fas" -O "TAIR10_chr_all.fas"

    # Fetch the data that we'll need to run
    # - we've prepared this beforehand to reduce

    ${bwa} index -p Athaliana TAIR10_chr_all.fas
    zcat SRR7726416.fastq.gz | ${bwa} mem Athaliana /dev/stdin | \
        ${samtools} view -bhS - > SRR7726416_Athal.bam
    ${samtools} sort -o SRR7726416_Athal.sorted.bam SRR7726416_Athal.bam

    ${picard} MarkDuplicates I=SRR7726416_Athal.sorted.bam \
        O=SRR7726416_Athal.sorted.markdup.bam \
        REMOVE_DUPLICATES=false \
        M=SRR7726416_Athal.metrics.txt

---

## Usage Case: Running `RStudio` in a docker container


Here we will pull an image containing RStudio and run it over a website. This is very helpful when running workshops with large groups of students or researchers.

### Setup

Firstly, we will need to change our Nectar VM settings to allow traffic through port 8787. This is the port in which rstudio runs:
- On the left hand-side of the Nectar Cloud Dashboard, select the tab "Network" and sub-tab "Security Groups"
- Click on "Add Security Group" near the top of the page and name the new group "RStudio"
- On the new Security Group, click the "Manage Rules" and then "Add Rule"
- Add "8787" to the port range and click "Add" (All options should be: Custom TCP Rule - Ingress - Port - 8787 - CIDR - 0.0.0.0/0 - IPv4)
- Go back to your VM settings and add the new security group. To do this, on the left hand-side of the Nectar Cloud Dashboard, go to "Compute" and then click on "Instances". You should see your active instance. In the "Actions" column click the down arrow and then choose "Edit Security Groups", and then add the new "Rstudio" group to the right hand side of the screen (active groups).

### Pull and launch

We've now activated Rstudio to run on our VM. Now all we need to do is pull the rstudio image from dockerhub and then start the Rstudio app.

    # Pull Rstudio docker image from the rocker project
    docker pull rocker/rstudio

    # Run the studio app (username is "rstudio" and password is "rockerstudio")
    docker run -d -p 8787:8787 -e ROOT=TRUE -e PASSWORD=rockerstudio rocker/rstudio

Open up a web-browser and connect to the Rstudio by adding ":8787" to the end of your IP address that you used to connect to the virtual machine. e.g. http://43.240.96.146:8787
