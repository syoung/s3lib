#! /bin/bash

#### FixMates

# 1 sort
samtools sort /data/download/<SAMPLE>/<FILENAME> /data/download/<SAMPLE>/<FILESTUB>_sorted

# 2 fixMate
/agua/apps/java/1.7.0_51/bin/java -Xmx3000m -Djava.io.tmpdir=${sample}_tmp -jar /work/node/stephane/depot/picard-tools/picard-tools-1.103/FixMateInformation.jar I=/data/download/<SAMPLE>/<FILESTUB>_sorted.bam O=/data/download/<SAMPLE>/<FILESTUB>_fxmt.bam SO=coordinate CREATE_INDEX=true VALIDATION_STRINGENCY=SILENT

# 3 cleanSort
rm /data/download/<SAMPLE>/<FILESTUB>_sorted.bam


#### FilterReads

# 4 filterReads
/work/node/stephane/depot/bin/bamtools filter -isMapped true -isPaired true -isProperPair true -in /data/download/<SAMPLE>/<FILESTUB>_fxmt.bam -out /data/download/<SAMPLE>/<FILESTUB>_fxmt_flt.bam

# 5 indexBam
samtools index /data/download/<SAMPLE>/<FILESTUB>_fxmt_flt.bam

# 6 cleanBam
rm /data/download/<SAMPLE>/<FILESTUB>_fxmt.ba*

#### MarkDuplicates

# 7 markDuplicates
/agua/apps/java/1.7.0_51/bin/java -Xmx3000m -Djava.io.tmpdir=${sample}_tmp -jar /work/node/stephane/depot/picard-tools/picard-tools-1.103/MarkDuplicates.jar I=/data/download/<SAMPLE>/<FILESTUB>_fxmt_flt.bam O=/data/download/<SAMPLE>/<FILESTUB>_rmdup.bam M=/data/download/<SAMPLE>/<FILESTUB>_dup_report.txt PROGRAM_RECORD_ID=null VALIDATION_STRINGENCY=SILENT REMOVE_DUPLICATES=true

# 8 cleanDuplicates
rm /data/download/<SAMPLE>/<FILESTUB>_fxmt_flt.ba* /data/download/<SAMPLE>/<FILESTUB>_dup_report.txt

#### AddReadGroups

# 9 addReadGroups
/agua/apps/java/1.7.0_51/bin/java -Xmx3000m -Djava.io.tmpdir=${sample}_tmp -jar /work/node/stephane/depot/picard-tools/picard-tools-1.103/AddOrReplaceReadGroups.jar RGPL=Illumina RGLB=BWA RGPU=GRP1 RGSM=GP1 I=/data/download/<SAMPLE>/<FILESTUB>_rmdup.bam O=/data/download/<SAMPLE>/<FILESTUB>_rmdup_grp.bam SO=coordinate CREATE_INDEX=true VALIDATION_STRINGENCY=SILENT

# 10 cleanReadGroups
rm /data/download/<SAMPLE>/<FILESTUB>_rmdup.ba*


#### QualityFilter

# 11 qualityFilter
/work/node/stephane/depot/bin/bamtools filter -mapQuality ">=60" -in /data/download/<SAMPLE>/<FILESTUB>_rmdup_grp.bam -out /data/download/<SAMPLE>/<FILESTUB>_rmdup_grp_rmlq.bam

# 12 indexBam
samtools index /data/download/<SAMPLE>/<FILESTUB>_rmdup_grp_rmlq.bam

# 13 cleanBam
rm /data/download/<SAMPLE>/<FILESTUB>_rmdup_grp.ba*

#### IndelRealignment

# 14 realignTarget
/agua/apps/java/1.7.0_51/bin/java -Xmx3000m -Djava.io.tmpdir=${sample}_tmp -jar /work/knode05/milanesej/GenomeAnalysisTK-2.8-1/GenomeAnalysisTK.jar -T RealignerTargetCreator -nt 2 -I /data/download/<SAMPLE>/<FILESTUB>_rmdup_grp_rmlq.bam -R /data/reference/Homo_sapiens_assembly19.fasta -o /data/download/<SAMPLE>/<FILESTUB>_forRealign.intervals

# 15 realign
/agua/apps/java/1.7.0_51/bin/java -Xmx3000m -Djava.io.tmpdir=${sample}_tmp -jar /work/knode05/milanesej/GenomeAnalysisTK-2.8-1/GenomeAnalysisTK.jar -T IndelRealigner -I /data/download/<SAMPLE>/<FILESTUB>_rmdup_grp_rmlq.bam -R /data/reference/Homo_sapiens_assembly19.fasta -targetIntervals /data/download/<SAMPLE>/<FILESTUB>_forRealign.intervals --out /data/download/<SAMPLE>/<FILESTUB>_realigned.bam -LOD 0.4 -compress 5

# 16 cleanRealign
rm /data/download/<SAMPLE>/<FILESTUB>_rmdup_grp_rmlq.ba* /data/download/<SAMPLE>/<FILESTUB>_forRealign.intervals

#### BaseRecalibration

# 17 recalibrateBase
/agua/apps/java/1.7.0_51/bin/java -Xmx3000m -Djava.io.tmpdir=${sample}_tmp -jar /work/knode05/milanesej/GenomeAnalysisTK-2.8-1/GenomeAnalysisTK.jar -T BaseRecalibrator -I /data/download/<SAMPLE>/<FILESTUB>_realigned.bam -R /data/reference/Homo_sapiens_assembly19.fasta -o /data/download/<SAMPLE>/<FILESTUB>_recal_data.grp -knownSites /data/reference/varscan/1000G_phase1.indels.b37.vcf -knownSites /data/reference/varscan/dbsnp_138.b37.vcf -knownSites /data/reference/varscan/Mills_and_1000G_gold_standard.indels.b37.vcf

# 18 printReads
/agua/apps/java/1.7.0_51/bin/java -Xmx3000m -Djava.io.tmpdir=${sample}_tmp -jar /work/knode05/milanesej/GenomeAnalysisTK-2.8-1/GenomeAnalysisTK.jar -T PrintReads -I /data/download/<SAMPLE>/<FILESTUB>_realigned.bam -R /data/reference/Homo_sapiens_assembly19.fasta -o /data/download/<SAMPLE>/<FILESTUB>_realigned_recal.bam -BQSR /data/download/<SAMPLE>/<FILESTUB>_recal_data.grp

