# ABACBS 2018 Container Workshop

This workshop is intended to introduce you to the two containerization commonly 
used in bioinformatics, Docker and Singularity.

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
0     |09:00-09:30  | Setup          | James and Jan
1     |09:30-10:00  | Docker I       | James
2     |10:00-10:30  | Docker II      | James
Break |10:30-11:00  |                |
3     |11:00-11:15  | Singularity I  | Jan
4     |11:15-11:30  | Singularity II | Jan
5     |11:30-12:30  | Roll your own  | James and Jan


## Topics:

### Setup:
- Download workshop repository
  - Nectar VM setup
  - Installation of Docker and Singularity on Nectar

### Docker I

- Introduction to Docker
  - Technicalities
  - Advantages and disadvantages

### Docker II

  - Using docker for pipeline management
  - Define a simplified pipeline

### Singularity I
  - Introduction to Singularity
  - Singularity vs. Docker

### Singularity II
- Creating RAxML Singualrity image and corresponding PBS to run on an HPC

### Roll your own
- Turn your pipeline into a container or image