#!/bin/bash
#SBATCH -p himem 
#SBATCH --job-name=Bwa_Mem
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=10
#SBATCH --time=168:00:00
#SBATCH --mem=50gb
#SBATCH --output=BwaMem.%J.out
#SBATCH --error=BwaMem.%J.err

module load bwa/0.7.15

echo "read1" $1
echo "read2" $2


bwa mem genome/hg38 $1 $2 -t $SLURM_NTASKS_PER_NODE > bwa_mem_alignments.sam
