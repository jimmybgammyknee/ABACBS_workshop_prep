sudo singularity build --sandbox /tmp/ubuntu    \
  docker://ubuntu:latest  # In container
sudo singularity exec --writable  /tmp/ubuntu/  \
  apt-get update          # In container
sudo singularity exec --writable  /tmp/ubuntu/  \
  mkdir  /mnt/builds      # In container
sudo singularity shell -B hostdir:/mnt/builds -w /tmp/ubuntu/
#-> compile, copy, etc. tools from hostdir in the container
sudo singularity build raxml.sif /tmp/ubuntu/
sudo singularity shell raxml.sif
