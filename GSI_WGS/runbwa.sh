#!/bin/bash
#SBATCH --job-name=Bwa_Mem
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=8
#SBATCH --time=168:00:00
#SBATCH --mem=10gb
#SBATCH --output=BwaMem.%J.out
#SBATCH --error=BwaMem.%J.err

module load bwa/0.7.15

bwa mem hg38 FILE1_R1.fq.gz FILE1_R2.fq.gz -t $SLURM_NTASKS_PER_NODE > bwa_mem_alignments.sam
