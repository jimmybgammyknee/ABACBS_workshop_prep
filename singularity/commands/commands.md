# Interactive

Step  |  Host                                                                   | Container
------|-------------------------------------------------------------------------|-----------
0     | `sudo singularity build --sandbox /tmp/ubuntu docker://ubuntu:latest`   |
1     | `tree /tmp/ubuntu`                                                      |
2     | `singularity shell /tmp/ubuntu/`                                        |
3     |                                                                         | `uname -a`
3     |                                                                         | `whoami`
4     |                                                                         | `cd && touch fromtheinside`
5     | `ls $HOME`                                                              | `rm fromtheinside`
6     |                                                                         | `touch /tmp/fromtheinside`
7     | `ls /tmp/fromtheinside`                                                 | `touch /usr/local/bin/fromtheinside`
8     |                                                                         | `exit`
9     | `sudo singularity shell --writable  /tmp/ubuntu/`                       | `whoami`
10    |                                                                         | `exit`
10    | `singularity exec  /tmp/ubuntu/ echo "Let's go bowling"`                |
11    | `sudo singularity exec --writable  /tmp/ubuntu/ apt-get update && sudo singularity exec --writable  /tmp/ubuntu/ apt-get install git`         |
12    | `sudo singularity exec  --writable  /tmp/ubuntu/ mkdir  /mnt/builds`    |
13    | `singularity shell -B /usr/:/mnt/builds  /tmp/ubuntu/`                  | `ls /mnt/builds`
14    | `sudo singularity build ubuntu.sif /tmp/ubuntu/`                        |
15    | `sudo singularity shell ubuntu.sif`                                     |
16    | `echo "echo Behind you, a three headed monkey " | singularity exec ubuntu.sif bash |singularity exec ubuntu.sif rev`
