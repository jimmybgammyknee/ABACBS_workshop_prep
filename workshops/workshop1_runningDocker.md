# Workshop 1: Using docker images

Jimmy Breen (jimmy.breen@adelaide.edu.au)
South Australian Health and Medical Research Institute (SAHMRI) &
University of Adelaide

Jan Buchmann (jan.buchmann@sydney.edu.au)
University of Sydney

Docker containers can also be used to run specific applications that are completely separate from your local environment, and because of this, they can be invaluable in  This can be used for user testing or for creating specialised environments that serve specific purposes. For example, if I need to run something on a package that was designed for an earlier version of R, I could create a specific docker image that I can call specific functions on the fly.

In this workshop we will:
1. Show an example use case of running multiple tools within docker images in a pipeline; and,
2. Running Rstudio over the web from within a docker container

## Usage Case: Using docker containers in a pipeline

In this first example, we will pull down docker images from tool developers and use them within a bash script that maps sequence reads to the genome we provide using `bwa`, and then mark duplicates using `picard-tools`.

## Setup

Using the dockerhub website (https://hub.docker.com) we need to pull two images that we can use for our pipeline. These can be version specific, but for now we will use the latest version of both tools.

    # Pull latest bwa docker container from Heng Li's docker repo
    docker pull lh3lh3/bwa

    # Pull the latest version of the broad institutes picard tools
    docker pull broadinstitute/picard
    docker pull comics/samtools

So we should now have two docker images running on the Nectar VM:

    # Check the status of all docker containers on the VM
    docker images

Now we can use these images with some files that we've included in this workshops repository. The pipeline will firstly index the reference genome

    #!/bin/bash

    bwa="docker run -v `pwd`:/tmp -w /tmp lh3lh3/bwa"
    picard=
    samtools="docker run -it comics/samtools samtools"

    genome=${HOME}/data/TAIR_chr_all.fas
    sample=${HOME}/data/SRR7726416.fastq.gz

    ${bwa} index -p Athaliana ${genome}
    zcat ${sample} | ${bwa} mem Athaliana /dev/stdin | \
        ${samtools} view -bhS - > SRR7726416_Athal.bam
    ${samtools} sort -o SRR7726416_Athal.sorted.bam SRR7726416_Athal.bam

    ${picard} MarkDuplicates I=SRR7726416_Athal.sorted.bam \
        O=SRR7726416_Athal.sorted.markdup.bam \
        

---

## Usage Case: Running Rstudio in a docker container


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
