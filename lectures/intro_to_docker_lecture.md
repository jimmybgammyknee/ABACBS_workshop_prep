
## Introduction to `Docker`

---

## Who are we?

- __Jan Buchmann__
    - Postdoc, University of Sydney
    - Research: Virus evolution

- __Jimmy Breen__
    - Bioinformatics Core Team Leader, SAHMRI
    - Senior Lecturer, University of Adelaide
    - Research: Reproductive Biology & Human Development

---

## Who are we?
⁠

- __Jimmy Breen__ == "Docker/Singularity User"

- __Jan Buchmann__ == "Docker/Singularity Developer"

---

## What is Docker?

---

## Containerisation: A brief history...

- Developed with help from Linux kernel developers.
- Developed a 'process containers' (renamed 'control groups') to control everything from single processes to whole-system virtualisation

```cgroups (abbreviated from control groups) is a Linux kernel feature that limits, accounts for, and isolates the resource usage (CPU, memory, disk I/O, network, etc.) of a collection of processes.```

---

## Containerisation: A brief history...

- Cgroups (further developed by Google engineers) provided:

    - Resource limitation and prioritisation: Some groups should not exceed a certain allocation of RAM, CPU etc

    - Measurement: How much was each cgroup using (for billing)

        - Full control over how and when it ran

---

## Containerisation: A brief history...

- Docker relies (or should I say _has relied_) on Linux Containers (`LXC`) as an operating-system-level virtualization environment for running multiple isolated Linux systems (containers) on a single Linux control host.

---

## Containers vs Virtual Machines

<img src="https://www.molecularecologist.com/wp-content/uploads/2016/05/docker_VMvsDocker.png" style="width:80vh">

---

## Containers vs Virtual Machines

- Runs as a filesystem ontop of the system kernel

- Essentially means that you do not have to boot up an operating system (like a virtual machine)

    - Therefore EXTREMELY light-weight

    - Negligible resource requirements for a docker container

---

## Why Docker?

- System agnostic

    - Enable a Run the same program on MacOSX, Linux, Windows

- Deploy your program or pipeline the way you want to

- Deployment is very quick

---

## Why Docker?

```“....It works on my machine...”```

- Program independence

    - Removes problems with system dependencies
        - Specific library dependencies are taken care of

    - Python 2 or python 3?

---

## Disadvantages: Security

- Only UIDs (user ids) and GIDs (group ids) matter. For example names and passwords of users and groups do not need to match or even exist in both host and container

- By default the command of a container is run as root

- It is possible (on a unix-based system) to set file/directory ownership to a GID which does not belong to any actual group

Taken from: [Niels Søholm - "Docker volumes and file system permissions"](https://medium.com/@nielssj/docker-volumes-and-file-system-permissions-772c1aee23ca)

---

## Disadvantages: Security

- `docker` is rarely allowed on a HPC, because as a regular user you do not have root access

- Should be used locally and with caution

- Again, see [Niels Søholm - "Docker volumes and file system permissions"](https://medium.com/@nielssj/docker-volumes-and-file-system-permissions-772c1aee23ca)

---

### Possible solutions?

HPC docker-like solutions:

1. Shifter (https://github.com/NERSC/shifter)

2. Singularity (https://singularity.lbl.gov/)

    - Jan will be going to this later

---

### However...

- Currently being embraced by:
    - Amazon Web Services (AWS)
    - Google Compute Platform (GCP)
    - Microsoft Azure
    - OpenStack ...etc etc...
