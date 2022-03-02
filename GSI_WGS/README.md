STEPS TO RUN CoBE WGS pipeline (https://www.pmcobe.ca/pipeline/60a4336aaf7a3251ac7e16a1)


**STEP 1: Login to cluster:**
```
ssh username@cluster.org
```


**STEP2: Download repo, genome references**
```
git clone https://github.com/LupienLab/CoBE.git

cd GSI_WGS 

mkdir genome

cd genome

##Download genome reference and build index
wget http://hgdownload.soe.ucsc.edu/goldenPath/hg38/bigZips/hg38.fa.gz

gunzip hg38.fa.gz

module load bwa/0.7.15

bwa index -a bwtsw hg38.fa

cd ..
```

**STEP 3: Edit runSTAR.sh file and provide correct paths:**
```
vi runbwa.sh

```
**STEP 4: Build index and run alignmer on cluster:**
```
sbatch runbwa.sh /CLUSTERPATH/FILE1_R1.fastq.gz /CLUSTERPATH/FILE1_R2.fastq.gz
```
