#!/usr/bin/env python3
#-------------------------------------------------------------------------------
#  \author Jan P Buchmann <jan.buchmann@sydney.edu.au>
#  \copyright 2018 The University of Sydney
#  \description
#-------------------------------------------------------------------------------

import io
import os
import sys
import time
import argparse
import subprocess

def efetch(input_fil):

  fh = open(input_fil, 'r')
  cmd = ['efetch', '-db', 'nuccore', '-format', 'fasta', '-id', ' '.join(x.rstrip() for x in fh)]
  fh.close()
  proc = subprocess.Popen(cmd,
                          stdout=subprocess.PIPE,
                          universal_newlines=True,
                          bufsize=1)
  return proc.stdout

def blast(queries, outdir):
  blastdb = '/biodbs/blastdb/refseq_virus'
  proc = subprocess.Popen(['blastn', '-db', blastdb],
                          stdin=queries,
                          stdout=subprocess.PIPE,
                          universal_newlines=True,
                          bufsize=1)
  fh = open(os.path.join(outdir, 'simple-blast-pipeline.result'), 'w')
  for i in proc.stdout:
    print(i.rstrip())
    fh.write(i.rstrip() + '\n')
  fh.close()

def main():
  ap = argparse.ArgumentParser(description='Simple pipeline')
  ap.add_argument('--outdir',
                  type=str),
  ap.add_argument('--input',
                  type=str)
  args = ap.parse_args()
  blast(efetch(args.input), args.outdir)
  return 0

if __name__ == '__main__':
  main()
