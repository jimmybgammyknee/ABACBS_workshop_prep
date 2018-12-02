
# Running docker images using wdl

- Jimmy Breen (jimmy.breen@adelaide.edu.au)
    - South Australian Health and Medical Research Institute (SAHMRI) & University of Adelaide

One advantage of docker containers is that they can be easily pulled from a external source during execution and run within a pipeline. Using workflow languages such as wdl (https://software.broadinstitute.org/wdl/) and cwl (https://www.commonwl.org/), and execution systems such as Cromwell (https://github.com/broadinstitute/cromwell), Toil (https://github.com/DataBiosphere/toil) or nextflow (https://www.nextflow.io/), its possible to run docker commands while running a local pipeline.

The last workshop contained a simple bash script that executed single docker commands within the script. Here we will just rewrite the bash script into a `wdl` file, and run the same pipeline and data using the execution engine `cromwell`.

I wont go into too much of the detail about `wdl` but the point is that you can make workflows by calling specific tasks. For our pipeline, we need to index our genome reference, align our fastq file, sort the file and mark the duplicates.

The `wdl` script is included in the repository called "bwa-index-sort-markdup.wdl"

To run this, we will use cromwell:

- Note: You can download the cromwell and womtool java executable through github. These are needed to run the workflow. These have been added to the README install section


```
# Validate whether the syntax is correct
java -jar /mnt/cromwell/womtool-36.jar validate bwa-index-sort-markdup.wdl

# Create inputs for the pipeline to run
java -jar /mnt/cromwell/womtool-36.jar inputs bwa-index-sort-markdup.wdl > inputs.json

# Run cromwell
java -jar /mnt/cromwell/cromwell-36.jar run -i inputs.json bwa-index-sort-markdup.wdl
```

This should run our pipeline to completion, with output files contained in the system:

```
cromwell-executions
└── BwaIndexMark
    └── 0a8be208-70a5-427e-9f6a-0df5cceedfdc
        ├── call-align_sortBam
        │   ├── execution
        │   │   ├── SRR7726416.bam
        │   │   ├── docker_cid
        │   │   ├── rc
        │   │   ├── script
        │   │   ├── script.background
        │   │   ├── script.submit
        │   │   ├── stderr.background
        │   │   ├── stdout
        │   │   └── stdout.background
        │   ├── inputs
        │   │   ├── -1303027712
        │   │   │   ├── TAIR10.fasta
        │   │   │   ├── TAIR10.fasta.amb
        │   │   │   ├── TAIR10.fasta.ann
        │   │   │   ├── TAIR10.fasta.bwt
        │   │   │   ├── TAIR10.fasta.dict
        │   │   │   ├── TAIR10.fasta.fai
        │   │   │   ├── TAIR10.fasta.pac
        │   │   │   └── TAIR10.fasta.sa
        │   │   └── -664535045
        │   │       └── SRR7726416.fastq.gz
        │   └── tmp.fab3d268
        │       └── root
        ├── call-index_fasta
        │   ├── execution
        │   │   ├── TAIR10.fasta
        │   │   ├── TAIR10.fasta.amb
        │   │   ├── TAIR10.fasta.ann
        │   │   ├── TAIR10.fasta.bwt
        │   │   ├── TAIR10.fasta.dict
        │   │   ├── TAIR10.fasta.fai
        │   │   ├── TAIR10.fasta.pac
        │   │   ├── TAIR10.fasta.sa
        │   │   ├── docker_cid
        │   │   ├── rc
        │   │   ├── script
        │   │   ├── script.background
        │   │   ├── script.submit
        │   │   ├── stderr.background
        │   │   ├── stdout
        │   │   └── stdout.background
        │   ├── inputs
        │   │   └── -664535045
        │   │       └── TAIR10.fasta
        │   └── tmp.8cd81a09
        │       └── root
        └── call-markDuplicatesBam
            ├── execution
            │   ├── SRR7726416.markdup.bam
            │   ├── SRR7726416.markdup.metrics.txt
            │   ├── docker_cid
            │   ├── rc
            │   ├── script
            │   ├── script.background
            │   ├── script.submit
            │   ├── stderr.background
            │   ├── stdout
            │   └── stdout.background
            ├── inputs
            │   └── -435974338
            │       └── SRR7726416.bam
            └── tmp.96e6dcc9
                └── root
```
