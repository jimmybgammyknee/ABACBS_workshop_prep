#-------------------------------------------------------------------------------
#  \author Jan P Buchmann <jan.buchmann@sydney.edu.au>
#  \description BLAST Docker image for ABACBS 2018 Docker Workshop
#-------------------------------------------------------------------------------
#ARG user=biologist
FROM ubuntu:latest

# EDirect minimal dependecies based on the list for minimal AWS requiremnts
# from Ben Busby:
#     libio-socket-ssl-perl         Not required
#     libnet-ssleay-perl            Not required
#     libhtml-html5-entities-perl   Not required
#     liblwp-protocol-https-perl    Required
RUN apt-get -q update                         &&  \
    apt-get install -y liblwp-protocol-https-perl \
                       wget

# Adding a user to tets non-privilged user procedures

RUN adduser --shell /bin/bash --disabled-password --gecos '' biologist
USER biologist
RUN cd /home/biologist                                            &&  \
    wget ftp.ncbi.nlm.nih.gov/entrez/entrezdirect/edirect.tar.gz  &&  \
    gunzip -c edirect.tar.gz | tar xf -                           &&  \
    rm edirect.tar.gz
    #builtin exit
ENV PATH "/home/biologist/edirect:${PATH}"
    #export PATH=${PATH}:$HOME/edirect >& /dev/null || setenv PATH "${PATH}:$HOME/edirect"
RUN cd /home/biologist && /bin/bash ./edirect/setup.sh
RUN mkdir /home/biologist/bin && mkdir /home/biologist/dbs
RUN cd /home/biologist/bin && wget ftp://ftp.ncbi.nlm.nih.gov/blast/executables/LATEST/ncbi-blast-2.7.1+-x64-linux.tar.gz -O - | tar --strip-components 2 -zxvf -
RUN echo "export PATH=\${PATH}:/home/biologist/edirect:/home/biologist/bin" >> /home/biologist/.bashrc
ENV PATH "/home/biologist/edirect::/home/biologist/bin:${PATH}"
RUN wget ftp://ftp.ncbi.nlm.nih.gov/refseq/release/viral/viral.1.1.genomic.fna.gz -O - | gzip -dc  > /home/biologist/dbs/virus_genomes.fa && \
    wget ftp://ftp.ncbi.nlm.nih.gov/refseq/release/viral/viral.2.1.genomic.fna.gz -O - | gzip -dc >> /home/biologist/dbs/virus_genomes.fa
RUN makeblastdb -dbtype nucl -in /home/biologist/dbs/virus_genomes.fa -parse_seqids -out /home/biologist/dbs/virus_genomes -title virus_genomes
