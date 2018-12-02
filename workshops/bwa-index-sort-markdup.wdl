

workflow BwaIndexMark {

    # Genome reference
    File RefFasta
    # Sample Fastq
    File InputFastq
    String SampleName
    # Genome index name
    String IndexName

    call index_fasta {
        input:
            ref_fasta = RefFasta
    }

    call align_sortBam {
        input:
            Input_Fastq = InputFastq,
            ref_fasta = index_fasta.fasta,
            ref_fasta_index = index_fasta.fai,
            ref_dict = index_fasta.dict,
            ref_amb = index_fasta.amb,
            ref_ann = index_fasta.ann,
            ref_bwt = index_fasta.bwt,
            ref_pac = index_fasta.pac,
            ref_sa = index_fasta.sa,
            Base_Name = SampleName
        }
    call markDuplicatesBam {
        input:
            Input_Bam = align_sortBam.outputfile
        }
}

task index_fasta {
    File ref_fasta

    String basename = basename(ref_fasta)
    String refname  = basename(ref_fasta, ".fas")

    command {
        cp "${ref_fasta}" "${basename}"
        gatk --java-options -Djava.io.tempdir=`pwd`/tmp CreateSequenceDictionary \
            -R="${basename}" \
            -O="${refname}.dict"
        samtools faidx "${basename}"
        bwa index "${basename}"
    }

    output {
        File dict   = "${refname}.dict"
        File fasta  = "${basename}"
        File amb    = "${basename}.amb"
        File ann    = "${basename}.ann"
        File bwt    = "${basename}.bwt"
        File fai    = "${basename}.fai"
        File pac    = "${basename}.pac"
        File sa     = "${basename}.sa"
    }

    runtime {
        docker: "oskarv/wdl:latest"
    }
}

task align_sortBam {
    File Input_Fastq
    File ref_fasta
    File ref_fasta_index
    File ref_dict
    File ref_amb
    File ref_ann
    File ref_bwt
    File ref_pac
    File ref_sa
    String Base_Name

    command {
        bwa mem -t 2 -M ${ref_fasta} ${Input_Fastq} | \
            gatk --java-options "-Djava.io.tempdir=`pwd`/tmp -Xmx2G" SortSam \
                -I=/dev/stdin -O=${Base_Name}.bam -SO=coordinate
    }

    output {
        File outputfile = "${Base_Name}.bam"
    }

    runtime {
        docker: "oskarv/wdl:latest"
    }
}

task markDuplicatesBam {
    File Input_Bam

    String Base  = basename(Input_Bam, ".bam")

    command {
        gatk --java-options "-Djava.io.tempdir=`pwd`/tmp -Xmx2G" MarkDuplicates \
            -I=${Input_Bam} -O=${Base}.markdup.bam -M=${Base}.markdup.metrics.txt
    }

    output {
        File outputfile = "${Base}.markdup.bam"
        File metrics = "${Base}.markdup.metrics.txt"
    }

    runtime {
        docker: "oskarv/wdl:latest"
    }
}
