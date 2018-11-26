# ABACBS 2018 Container Workshop

This workshop is intended to introduce you into the common containers used in
bioinformatics, Docker and Singularity.

## Requirements:
- Laptop with administrative privileges
- Installed Docker [0] and Singularity [1]
- Experience with the command-line of your OS (the examples are shown in Linux)
- Familiarity with git and ssh

[0](https://store.docker.com/search?type=edition&offering=community])
[1]()
# Important links:
 - [Workshop](https://git..)
 - [Docker](..)
 - [Singularity]()

# Timetable
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
Creating RAxML Singualrity image

### Roll your own
- Split group into two groups and work on two separate pipeline themes

jan@salk:~/courses/2018_ABACBS_workshop/course/ABACBS_workshop_prep/work$ singularity run -B ~/courses:/project  -B /tmp:/scratch raxml.simg -p 314156 -m GTRCAT -T 2 -N 10  -s /project/2018_ABACBS_workshop/course/ABACBS_workshop_prep/work/h3n2-ha.muscle.fa  -n aln.raxml

sudo singularity -v run -B /tmp:/tmp sing-252.simg build /tmp/raxml.simg252 raxml.ubuntu.singularit
