titan


<entry [Sat 2014:02:08 06:17:25 EST] DOWNLOADED snpdb> 

wget https://snpdb.googlecode.com/files/snpdb.zip

This project is used to facilitate the management and analysis of Single-Nucleotide Polymorphism (SNP) data from Genome-Wide Association Studies (GWAS) using a database system.

The scripts can be used to:

(a) Create a SNP database (in PostgreSQL)

(b) Load SNP data from various studies into this single database. Currently, the system supports importing genotype and annotation data from two commercial platforms, illumina and affymetrix.

(c) Export data sets to standard data format files (PED, MAP) that can be imported into statistical software for downstream analyses.

Source code along with documentation is available for download from this site.

For additional details, including a citation, please refer to:

Faheem Mitha, Herodotos Herodotou, Nedyalko Borisov, Chen Jiang, and Kouros Owzar


</entry>
<entry [Sat 2014:02:08 06:15:20 EST] SNP EDGES>

https://groups.google.com/forum/#!topic/bgi-soap/Zjb1U9Hr_o4
Shyam Sarkar 	
7/28/13


Hello,

I am trying to build a graph database with outputs from SOAPsnp and I need the essential
relationships over offsets and SNPs.  Can someone please suggest which fields from 
SOAPsnp output will make sense to create such a graph database for further statistical
querying ?  I have the output format as:

1. Chromosome ID.
2. 1-based offset into chromosome.
3. Reference genotype.
4. Subject genotype.
5. Quality score of subject genotype.
6. Best base.
7. Average quality score of best base.
8. Count of uniquely aligned reads corroborating the best base.
9. Count of all aligned reads corroborating the best base.
10. Second best base.
11. Average quality score of second best base.
12. Count of uniquely aligned reads corroborating second best base.
13. Count of all aligned reads corroborating second best base.
14. Overall sequencing depth at the site.
15. Rank sum test P-value.
16. Average copy number of nearby region.
17. Whether the site is a known dbSNP.

I need essential fields to detect SNP to create nodes and relationships
in a graph. (Or what will be a query to detect SNP ?).

I appreciate any help.

Thanks,
Dr. Shyam Sarkar
Fremont, CA

   
</entry>
<entry [Sat 2014:02:08 05:29:17 EST] INSTALLED TITAN ON LAPTOP>



<!--

<dependency>
   <groupId>com.thinkaurelius.titan</groupId>
   <artifactId>titan-core</artifactId>
   <version>0.4.2</version>
</dependency>
<!-- core, all, cassandra, hbase, berkeleyje, es, lucene, persistit -->
-->


// who is hercules' grandfather?
g.V('name','hercules').out('father').out('father').name

g.E.has('place',WITHIN,Geoshape.circle(37.97,23.72,50)).collect {
   it.bothV.name.next(5) 
}

</entry>