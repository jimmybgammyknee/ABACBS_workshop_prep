# Interactive

Step  |  Host                                                                   | Container
------|-------------------------------------------------------------------------|-----------
0     | `sudo singularity build --sandbox /tmp/ubuntu docker://ubuntu:latest`   |
1     | `tree /tmp/ubuntu`                                                      |
2     | `singularity shell /tmp/ubuntu/`                                        |
3     |                                                                         | `uname -a`
4     |                                                                         | `touch fromtheinside`
5     |                                                                         | `touch /tmp/fromtheinside`
6     | `ls $HOME`                                                              | `touch /usr/local/bin/fromtheinside`
7     |                                                                         | `exit`
8     | `sudo singularity shell --writbale  /tmp/ubuntu/`                      |
9     | `singularity exec  /tmp/ubuntu/ echo "Let's go bowling"`                |
10    | `sudo singularity exec --writable  /tmp/ubuntu/ apt-get update`         |
11    | `sudo singularity exec --writable  /tmp/ubuntu/ apt-get install git build-essential ca-certificates openssl openssh-server openmpi-bin openmpi-common libopenmpi-dev`|
12    | `sudo singularity exec  --writable  /tmp/ubuntu/ mkdir  /mnt/builds`    |
13    | `sudo singularity shell   --writable  /tmp/ubuntu/`                     | `cd /mnt/builds && git clone https://github.com/stamatak/standard-RAxML && cd standard-RAxML && make -j2 -f Makefile.AVX.HYBRID.gcc && chmod +x raxmlHPC-HYBRID-AVX && mv raxmlHPC-HYBRID-AVX /usr/local/bin`
14    |                                                                         | `ls /usr/local/bin`
15    |                                                                         | `raxmlHPC-HYBRID-AVX -v`
16    |                                                                         | `gcc -v && ldd /usr/local/bin/raxmlHPC-HYBRID-AVX`
17    | `sudo singularity build raxml.sif /tmp/ubuntu/`                         |
18    | `sudo singularity shell raxml.sif`                                      |
18    |                                                                         | `which raxmlHPC-HYBRID-AVX`

- `sudo singularity shell -B /tmp:/builds  --writable  /tmp/ubuntu/`

#
