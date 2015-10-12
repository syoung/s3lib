pipeline


<entry [Thu 2013:08:08 14:15:18 EST] GATK is a Research Tool. Clinics Beware>

http://blog.goldenhelix.com/?p=1534

Posted on December 3, 2012 by Gabe Rudy

In preparation for a webcast I’ll be giving on Wednesday on my own exome, I’ve been spending more time with variant callers and the myriad of false-positives one has to wade through to get to interesting, or potentially significant, variants.

So recently, I was happy to see a message in my inbox from the 23andMe exome team saying they had been continuing to work on improving their exome analysis and that a “final” analysis was now ready to download.

This meant I had both an updated “variants of interest” report as well as updated variant calls in a new VCF file. I’ll get to the report in a second, which lists rare or novel variants in clinically associated genes, but first let’s look at what changed in the variant calls.

New… and Improved?
At first blush, the variant files look quite different as you can see in the first Venn diagram below comparing variants (both unique and common) between the original and new files. But after I applied a conservative filter (Genotype Quality (GQ) >10 and Read Depth (RD) > 10) on the variants, things start to look less dramatic. So what is with all the new variants? It looks like many are just more aggressive variant calls. In fact there were ten thousand variants with a read depth of just one (a single read) in the new file!
    
    
</entry>
<entry [Thu 2013:08:08 14:12:30 EST] FAREWELL TO BIOINFORMATICS>

madhadron: A farewell to bioinformatics

I’m leaving bioinformatics to go work at a software company with more technically ept people and for a lot more money. This seems like an opportune time to set forth my accumulated wisdom and thoughts on bioinformatics.

My attitude towards the subject after all my work in it can probably be best summarized thus: “Fuck you, bioinformatics. Eat shit and die.”

Bioinformatics is an attempt to make molecular biology relevant to reality. All the molecular biologists, devoid of skills beyond those of a laboratory technician, cried out for the mathematicians and programmers to magically extract science from their mountain of shitty results.

And so the programmers descended and built giant databases where huge numbers of shitty results could be searched quickly. They wrote algorithms to organize shitty results into trees and make pretty graphs of them, and the molecular biologists carefully avoided telling the programmers the actual quality of the results. When it became obvious to everyone involved that a class of results was worthless, such as microarray data, there was a rush of handwaving about “not really quantitative, but we can draw qualitative conclusions” followed by a hasty switch to a new technique that had not yet been proved worthless.

And the databases grew, and everyone annotated their data by searching the databases, then submitted in turn. No one seems to have pointed out that this makes your database a reflection of your database, not a reflection of reality. Pull out an annotation in GenBank today and it’s not very long odds that it’s completely wrong.

Compare this with the most important result obtained by sequencing to date: Woese et al’s discovery of the archaea. (Did you think I was going to say the human genome? Fuck off. That was a monument to the vanity of that god-bobbering asshole Francis Collins, not a science project.) They didn’t sequence whole genomes, or even whole genes. They sequenced a small region of the 16S rRNA, and it was chosen after pilot experiments and careful thought. The conclusions didn’t require giant computers, and they didn’t require precise counting of the number of templates. They knew the limitations of their tools.

Then came clinical identification, done in combination with other assays, where a judicious bit of sequencing could resolve many ambiguities. Similarly, small scale sequencing has been an incredible boon to epidemiology. Indeed, its primary scientific use is in ecology. But how many molecular biologists do you know who know anything about ecology? I can count the ones I know on one hand.

And sequencing outside of ecology? Irene Pepperberg’s work with Alex the parrot dwarfs the scientific contributions of all other sequencing to date put together.

This all seems an inauspicious beginning for a field. Anything so worthless should quickly shrivel up and die, right? Well, intentionally or not, bioinformatics found a way to survive: obfuscation. By making the tools unusable, by inventing file format after file format, by seeking out the most brittle techniques and the slowest languages, by not publishing their algorithms and making their results impossible to replicate, the field managed to reduce its productivity by at least 90%, probably closer to 99%. Thus the thread of failures can be stretched out from years to decades, hidden by the cloak of incompetence.

And the rhetoric! The call for computational capacity, most of which is wasted! There are only two computationally difficult problems in bioinformatics, sequence alignment and phylogenetic tree construction. Most people would spend a few minutes thinking about what was really important before feeding data to an NP complete algorithm. I ran a full set of alignments last night using the exact algorithms, not heuristic approximations, in a virtual machine on my underpowered laptop yesterday afternoon, so we’re not talking about truly hard problems. But no, the software is written to be inefficient, to use memory poorly, and the cry goes up for bigger, faster machines! When the machines are procured, even larger hunks of data are indiscriminately shoved through black box implementations of algorithms in hopes that meaning will emerge on the far side. It never does, but maybe with a bigger machine…

Fortunately for you, no one takes me seriously. The funding of molecular biology and bioinformatics is safe, protected by a wall of inbreeding, pointless jargon, and lies. So you all can rot in your computational shit heap. I’m gone.

    
</entry>
<entry [Thu 2013:08:08 14:10:50 EST] GOOGLE SCHOLAR ANALYSIS OF NGS APPLICATION POPULARITY>

NGS bioinformatics pipelines

Hi Thomas,

In response to your question about NGS reviews, I'm assuming you meant the bioinformatics side but please correct me if I'm wrong. For the human genome and other genomes where the reference is known, bioinformatics processing of sequence data is basically alignment followed by variant calling. Here are a couple of reviews on alignment and assembly algorithms.

Alignment algorithms
http://bib.oxfordjournals.org/content/11/5/473.full

Assembly algorithms
http://www.sciencedirect.com/science/article/pii/S0888754310000492


For alignment, BWA and Bowtie are currently popular. For variant calling, SOAP, SamTools and the Broad Institute's Genome Analysis Toolkit are the most popular, though GATK might be more accurate (http://repository.cshl.edu/28123/). There might be issues with using GATK due to its licensing http://biomickwatson.wordpress.com/2013/01/28/gatk-why-it-matters/.

The number of citations of an application might give some indication of how good it is.
 
Google Scholar citations (no normalization)

Category	Total	2012-now (08/2013)

Alignment	BWA 		2,750	265	http://bio-bwa.sourceforge.net/
Alignment	Bowtie		3,350	285	http://bowtie-bio.sourceforge.net/index.shtml
Alignment	MAQ		18,741	212	http://maq.sourceforge.net/maq-man.shtml
Alignment	Novoalign	2,781	50	http://www.novocraft.com/main/page.php?s=novoalign
Alignment	Eland		6,816	31	http://attractivechaos.wordpress.com/2008/08/24/eland-short-read-aligner/

Variant		SOAP		7,386	120	http://bioinformatics.oxfordjournals.org/content/24/5/713.short
Variant		SAMTools	2,400	29	http://bioinformatics.oxfordjournals.org/content/25/16/2078.short
Variant		GATK		939 	60	http://genome.cshlp.org/content/20/9/1297.short
Variant		GNUMAP	52	26	http://bioinformatics.oxfordjournals.org/content/26/1/38.shVariant		SNVer		34	14	http://nar.oxfordjournals.org/content/39/19/e132.short
ort

Expression	Tophat		2,120	191	http://bioinformatics.oxfordjournals.org/content/25/9/1105.short
Expression	DEGseq	362	69	http://www.bioconductor.org/packages/2.6/bioc/html/DEGseq.html
	

For expression analysis, Bowtie/Tophat is the most popular but there are a lot of commercial applications out there: http://www.rna-seqblog.com/data-analysis/rna-seq-analysis-software-commercial-packages/

Eland is fast but has limitations, BWA has advantages over Bowtie http://www.fejes.ca/2008/01/aligning-dna-eland.html.

Regardless of their popularity, with all of these applications, validation is crucial, particularly to make sure bugs aren't introduced in new versions of the software.
 



</entry>