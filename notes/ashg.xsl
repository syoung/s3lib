ashg




<entry [Thu 2014:10:23 12:42:07 EST] UK10K>



	
</entry>
<entry [Tue 2014:10:21 18:17:04 EST] Ryan cCollins, Talkowski group, Mass General Hosp>


Genome editing with CRISPR-CAS9

TARGETED INSERTION

STUDY 1 human embyonic stem cell clones (unbiased and genome-wide)
Veres et all Cell STem Cell 2014

CApture sequ of CD34+ haemopoetic stem cells (focused, exhaustive) 


Study design

Study 1
clone --> treat with CRISPR --> mutants --> selected clones targeting SORT1 and LIC00116

Study 2
clone --> 1) no guide RNA , 2) single gRNA, 3) paired gRNA

up to 6 base mismatch between guide and target sit --> capture sequencing --> 3,390X sequencing


REsults

study 1
264 bp fragment for chr4 translocated and inserted into cut site
nB: 5 end had no homology!!

minimal evidence for off-target mutagenesis

evidence of one translocation into target site

study2

broad spread of eficiencies using gRNA

on-target sites
48% on-target efficiency for best guides


off-target sites
only 1/172 sites with enriched mutations 

1.22 fold compared to on-target 63.00 for same site!!

on-target heterogeneity

dual guides --> anything that can happen does happen


Conclusioins

CRISPR-cas9 in human stems cells si hightly specific

efficencies vary with guides

variable insertion sites on-target
 
one translocation

Q: Same plasmid?
A: dunno

Q: Other cell types
A: NO strong consensus in field for off-target rate - some studies showd no off target rate, others high off target rate

Q: ERic (Scripps). Whole genome library, sequencing
A: PE 100 bp illuminu
bwa -mem to CHRCh37 v 71

Q:
A: Manually inspected every site
diversity of off-target mutation made alignment difficult for most tools

Biased anlayses for variants w high confidence in some libraries
Could be low-freq eg. small indels

Q: Max Planck - check if effect is dose-dependent for gRNA


	
</entry>
<entry [Tue 2014:10:21 18:02:00 EST] KOSU INAPA, IN SITU tissue-specific SEQUENCING>

USES histochemistry techniques

PURPOSE

Identify how tumor celular phenotpes in breast cancer aare associated with mean FDG uptake

Workflow
Gerdes et al 2013 PNAS

shows cellular localization of expression
up to 60 proteins can be assayed at the same time

STudy design:

18 breast cancer patient samples with FDG PET SUVmean 1.46-73ohart as in Palaskas et al 2011

biomarkers and assays
microarray --> 27 biomarkers multiplexed in MultiOmyx --> 300-500 cells per ROI analsyed 

Q: single cell RNA sequencing
A: using brains cells , do single cell isolation and see how RNA correlates with FISH

	
</entry>
<entry [Tue 2014:10:21 17:47:10 EST] MARK Chaisson, EICHLER LAB - SINGLE STRAND SEQUENCING>

PacBio single mol real time seq of hydatidiform mole CHM1

naturally haploid fresulting from fertilizn of enucleated egg


243 SMRT Cells wi p5C3 chemistry

40X GRCh37

average mapped length 5.8 kbp
raw 85% acc, consensuse acc > 99.99%

Celera local assembly --> remap reads, generage Quiver consensus (pacbio) -> map consenus structural variant assembly


26,078 insertions dels >= 50bp

avg length 497 bp

control: insertion deletion rates equivalent for Alu L1 HERC (not SVA - missing sequences in reference genome?)

Used illumina sequening of other individuals - confirmed STRs --> defieicncies in reference --> "black tag" enriched 185 fold for STR expansions


complex insertion events rerpesent bot variation and an incomplete reference

used repeatMasker then mapped --> matches in chimpanzee for large, complex insertions


Used local assemlby method to close 60 gaps 398 kbps , 60 gaps , 721 kb able to extend into


NB: high GC of AT


26.000 structural variants discovered 85% acc

Q: Christopher Pearson, hosp for sick children
Alu1 insertion associated with monotonic distrophy --- any associated with genetically unstable repeat regions
A: Didn't look

Q: Smaller insert/dels
A: Didn't look

Q: StRs used for typing
A: did look at regions known for str repeats








	
	
</entry>
<entry [Tue 2014:10:21 11:49:53 EST] MedSeq PROJECT - FAMILY GENETIC TESTING PERCEPTIONS>

Explores the impact of whole genome sequencing in the everyday practice of medicine.

Followed patienst of cardiologists and primary care physicians for 6 months, with interviews. Sketched out family histories using Surgeon General's guidelines.

Genome report divided into
1) monogenic disease risk - suggestive of disease
2) carrier risk
3) pharmacogenomic testing
e.g., warfarin dosing

Asked them how important is family history and saw no change after they had gotten their results. Same result when asked how important in future.

But get different result in breakdown of utility:

At beginning:
provide reassurance 47% tested vs 35% non-tested

After 6 weeks:
ssatisfy %

curiousity: 88

What they got was not as useful as they thought they got.

Participants felt the same about family history and WGS. except for tailoring treatement which was 88% WGS vs 50% famliy history

NB: Some of the questions didn't make as much sense to the participants. When reviewing their family history was largely driven by participants with them bringing up things.

They felt you couldn't separate the genome session from the family history

bias of clinicians/researchers

At end of 6 weeks they saw much more utility if they had WGS + family history compared to just family history

Didn't give advice on health risks

Overall didn't meet expectations of participants - basically people were expecting a lot more information from WGS than they got.

Process is iterative - need to keep delving down into data and asking new questions



Kurt Christiansen

Important for families mindful of inherited disease but also wrt genetic testing research. Important to move from raw data to some kind of report.

Paitent info:
phenotype
personal history
family history
|
|
V
directionality can change


Pyeritz RE. The family history: the first genetic test, and still useful after all those years?

Genet Med 2012: 14(1):3-9





</entry>
<entry [Tue 2014:10:21 11:42:56 EST] >

challenges

1. starting up, gearing up lab, increasing bioinformatics staff genetics staff

2. classifying disorders has been an interesting challenge
we do this by the return of results committee. it's very throughtfull but it's very time consuming we are half way through after one year

3. family analysis to sort out the likely variants
coordination of getting hte family together

4. pregnancy
we are working in a preconception population so pregnancies often occur before we return our results. This presents the problem of urgency of testing parnters and puting thme in a clinical arm in a timely way.

Turnaround time is critical so we are using the return of results committee on an as-needed bases. average turnaround time in pre-conception case is less than 12 weeks

Why WGS?

Interested in non-coding regsions , particularly in deep intronic

also looking ad non-coding regions

Ducth study

Gilissen et al Dutch study showing much more info from whole genome studies


Q: George Tiller, Kaiser Permanente Southern California
Time and cost per case?
A: We started doing variant analysis with the committee and it took a week. In terms of cost that's in part 3 of our study.

Q: Of 15 positive patients, how many required no further analysis of the data?
A: I don't know but I would think quite a few of them - many are clear






	
</entry>
<entry [Mon 2014:10:20 18:00:02 EST] GENEMATCHER>
	
http://genmatcher.org

ADA HAMOSH

DEVELOPed from centers for medelian genomics (NIH) to identify cause of unsolved mendelian disorders

free sequencing for all appropriate cases with known mendelian with unknown cause and novel mendelian

www.mendelian.org

U Wash
Yale/Baylor
Hopkins


Created PhenoDB: phenodb.net

upload a pedigree
accepts image data
searchable

Upper level - anatomic : abnormal/known/unknown

expanding dropdown trees



Also developed analysis tool within PhenoDB to decide of different levels of inheritance assumptions

Output:

Excel spreadsheet of data
Links to OMIM, GeneDB, etc.


GeneMatcher -

Unsolved exome rate is probably 40%+ in families with rare/unique phenotypes

ONly deidentified
no consent requirement
no searchable
connects researchers and clinicians


Results

from Oct 2014
688 genest submitted by 174 submitters from 19 countries and 15 matches

1 paper submitted, two others in verification

Have an API for connections between GeneMatcher and phenome central

tomorrow will have meeting for version 2.0 for API for connecting between all dbs

will use ICHPT vocabulary

on website in next month

We can build the interface to connect between PhenomeCentral and Decipiher/GeneMatcher but if you're not putting in the phenotype info then you won't get the connection.

PhenoTips allows you to choose the words you want so different from PhenomeCentral but they're both great




</entry>
<entry [Mon 2014:10:20 17:44:51 EST] DECIPHER Project>

Jawahar Swaminathan

started 2004 to facilitated identification of pathogenic genetic variation in rare disorders.

A central resource so physicians can share, publish, make notes and patients know there is a resource

1300+ registered users
41,000 patients in system (moved from copy number variant to sequence variation)

15K is available freely
10K is managed access

Inputs:

patient info
variants cnv, csv

Can't contact patients

Genoverse HTML5 genome browser

https://decipher.sanger.ac.uk

D is essentially a matchmaking tool that allows people to come together
working on programmatic access

- will soon have an API that allows databases to talk together - in progress
- bulk data download


D forwards 50+ external contact requests per year

E.g., a novvel microdeletation syndrome at 9q21.1 (Eur J med genet march 2013)

D supports different levels of sharing - Private, Managed and Public (only if patient has given consent)

People are scared of sharing so it is important for use to build some sort of trust within the community then people will feel comfortable with sharing. Any system has to take consideration of what users want to see. Cliniicians have very little time - they want to see answers and quickly. Researchers want to see data in more depth.

Also data must be searchable and downloadable.


Q: consent required for public sharing - Decipher -specific?
A: No just a checkbox


Q: Annotation interface - wide population of users, do they use the same terms?
A: Yes controlled vocabulary. But I like the idea of phenotype similarity so we might steal his idea (Michael)

	
</entry>
<entry [Mon 2014:10:20 17:32:19 EST] PHENOME CENTRAL>

Michael Brudno

cofounder of gene42

physicians might not recognize known disease or may not be able to identify due to insufficient sample size

--> share case notes with other physicians

1. matches phenotypes (not yet good idea for where the threshold should be)

2. then matches genotypes

user friendly and privacy-aware portal

Used human phenotpye ontology (HPO) 10,700 + terms organized in a hierarchy and can do some queries on top of it

physician must manually submit patient

can add VCF, list of genes suspected of causing disorder, images

predictive search terms (can mistype)

validation

2 confirmed matches

1- patient in Ottowa --> unknown disorder --> input to PhenomeCentral --> matched phenotype of EFTUD2 mutation between known and unknown patients

2- STIM1 mutations explain muscle weakness, etc. symptoms in 2 patients

Started in July 2013, now 500+ patients

PhenomeCentral is part of Matchmaker Consortium (includes Care for RARE, NIH-UDP, RD-Connect)








	
</entry>
<entry [Mon 2014:10:20 17:14:09 EST] STanley Hooker,  BAylor College of Medicine>

RV - LHS

used CEU , YRI  - Guan et al 2014 local haplotype weighting based on ancestral contribution

Compared weighting to standard Wald statistic

Simulated Afrianc Am pop using US population history ..?

Out-of-Africa model (Gutenkunst 2009)

--> Simulated 10 generations of admixture, incorp 2% european sequence by random mating

LHS performas well on rare variants data

Simulated quantitative trait effect -- > ABCA1  and PCSK9

Power = 2.5 x 10--6

exome-wide signfic level for gene-based tests



</entry>
<entry [Mon 2014:10:20 17:07:51 EST] HAPLOTYPE REFERENCE CONSORTIUM>

S Das

use local haplotype similarities to reduce search space

Minimac3 compared to impute2 and beagle

How to use the HRC panel - imputation serer

will set up servers to use the panel w/o having access to the panel because of privacy concerns

Currently can do 2,000 genomes/day w/ minimac3

50M variants sequenced in 33K ssamples


increases rare variant imputation accuracy over 1K genomes phase 3 for european ancestry

HRC panel for 1K samples takes 3 months vs3.8 years

First release 1 in 1Q 2015



	
</entry>
<entry [Mon 2014:10:20 16:46:09 EST] Long range mapping in hispanic (height)>
	
http://www.ashg.org/2014meeting/abstracts/fulltext/f140123307.htm


G. Belbin


BioMe Biobank 31,000 participants

in Manhattan linked to med health records

Mtt Sinai in middle of very diverse region in NY

37% particips are hispanic

Used IBD mapping (GERMLINE, DASH, HPLOSCORE, GCTA)

--> 13 INDEPENDENT HEIGHT LOCI

MOST INTERESTING ON CHROMO 9

Haplotypic clusters show significance but not standard GWAS analysis.

Caveat - is it an extended pedigree of indivs - vast majority are not related

2 copies of the allele are 7-10 inches shorter than the rest, hiehgt is very structured and include some very tall and very short indivs

Whole genome sequencing of 4 homozygotes -- mutation in colagen Col27A1, which is involved in human bone formation (e.g., a knockout produces a dwarf mouse)

Other symptoms - scoliosis, cervical stenoisis, knee replacements, osteoporosis

Other paper -- linked to Steel syndrome in Puerto Rico



49% concordance of Col27A1 with top IBD cluster.






	
</entry>
<entry [Mon 2014:10:20 16:33:10 EST] RARE MUTATIONS DONE WELL>


Deepthi Gurdasani - 5,000 Ugandan GWAS --> 4778 indivs

Diff LD structure and smaller LD blocks in Africans

OMNI 2000 array + 4X NGS w some overlap to X-validate

GPS data, pedigree, etc.

1K genome variants --> 18.9 million variants

p-value 5x 10-8
may need a more stringenet threshold due to population structure in African pops

50 indep loci

SORT1 - LDL and Cholesterol

rs12740374


will release summary 2 whole genome sequences through EVA


</entry>