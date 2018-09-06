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
RUN apt-get -q update &&  \
    apt-get install -y liblwp-protocol-https-perl \
                       wget                       \
                       python3

# Adding a user to tets non-privilged user procedures

RUN adduser --shell /bin/bash --disabled-password --gecos '' biologist
USER biologist
WORKDIR /home/biologist

RUN wget ftp.ncbi.nlm.nih.gov/entrez/entrezdirect/edirect.tar.gz  &&  \
    gunzip -c edirect.tar.gz | tar xf -                           &&  \
    rm edirect.tar.gz

ENV PATH "/home/biologist/edirect:${PATH}"
    #export PATH=${PATH}:$HOME/edirect >& /dev/null || setenv PATH "${PATH}:$HOME/edirect"

RUN /bin/bash ./edirect/setup.sh

RUN mkdir bin &&  \
    mkdir dbs &&  \
    mkdir pipeline
RUN cd bin && \
    wget ftp://ftp.ncbi.nlm.nih.gov/blast/executables/LATEST/ncbi-blast-2.7.1+-x64-linux.tar.gz -O - | \
    tar --strip-components 2 -zxvf -

RUN echo "export PATH=\${PATH}:/home/biologist/edirect:/home/biologist/bin" >> /home/biologist/.bashrc

ENV PATH "/home/biologist/edirect::/home/biologist/bin:${PATH}"

RUN wget ftp://ftp.ncbi.nlm.nih.gov/refseq/release/viral/viral.1.1.genomic.fna.gz -O - | gzip -dc  > dbs/virus_genomes.fa && \
    wget ftp://ftp.ncbi.nlm.nih.gov/refseq/release/viral/viral.2.1.genomic.fna.gz -O - | gzip -dc >> dbs/virus_genomes.fa

RUN makeblastdb -dbtype nucl -in dbs/virus_genomes.fa -parse_seqids -out dbs/virus_genomes -title virus_genomes
COPY $pwd/src/simple_blast_pipeline.py pipeline

ENTRYPOINT ["python3", "pipeline/simple_blast_pipeline.py"]
