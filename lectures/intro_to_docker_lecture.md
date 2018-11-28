# Introduction to Docker

1. Introduction to the course
2. Introduction to the tutors

3. What is Docker?
    1. Containerisation: A brief history...
        - Developed with help from Linux kernel developers.
            - Developed a 'process containers' (renamed 'control groups') to control everything from single processes to whole-system virtualisation
                ```cgroups (abbreviated from control groups) is a Linux kernel feature that limits, accounts for, and isolates the resource usage (CPU, memory, disk I/O, network, etc.) of a collection of processes.```
            - Cgroups (further developed by Google engineers) provided:
                - Resource limitation and prioritisation: Some groups should not exceed a certain allocation of RAM, CPU etc
                - Measurement: How much was each cgroup using (for billing)
                - Full control over how and when it ran
            - Docker relies (or should I say _has relied_) on Linux Containers (`LXC`) as an operating-system-level virtualization environment for running multiple isolated Linux systems (containers) on a single Linux control host.

4. Containers vs Virtual Machines
    - https://www.molecularecologist.com/wp-content/uploads/2016/05/docker_VMvsDocker.png
    - Runs as a filesystem ontop of the system kernel
    - Essentially means that you do not have to boot up an operating system (like a virtual machine)
        - Therefore EXTREMELY light-weight
        - Negligible resource requirements for a docker container (JAN REFERENCE)

4. Why Docker?
    - System agnostic
        - Enable a Run the same program on MacOSX, Linux, Windows
    - Deploy your program or pipeline the way you want to
    - Program independence

    - Removes problems with system dependencies
        - Specific library dependencies are taken care of
    - Python 2 or python 3?

5. Advantages and disadvantages
    - First the disadvantages:
        - Security:
            - Docker containers need a certain level of permissions in order to run
            -
