
# ABACBS 2018 Container Workshop

Date: November 29, 9am-12:30pm
University of Melbourne

Run by:
- Jan Buchmann (jan.buchmann@sydney.edu.au): University of Sydney
- Jimmy Breen (jimmy.breen@adelaide.edu.au): South Australian Health and Medical Research Institute (SAHMRI) &
University of Adelaide

## Requirements:

- Laptop with administrative privileges
- Installed [Docker](https://store.docker.com/search?type=edition&offering=community) and [Singularity](https://www.sylabs.io/singularity/get-singularity/)
- Experience with the command-line of your OS (examples are shown in Linux)
- Familiarity with git and ssh
- If possible, a [Nectar](https://dashboard.rc.nectar.org.au/) login

# Timetable

Honeetly, times may vary. Consider this an outline.

Block | Time        | Topic          | Who
----- |-------------|----------------|---------------
0     |09:00-09:30  | Setup          | Jimmy and Jan
1     |09:30-10:00  | Docker I       | Jimmy
2     |10:00-10:30  | Docker II      | Jimmy
Break |10:30-11:00  |                |
3     |11:00-11:15  | Singularity I  | Jan
4     |11:15-11:30  | Singularity II | Jan
5     |11:30-12:30  | Roll your own  | Jimmy and Jan


## Outline

9am (30mins): Setup
- Configuring Nectar Virtual Machine for workshop
  - Setting Security Groups

9:30am: Introduction to Docker
- Short history of containerisation
- Technicalities
- Advantages and disadvantages
    - Reproducible pipelines
    - Static environments
    - Distribution within the cloud

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
- Run simple BLAST pipeline (`efetch`, `makeblastdb`, `blastn`) to search 10 virus genomes

12:00pm: "Bring your own pipeline"
- Split group into two groups and work on two separate pipeline themes

12:30pm: Workshop end

