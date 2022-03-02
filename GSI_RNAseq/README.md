STEPS TO RUN CoBE RNA-seq pipeline (https://www.pmcobe.ca/pipeline/60a4336aaf7a3251ac7e1667)


**STEP 1: Login to cluster:**
```
ssh username@cluster.org
```


**STEP2: Download repo, genome references**
```
git clone https://github.com/LupienLab/CoBE.git

cd GSI_RNAseq  

mkdir genome

cd genome

Download genome reference
wget http://hgdownload.soe.ucsc.edu/goldenPath/hg38/bigZips/hg38.fa.gz

wget http://hgdownload.soe.ucsc.edu/goldenPath/hg38/bigZips/genes/hg38.knownGene.gtf.gz

gunzip hg38.fa.gz

gunzip hg38.knownGene.gtf.gz

cd ..
```

**STEP 3: Edit runSTAR.sh file and provide correct paths:**
```
vi runSTAR.sh 

```
**STEP 4: Build index and run alignmer on cluster:**
```
sbatch run_star.sh /CLUSTERPATH/FILE1_R1.fastq.gz /CLUSTERPATH/FILE1_R2.fastq.gz
```
