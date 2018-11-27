#!/bin/bash
#-------------------------------------------------------------------------------
#  \author Jan P Buchmann <jan.buchmann@sydney.edu.au>
#  \copyright 2018 The University of Sydney
#  \description
#-------------------------------------------------------------------------------

ftp_blastdb1=ftp://ftp.ncbi.nlm.nih.gov/refseq/release/viral/viral.1.1.genomic.fna.gz
ftp_blastdb2=ftp://ftp.ncbi.nlm.nih.gov/refseq/release/viral/viral.2.1.genomic.fna.gz
dbdir=/biodbs/blastdb
refseq_virus_db=refseq_virus

mkdir --parents $dbdir \
  &&   {    wget $ftp_blastdb1 -O - | gzip --decompress --stdout      \
          & wget $ftp_blastdb2 -O - | gzip --decompress --stdout ; } \
   | makeblastdb -dbtype nucl                   \
                 -parse_seqids                 \
                 -title virus_genomes          \
                 -out $dbdir/$refseq_virus_db
