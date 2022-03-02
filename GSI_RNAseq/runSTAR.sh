#!/bin/bash

#SBATCH -p veryhimem            # partition name
#SBATCH -t 1-0:00               # hours:minutes runlimit after which job will be killed
#SBATCH -c 6            # number of cores requested -- this needs to be greater than or equal to the number of cores you plan to use to run your job
#SBATCH --mem 70G
#SBATCH --job-name STAR_mapping                 # Job name


module load gcc STAR/2.7.9a

echo "read1" $1
echo "read2" $2

filename=${1##*/}
arrIN=(${filename//"_R1"/ })
echo ${arrIN}  


###Code for index
STAR --runThreadN 6 \
--runMode genomeGenerate \
--genomeDir /CLUSTERPATH/genome/hg38_UCSC/STARIndex \
--genomeFastaFiles /CLUSTERPATH/genome/hg38_UCSC/hg38.fa  \
--sjdbGTFfile /CLUSTERPATH/genome/hg38_UCSC/hg38.knownGene.gtf


###Code for mapping
STAR --genomeDir /CLUSTERPATH/genome/hg38_UCSC/STARIndex/ \
--runThreadN 6 \
--runMode alignReads \
--readFilesIn $1 $2 \
--readFilesCommand zcat \
--outFileNamePrefix STAR_results/${arrIN}. \
--outSAMtype BAM SortedByCoordinate \
--outSAMunmapped Within \
--outSAMattributes Standard