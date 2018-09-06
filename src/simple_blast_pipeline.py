#!/usr/bin/env python3
#  -------------------------------------------------------------------------------
#  \author Jan P Buchmann <jan.buchmann@sydney.edu.au>
#  \copyright 2018 The University of Sydney
#  \description
#  -------------------------------------------------------------------------------

import io
import os
import sys
import subprocess

def efetch(accessions):
  cmd = ['efetch', '-db', 'nuccore', '-format', 'fasta', '-id' ]
  #proc = subprocess.Popen(cmd, stdin=subprocess.PIPE, stdout=subprocess.PIPE)
  fh = open(accessions, 'r')
  #for i in fh:
    #print(i)
    #proc.stdin.write(" "+i)
  #proc.stdin.write("\n")
  #proc.stdin.close()

def main():
  print(os.getcwd())
  efetch(os.path.join('examples', 'accs'))
  return 0

if __name__ == '__main__':
  main()
