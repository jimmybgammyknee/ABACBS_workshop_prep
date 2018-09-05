
# Containerisation workshop

- ABACBS Day 4 (29th November - 9:00am -> 12:30pm)
- University of Melbourne

## Course Structure & Outline

9am (30mins): Setup
- Download workshop repository
    - Course materials and data
- Nectar VM setup
    - Login with University credentials
    - Create keypair for Login or add your own ssh key
    - Turn on ssh security group
    - Spin up and ssh in
- Installation of docker and singularity
    - Linux (ubuntu) on the Nectar Cloud

    # Install build stuff
    sudo apt-get update && sudo apt-get install git python dh-autoreconf build-essential libarchive-dev

    # Install Docker
    wget -qO- https://get.docker.com/ | sh
    sudo adduser jimmy
    sudo usermod -aG docker jimmy
    sudo usermod -aG docker ubuntu

    # Install singularity (for later)
    # Install
    VER=2.5.2
    wget https://github.com/singularityware/singularity/releases/download/$VER/singularity-$VER.tar.gz
    tar xvf singularity-$VER.tar.gz
    cd singularity-$VER
    ./configure --prefix=/usr/local --sysconfdir=/etc
    make
    sudo make install

9:30am: Introduction to Docker (Jimmy)
- Short history of Containerisation
- Technicalities
- Advantages and disadvantages
    - Reproducible pipelines
    - Static environments
    - Easy distribution within the cloud

---
**Note:** If you have a pipeline that you would like to containerise, let us know in the break because at 12pm we will break into two groups based on pipeline category
    - For example: One group could be running pipeline for variant calling (qc, mapping, duplicate removal, variant calls), and one group could be running RNA transcript quantification (trimming, `kallisto/salmon` or `STAR` and `featureCounts` for quantification)
---

10am: Workshop 1: Using docker for pipeline management (Jimmy)
- Explain `dockerhub` and show pulling an image
    - Define the simplified pipeline that we have put on a docker image (on dockerhub)
    - Explaining commands - cheatsheet
- Running a pipeline from a

10:30am - Break

11am: Introduction to Singularity and dockers on HPC (Jan)
- Singularity vs docker
- Converting docker containers
- Working with queuing systems (PBS, Slurm)

11:15am: Creating a docker/singularity pipeline from scratch (Jan)
- Simple BLAST pipeline (`efetch`, `makeblastdb`, `blastn`) to search 10 virus genomes
-

12:00pm: Bring your own pipelines
- Split group into two groups and work on two separate pipeline themes

12:30pm: Workshop end

## Resources

### Basic Containerisation resources
- Dockerhub (https://hub.docker.com/)
- Singularity container registry (https://singularity-hub.org/)

### Cheatsheet
