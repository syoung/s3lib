compare.archive.1


CREATE 1000 READ CHOPFILE AND TEST WITH DIFFERENT PARAMETERS
------------------------------------------------------------

INPUTFILES

chopfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/1/novoalign-chr22-1_1.1.txt /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/1/novoalign-chr22-1-1000_1.1.txt 1000

chopfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/1/novoalign-chr22-1_2.1.txt /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/1/novoalign-chr22-1-1000_2.1.txt 1000

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/1
ll *1000*txt

    -rw-rw-r-- 1 syoung root 34K Nov  3 17:42 novoalign-chr22-1-1000_1.1.txt
    -rw-rw-r-- 1 syoung root 34K Nov  3 17:42 novoalign-chr22-1-1000_2.1.txt


CREATE OUTPUT DIR
-----------------

mkdir -p /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/params
cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/params

default
-------

time /nethome/syoung/base/apps/novoalign/2.05.33/novoalign \
-o SAM \
-i 200 50 \
-d /nethome/bioinfo/data/sequence/chromosomes/human/hg19/novoalign/chr22/chr22.idx \
-f /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/1/novoalign-chr22-1-1000_1.1.txt \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/1/novoalign-chr22-1-1000_1.1.txt  \
> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/params/out.default.sam

    #     Read Sequences:      250
    #            Aligned:       30
    #   Unique Alignment:       12
    #   Gapped Alignment:        0
    #     Quality Filter:        0
    # Homopolymer Filter:        0
    #       Elapsed Time: 1,875s
    # Fragment Length Distribution
    #       From    To      Count
    # Mean   nan, Std Dev   nan
    # Done.
    
    real    0m2.557s
    user    0m2.011s
    sys     0m0.455s

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/params
lines out.default.sam

    out.default.sam: 253




r-all-1 (Reports at most 1 randomly selected alignment.)
-------

time /nethome/syoung/base/apps/novoalign/2.05.33/novoalign \
-o SAM \
-r All 1 \
-i 200 50 \
-d /nethome/bioinfo/data/sequence/chromosomes/human/hg19/novoalign/chr22/chr22.idx \
-f /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/1/novoalign-chr22-1-1000_1.1.txt \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/1/novoalign-chr22-1-1000_1.1.txt  \
> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/params/out.r-all-1.sam

    #     Read Sequences:      250
    #            Aligned:       30
    #   Unique Alignment:       12
    #   Gapped Alignment:        0
    #     Quality Filter:        0
    # Homopolymer Filter:        0
    #       Elapsed Time: 2,047s
    # Fragment Length Distribution
    #       From    To      Count
    # Mean   nan, Std Dev   nan
    # Done.
    
    real    0m21.967s
    user    0m2.146s
    sys     0m1.179s

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/params
lines out.r-all-1.sam

    253


-r Random
---------

time /nethome/syoung/base/apps/novoalign/2.05.33/novoalign \
-o SAM \
-r Random \
-i 200 50 \
-d /nethome/bioinfo/data/sequence/chromosomes/human/hg19/novoalign/chr22/chr22.idx \
-f /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/1/novoalign-chr22-1-1000_1.1.txt \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/1/novoalign-chr22-1-1000_1.1.txt  \
> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/params/out.r-random-1.sam

    #     Read Sequences:      250
    #            Aligned:       30
    #   Unique Alignment:       12
    #   Gapped Alignment:        0
    #     Quality Filter:        0
    # Homopolymer Filter:        0
    #       Elapsed Time: 1,916s
    # Fragment Length Distribution
    #       From    To      Count
    # Mean   nan, Std Dev   nan
    # Done.
    
    real    0m2.658s
    user    0m2.070s
    sys     0m0.559s

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/params
lines out.r-random-1.sam

    253


-r All (Reports all alignments with a score within 5 points of the best alignment.)
------

time /nethome/syoung/base/apps/novoalign/2.05.33/novoalign \
-o SAM \
-r All \
-i 200 50 \
-d /nethome/bioinfo/data/sequence/chromosomes/human/hg19/novoalign/chr22/chr22.idx \
-f /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/1/novoalign-chr22-1-1000_1.1.txt \
> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/params/out.r-all.sam

    #     Read Sequences:      250
    #            Aligned:       30
    #   Unique Alignment:       12
    #   Gapped Alignment:        0
    #     Quality Filter:        0
    # Homopolymer Filter:        0
    #       Elapsed Time: 1,996s
    # Fragment Length Distribution
    #       From    To      Count
    # Mean   nan, Std Dev   nan
    # Done.
    
    real    0m2.961s
    user    0m2.117s
    sys     0m0.515s


cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/params
lines out.r-all.sam

    363


-r None
-------

time /nethome/syoung/base/apps/novoalign/2.05.33/novoalign \
-o SAM \
-r None \
-i 200 50 \
-d /nethome/bioinfo/data/sequence/chromosomes/human/hg19/novoalign/chr22/chr22.idx \
-f /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/1/novoalign-chr22-1-1000_1.1.txt \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/1/novoalign-chr22-1-1000_1.1.txt  \
> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/params/out.r-none.sam
    
    #     Read Sequences:      250
    #            Aligned:       30
    #   Unique Alignment:       12
    #   Gapped Alignment:        0
    #     Quality Filter:        0
    # Homopolymer Filter:        0
    #       Elapsed Time: 1,922s
    # Fragment Length Distribution
    #       From    To      Count
    # Mean   nan, Std Dev   nan
    # Done.
    
    real    0m2.501s
    user    0m2.037s
    sys     0m0.403s


cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/params
lines out.r-none.sam

    out.r-none.sam: 253



CONVERT ALL TO hit.default.sam FILES



FILE                  HITS
out.default.sam       253
out.r-all-1.sam       253
out.r-random-1.sam    253
out.r-all.sam         363
out.r-none.sam        253


FILE                  HITS
hit.default.sam        12
hit.r-all-1.sam        30
hit.r-random-1.sam     30
hit.r-all.sam         140
hit.r-none.sam         12



grep SRR out.default.sam  | grep chr22 | cut -f 1,3,4 > hit.default.sam

    SRR002271.1015:1:1:347:652#0/1  chr22   24362133
    SRR002271.1140:1:1:518:934#0/1  chr22   16849425
    SRR002271.2972:1:1:499:509#0/1  chr22   16859449
    SRR002271.3072:1:1:927:744#0/1  chr22   49980091
    SRR002271.3768:1:1:989:778#0/1  chr22   30833992
    SRR002271.4204:1:1:815:322#0/1  chr22   51081732
    SRR002271.4568:1:1:621:965#0/1  chr22   32639520
    SRR002271.4876:1:1:955:648#0/1  chr22   35633792
    SRR002271.5667:1:1:261:529#0/1  chr22   33569484
    SRR002271.5945:1:1:271:919#0/1  chr22   31903728
    SRR002271.7729:1:1:448:497#0/1  chr22   37659425
    SRR002271.7991:1:1:412:23#0/1   chr22   32449222

grep SRR out.r-all-1.sam  | grep chr22 | cut -f 1,3,4 > hit.r-all-1.sam
    
    SRR002271.570:1:1:779:826#0/1   chr22   38259792
    SRR002271.923:1:1:772:358#0/1   chr22   47742952
    SRR002271.1015:1:1:347:652#0/1  chr22   24362133
    SRR002271.1140:1:1:518:934#0/1  chr22   16849425
    SRR002271.1398:1:1:532:128#0/1  chr22   16695934
    SRR002271.1955:1:1:591:206#0/1  chr22   41959955
    SRR002271.2189:1:1:155:490#0/1  chr22   28951565
    SRR002271.2368:1:1:802:857#0/1  chr22   25600436
    SRR002271.2883:1:1:413:806#0/1  chr22   33339112
    SRR002271.2972:1:1:499:509#0/1  chr22   16859449
    SRR002271.3072:1:1:927:744#0/1  chr22   49980091
    SRR002271.3445:1:1:604:502#0/1  chr22   42877487
    SRR002271.3768:1:1:989:778#0/1  chr22   30833992
    SRR002271.3943:1:1:72:114#0/1   chr22   34682734
    SRR002271.4085:1:1:647:369#0/1  chr22   28987010
    SRR002271.4204:1:1:815:322#0/1  chr22   51081732
    SRR002271.4485:1:1:381:110#0/1  chr22   32567764
    SRR002271.4568:1:1:621:965#0/1  chr22   32639520
    SRR002271.4876:1:1:955:648#0/1  chr22   35633792
    SRR002271.4897:1:1:420:124#0/1  chr22   16584291
    SRR002271.5098:1:1:851:448#0/1  chr22   36468412
    SRR002271.5667:1:1:261:529#0/1  chr22   33569484
    SRR002271.5799:1:1:525:262#0/1  chr22   46489509
    SRR002271.5945:1:1:271:919#0/1  chr22   31903728
    SRR002271.7687:1:1:584:597#0/1  chr22   25587389
    SRR002271.7729:1:1:448:497#0/1  chr22   37659425
    SRR002271.7991:1:1:412:23#0/1   chr22   32449222
    SRR002271.8237:1:1:828:242#0/1  chr22   50005573
    SRR002271.8419:1:1:867:234#0/1  chr22   22633911
    SRR002271.8554:1:1:827:210#0/1  chr22   28785897

grep SRR out.r-random-1.sam  | grep chr22 | cut -f 1,3,4 > hit.r-random-1.sam

    SRR002271.570:1:1:779:826#0/1   chr22   26241205
    SRR002271.923:1:1:772:358#0/1   chr22   22407093
    SRR002271.1015:1:1:347:652#0/1  chr22   24362133
    SRR002271.1140:1:1:518:934#0/1  chr22   16849425
    SRR002271.1398:1:1:532:128#0/1  chr22   28785350
    SRR002271.1955:1:1:591:206#0/1  chr22   21911927
    SRR002271.2189:1:1:155:490#0/1  chr22   28951565
    SRR002271.2368:1:1:802:857#0/1  chr22   25748980
    SRR002271.2883:1:1:413:806#0/1  chr22   17142920
    SRR002271.2972:1:1:499:509#0/1  chr22   16859449
    SRR002271.3072:1:1:927:744#0/1  chr22   49980091
    SRR002271.3445:1:1:604:502#0/1  chr22   18590959
    SRR002271.3768:1:1:989:778#0/1  chr22   30833992
    SRR002271.3943:1:1:72:114#0/1   chr22   34682734
    SRR002271.4085:1:1:647:369#0/1  chr22   39328110
    SRR002271.4204:1:1:815:322#0/1  chr22   51081732
    SRR002271.4485:1:1:381:110#0/1  chr22   32567764
    SRR002271.4568:1:1:621:965#0/1  chr22   32639520
    SRR002271.4876:1:1:955:648#0/1  chr22   35633792
    SRR002271.4897:1:1:420:124#0/1  chr22   16548698
    SRR002271.5098:1:1:851:448#0/1  chr22   32897734
    SRR002271.5667:1:1:261:529#0/1  chr22   33569484
    SRR002271.5799:1:1:525:262#0/1  chr22   19826236
    SRR002271.5945:1:1:271:919#0/1  chr22   31903728
    SRR002271.7687:1:1:584:597#0/1  chr22   29289752
    SRR002271.7729:1:1:448:497#0/1  chr22   37659425
    SRR002271.7991:1:1:412:23#0/1   chr22   32449222
    SRR002271.8237:1:1:828:242#0/1  chr22   41296466
    SRR002271.8419:1:1:867:234#0/1  chr22   34948411
    SRR002271.8554:1:1:827:210#0/1  chr22   28785897

grep SRR out.r-all.sam  | grep chr22 | cut -f 1,3,4 > hit.r-all.sam

    SRR002271.570:1:1:779:826#0/1   chr22   38259792
    SRR002271.570:1:1:779:826#0/1   chr22   26241205
    SRR002271.923:1:1:772:358#0/1   chr22   47742952
    SRR002271.923:1:1:772:358#0/1   chr22   22528592
    SRR002271.923:1:1:772:358#0/1   chr22   28564372
    SRR002271.923:1:1:772:358#0/1   chr22   39613521
    SRR002271.923:1:1:772:358#0/1   chr22   22407093
    SRR002271.1015:1:1:347:652#0/1  chr22   24362133
    SRR002271.1140:1:1:518:934#0/1  chr22   16849425
    SRR002271.1398:1:1:532:128#0/1  chr22   16695934
    SRR002271.1398:1:1:532:128#0/1  chr22   28483107
    SRR002271.1398:1:1:532:128#0/1  chr22   28732346
    SRR002271.1398:1:1:532:128#0/1  chr22   17144848
    SRR002271.1398:1:1:532:128#0/1  chr22   16996076
    SRR002271.1398:1:1:532:128#0/1  chr22   28785350
    SRR002271.1398:1:1:532:128#0/1  chr22   28436183
    SRR002271.1398:1:1:532:128#0/1  chr22   32693160
    SRR002271.1398:1:1:532:128#0/1  chr22   49384097
    SRR002271.1398:1:1:532:128#0/1  chr22   22633695
    SRR002271.1398:1:1:532:128#0/1  chr22   35565255
    SRR002271.1398:1:1:532:128#0/1  chr22   28433113
    SRR002271.1398:1:1:532:128#0/1  chr22   29062745
    SRR002271.1398:1:1:532:128#0/1  chr22   28563269
    SRR002271.1398:1:1:532:128#0/1  chr22   35188286
    SRR002271.1398:1:1:532:128#0/1  chr22   34948195
    SRR002271.1398:1:1:532:128#0/1  chr22   35216377
    SRR002271.1955:1:1:591:206#0/1  chr22   41959955
    SRR002271.1955:1:1:591:206#0/1  chr22   21911927
    SRR002271.2189:1:1:155:490#0/1  chr22   28951565
    SRR002271.2189:1:1:155:490#0/1  chr22   32433701
    SRR002271.2368:1:1:802:857#0/1  chr22   25600436
    SRR002271.2368:1:1:802:857#0/1  chr22   25748980
    SRR002271.2883:1:1:413:806#0/1  chr22   33339112
    SRR002271.2883:1:1:413:806#0/1  chr22   29060816
    SRR002271.2883:1:1:413:806#0/1  chr22   35214446
    SRR002271.2883:1:1:413:806#0/1  chr22   17481976
    SRR002271.2883:1:1:413:806#0/1  chr22   16442427
    SRR002271.2883:1:1:413:806#0/1  chr22   34950121
    SRR002271.2883:1:1:413:806#0/1  chr22   17248528
    SRR002271.2883:1:1:413:806#0/1  chr22   35146060
    SRR002271.2883:1:1:413:806#0/1  chr22   25739275
    SRR002271.2883:1:1:413:806#0/1  chr22   22635623
    SRR002271.2883:1:1:413:806#0/1  chr22   49386026
    SRR002271.2883:1:1:413:806#0/1  chr22   35563328
    SRR002271.2883:1:1:413:806#0/1  chr22   28787277
    SRR002271.2883:1:1:413:806#0/1  chr22   17142920
    SRR002271.2883:1:1:413:806#0/1  chr22   47745748
    SRR002271.2883:1:1:413:806#0/1  chr22   32695089
    SRR002271.2883:1:1:413:806#0/1  chr22   40238189
    SRR002271.2972:1:1:499:509#0/1  chr22   16859449
    SRR002271.3072:1:1:927:744#0/1  chr22   49980091
    SRR002271.3445:1:1:604:502#0/1  chr22   42877487
    SRR002271.3445:1:1:604:502#0/1  chr22   18590959
    SRR002271.3768:1:1:989:778#0/1  chr22   30833992
    SRR002271.3943:1:1:72:114#0/1   chr22   34682734
    SRR002271.3943:1:1:72:114#0/1   chr22   43707514
    SRR002271.3943:1:1:72:114#0/1   chr22   16984517
    SRR002271.3943:1:1:72:114#0/1   chr22   29212200
    SRR002271.4085:1:1:647:369#0/1  chr22   28987010
    SRR002271.4085:1:1:647:369#0/1  chr22   39328110
    SRR002271.4085:1:1:647:369#0/1  chr22   29527533
    SRR002271.4085:1:1:647:369#0/1  chr22   31020030
    SRR002271.4204:1:1:815:322#0/1  chr22   51081732
    SRR002271.4485:1:1:381:110#0/1  chr22   32567764
    SRR002271.4485:1:1:381:110#0/1  chr22   36524009
    SRR002271.4568:1:1:621:965#0/1  chr22   32639520
    SRR002271.4876:1:1:955:648#0/1  chr22   35633792
    SRR002271.4897:1:1:420:124#0/1  chr22   16584291
    SRR002271.4897:1:1:420:124#0/1  chr22   16516478
    SRR002271.4897:1:1:420:124#0/1  chr22   16549321
    SRR002271.4897:1:1:420:124#0/1  chr22   16548698
    SRR002271.5098:1:1:851:448#0/1  chr22   36468412
    SRR002271.5098:1:1:851:448#0/1  chr22   46169601
    SRR002271.5098:1:1:851:448#0/1  chr22   32897734
    SRR002271.5098:1:1:851:448#0/1  chr22   43441580
    SRR002271.5098:1:1:851:448#0/1  chr22   21268241
    SRR002271.5667:1:1:261:529#0/1  chr22   33569484
    SRR002271.5799:1:1:525:262#0/1  chr22   46489509
    SRR002271.5799:1:1:525:262#0/1  chr22   22779525
    SRR002271.5799:1:1:525:262#0/1  chr22   41248001
    SRR002271.5799:1:1:525:262#0/1  chr22   27525796
    SRR002271.5799:1:1:525:262#0/1  chr22   32760553
    SRR002271.5799:1:1:525:262#0/1  chr22   19853990
    SRR002271.5799:1:1:525:262#0/1  chr22   37528028
    SRR002271.5799:1:1:525:262#0/1  chr22   28993970
    SRR002271.5799:1:1:525:262#0/1  chr22   24702129
    SRR002271.5799:1:1:525:262#0/1  chr22   28934330
    SRR002271.5799:1:1:525:262#0/1  chr22   30426972
    SRR002271.5799:1:1:525:262#0/1  chr22   19826236
    SRR002271.5799:1:1:525:262#0/1  chr22   35532347
    SRR002271.5799:1:1:525:262#0/1  chr22   38107314
    SRR002271.5799:1:1:525:262#0/1  chr22   30507203
    SRR002271.5799:1:1:525:262#0/1  chr22   43112092
    SRR002271.5799:1:1:525:262#0/1  chr22   24393120
    SRR002271.5799:1:1:525:262#0/1  chr22   41580107
    SRR002271.5799:1:1:525:262#0/1  chr22   45137492
    SRR002271.5799:1:1:525:262#0/1  chr22   29564051
    SRR002271.5799:1:1:525:262#0/1  chr22   20949782
    SRR002271.5799:1:1:525:262#0/1  chr22   39000912
    SRR002271.5799:1:1:525:262#0/1  chr22   36698422
    SRR002271.5799:1:1:525:262#0/1  chr22   45239437
    SRR002271.5799:1:1:525:262#0/1  chr22   40904242
    SRR002271.5799:1:1:525:262#0/1  chr22   43571948
    SRR002271.5799:1:1:525:262#0/1  chr22   34852363
    SRR002271.5799:1:1:525:262#0/1  chr22   18558166
    SRR002271.5945:1:1:271:919#0/1  chr22   31903728
    SRR002271.7687:1:1:584:597#0/1  chr22   25587389
    SRR002271.7687:1:1:584:597#0/1  chr22   29289752
    SRR002271.7687:1:1:584:597#0/1  chr22   30927428
    SRR002271.7687:1:1:584:597#0/1  chr22   23713813
    SRR002271.7687:1:1:584:597#0/1  chr22   38095814
    SRR002271.7729:1:1:448:497#0/1  chr22   37659425
    SRR002271.7991:1:1:412:23#0/1   chr22   32449222
    SRR002271.8237:1:1:828:242#0/1  chr22   50005573
    SRR002271.8237:1:1:828:242#0/1  chr22   45609747
    SRR002271.8237:1:1:828:242#0/1  chr22   45019110
    SRR002271.8237:1:1:828:242#0/1  chr22   19151903
    SRR002271.8237:1:1:828:242#0/1  chr22   31117070
    SRR002271.8237:1:1:828:242#0/1  chr22   44562116
    SRR002271.8237:1:1:828:242#0/1  chr22   16454089
    SRR002271.8237:1:1:828:242#0/1  chr22   41296466
    SRR002271.8237:1:1:828:242#0/1  chr22   42162021
    SRR002271.8237:1:1:828:242#0/1  chr22   42055815
    SRR002271.8419:1:1:867:234#0/1  chr22   22633911
    SRR002271.8419:1:1:867:234#0/1  chr22   49384313
    SRR002271.8419:1:1:867:234#0/1  chr22   29062529
    SRR002271.8419:1:1:867:234#0/1  chr22   16359304
    SRR002271.8419:1:1:867:234#0/1  chr22   17508407
    SRR002271.8419:1:1:867:234#0/1  chr22   28785566
    SRR002271.8419:1:1:867:234#0/1  chr22   28482891
    SRR002271.8419:1:1:867:234#0/1  chr22   17144632
    SRR002271.8419:1:1:867:234#0/1  chr22   28432900
    SRR002271.8419:1:1:867:234#0/1  chr22   17250241
    SRR002271.8419:1:1:867:234#0/1  chr22   34948411
    SRR002271.8419:1:1:867:234#0/1  chr22   28563052
    SRR002271.8554:1:1:827:210#0/1  chr22   28785897
    SRR002271.8554:1:1:827:210#0/1  chr22   47744598
    SRR002271.8554:1:1:827:210#0/1  chr22   25737891
    SRR002271.8554:1:1:827:210#0/1  chr22   16480575
    SRR002271.8554:1:1:827:210#0/1  chr22   24008213

grep SRR out.r-none.sam  | grep chr22 | cut -f 1,3,4 > hit.r-none.sam

    SRR002271.1015:1:1:347:652#0/1  chr22   24362133
    SRR002271.1140:1:1:518:934#0/1  chr22   16849425
    SRR002271.2972:1:1:499:509#0/1  chr22   16859449
    SRR002271.3072:1:1:927:744#0/1  chr22   49980091
    SRR002271.3768:1:1:989:778#0/1  chr22   30833992
    SRR002271.4204:1:1:815:322#0/1  chr22   51081732
    SRR002271.4568:1:1:621:965#0/1  chr22   32639520
    SRR002271.4876:1:1:955:648#0/1  chr22   35633792
    SRR002271.5667:1:1:261:529#0/1  chr22   33569484
    SRR002271.5945:1:1:271:919#0/1  chr22   31903728
    SRR002271.7729:1:1:448:497#0/1  chr22   37659425
    SRR002271.7991:1:1:412:23#0/1   chr22   32449222



COMPARE OUTPUT FILES WITH samVenn.pl

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/params


perl /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/samVenn.pl \
--queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/params/hit.r-none.sam \
--targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/params/hit.default.sam \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/params \
--querylabel none \
--targetlabel default 


perl /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/samVenn.pl \
--queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/params/hit.r-none.sam \
--targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/params/hit.r-all-1.sam \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/params \
--querylabel none \
--targetlabel r-all-1 


perl /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/samVenn.pl \
--queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/params/hit.r-none.sam \
--targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/params/hit.r-random-1.sam \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/params \
--querylabel none \
--targetlabel r-random-1 


perl /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/samVenn.pl \
--queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/params/hit.r-none.sam \
--targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/params/hit.r-all.sam \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/params \
--querylabel none \
--targetlabel r-all 



perl /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/samVenn.pl \
--queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/params/hit.r-none.sam \
--targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/params/hit.default.sam \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/params \
--querylabel none \
--targetlabel default 



cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/params

lines venn/*

    none-AND-r-all-1: 12
    none-NOT-r-all-1: 0
    r-all-1-NOT-none: 18

    none-AND-r-random-1: 12
    none-NOT-r-random-1: 0
    r-random-1-NOT-none: 18

    none-AND-r-all: 12
    none-NOT-r-all: 0
    r-all-NOT-none: 128


RUN 'none' IS IDENTICAL TO DEFAULT NOVOALIGN SETTINGS:

    none-AND-default: 12
    none-NOT-default: 0
    default-NOT-none: 0


lines hit*sam

    hit.r-all-1.sam: 30
    hit.r-all.sam: 140
    hit.r-none.sam: 12
    hit.r-random-1.sam: 30


lines out*sam

out.r-all-1.sam: 253
out.r-all.sam: 363
out.r-exhaustive-1.sam: 0
out.r-exhaustive-t-1.sam: 0
out.r-none.sam: 253
out.r-random-1.sam: 253




REPEATED ABOVE BUT WITH BOTH PAIRED FILES
-----------------------------------------


CREATE OUTPUT DIR
-----------------

mkdir -p /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/params/paired
cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/params/paired


default
-------

time /nethome/syoung/base/apps/novoalign/2.05.33/novoalign \
-o SAM \
-i 200 50 \
-d /nethome/bioinfo/data/sequence/chromosomes/human/hg19/novoalign/chr22/chr22.idx \
-f /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/1/novoalign-chr22-1-1000_1.1.txt \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/1/novoalign-chr22-1-1000_2.1.txt  \
> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/params/paired/out.default.sam


    #       Paired Reads:      250
    #      Pairs Aligned:       16
    #     Read Sequences:      500
    #            Aligned:       68
    #   Unique Alignment:       32
    #   Gapped Alignment:        2
    #     Quality Filter:        1
    # Homopolymer Filter:        0
    #       Elapsed Time: 25,048s
    # Fragment Length Distribution
    #       From    To      Count
    #       110     119     1
    #       120     129     0
    #       130     139     0
    #       140     149     0
    #       150     159     0
    #       160     169     0
    #       170     179     0
    #       180     189     2
    #       190     199     1
    #       200     209     1
    #       210     219     4
    #       220     229     0
    #       230     239     1
    # Mean   198, Std Dev  31.3
    # Done.
    
    real    0m25.418s
    user    0m25.141s
    sys     0m0.252s


r-all-1 (Reports at most 1 'randomly selected' alignment.)
-------

'randomly selected' ACCORDING TO:

http://www.novocraft.com/wiki/tiki-index.php?page=Reporting+Multiple+Alignments+per+Read&structure=Novocraft+Technologies&page_ref_id=41


time /nethome/syoung/base/apps/novoalign/2.05.33/novoalign \
-o SAM \
-r All 1 \
-i 200 50 \
-d /nethome/bioinfo/data/sequence/chromosomes/human/hg19/novoalign/chr22/chr22.idx \
-f /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/1/novoalign-chr22-1-1000_1.1.txt \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/1/novoalign-chr22-1-1000_2.1.txt  \
> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/params/paired/out.r-all-1.sam

    
    #       Paired Reads:      250
    #      Pairs Aligned:       16
    #     Read Sequences:      500
    #            Aligned:       68
    #   Unique Alignment:       32
    #   Gapped Alignment:        4
    #     Quality Filter:        1
    # Homopolymer Filter:        0
    #       Elapsed Time: 24,995s
    # Fragment Length Distribution
    #       From    To      Count
    #       110     119     1
    #       120     129     0
    #       130     139     0
    #       140     149     0
    #       150     159     0
    #       160     169     0
    #       170     179     0
    #       180     189     2
    #       190     199     1
    #       200     209     1
    #       210     219     4
    #       220     229     0
    #       230     239     1
    # Mean   198, Std Dev  31.3
    # Done.
    
    real    0m25.335s
    user    0m25.077s
    sys     0m0.239s
    

-r Random (Reports at most 1 randomly selected alignment.)
---------

time /nethome/syoung/base/apps/novoalign/2.05.33/novoalign \
-o SAM \
-r Random \
-i 200 50 \
-d /nethome/bioinfo/data/sequence/chromosomes/human/hg19/novoalign/chr22/chr22.idx \
-f /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/1/novoalign-chr22-1-1000_1.1.txt \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/1/novoalign-chr22-1-1000_2.1.txt  \
> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/params/paired/out.r-random.sam
    
    #       Paired Reads:      250
    #      Pairs Aligned:       16
    #     Read Sequences:      500
    #            Aligned:       68
    #   Unique Alignment:       32
    #   Gapped Alignment:        4
    #     Quality Filter:        1
    # Homopolymer Filter:        0
    #       Elapsed Time: 24,945s
    # Fragment Length Distribution
    #       From    To      Count
    #       110     119     1
    #       120     129     0
    #       130     139     0
    #       140     149     0
    #       150     159     0
    #       160     169     0
    #       170     179     0
    #       180     189     2
    #       190     199     1
    #       200     209     1
    #       210     219     4
    #       220     229     0
    #       230     239     1
    # Mean   198, Std Dev  31.3
    # Done.
    
    real    0m25.330s
    user    0m25.027s
    sys     0m0.269s


-r All
------

time /nethome/syoung/base/apps/novoalign/2.05.33/novoalign \
-o SAM \
-r All \
-i 200 50 \
-d /nethome/bioinfo/data/sequence/chromosomes/human/hg19/novoalign/chr22/chr22.idx \
-f /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/1/novoalign-chr22-1-1000_1.1.txt \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/1/novoalign-chr22-1-1000_2.1.txt  \
> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/params/paired/out.r-all.sam
        
    #       Paired Reads:      250
    #      Pairs Aligned:       16
    #     Read Sequences:      500
    #            Aligned:       68
    #   Unique Alignment:       32
    #   Gapped Alignment:       12
    #     Quality Filter:        1
    # Homopolymer Filter:        0
    #       Elapsed Time: 24,997s
    # Fragment Length Distribution
    #       From    To      Count
    #       110     119     1
    #       120     129     0
    #       130     139     0
    #       140     149     0
    #       150     159     0
    #       160     169     0
    #       170     179     0
    #       180     189     2
    #       190     199     1
    #       200     209     1
    #       210     219     4
    #       220     229     0
    #       230     239     1
    # Mean   198, Std Dev  31.3
    # Done.
    
    real    0m25.352s
    user    0m25.099s
    sys     0m0.242s

-r None
-------

time /nethome/syoung/base/apps/novoalign/2.05.33/novoalign \
-o SAM \
-r None \
-i 200 50 \
-d /nethome/bioinfo/data/sequence/chromosomes/human/hg19/novoalign/chr22/chr22.idx \
-f /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/1/novoalign-chr22-1-1000_1.1.txt \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/1/novoalign-chr22-1-1000_2.1.txt  \
> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/params/paired/out.r-none.sam






CONVERT ALL TO hit.default.sam FILES

grep SRR out.default.sam  | grep chr22 > hit.default.sam
grep SRR out.r-all-1.sam  | grep chr22 > hit.r-all-1.sam
grep SRR out.r-all.sam  | grep chr22 > hit.r-all.sam
grep SRR out.r-random.sam  | grep chr22 > hit.r-random.sam
grep SRR out.r-none.sam  | grep chr22 > hit.r-none.sam



grep SRR out.default.sam  | grep chr22 | cut -f 1,3,4 
grep SRR out.r-all-1.sam  | grep chr22 | cut -f 1,3,4 
grep SRR out.r-all.sam  | grep chr22 | cut -f 1,3,4 
grep SRR out.r-random.sam  | grep chr22 | cut -f 1,3,4 
grep SRR out.r-none.sam  | grep chr22 | cut -f 1,3,4 



FILE                HITS
hit.default.sam		 42
hit.r-all-1.sam		 92
hit.r-all.sam		602
hit.r-none.sam		 42
hit.r-random.sam	 92



grep SRR out.default.sam  | grep chr22 | cut -f 1,3,4 > hit.default.sam
 

LARGE DEGREE OF READ RECRUITMENT IN HITS USING PAIRED ENDS:

grep SRR out.default.sam  | grep chr22 | cut -f 1,3,4 

    SRR002271.1015:1:1:347:652#0/1  chr22   24362133
    SRR002271.1140:1:1:518:934#0/1  chr22   16849425
    SRR002271.2972:1:1:499:509#0/1  chr22   16859449
    SRR002271.3072:1:1:927:744#0/1  chr22   49980091
    SRR002271.3768:1:1:989:778#0/1  chr22   30833992
    SRR002271.4204:1:1:815:322#0/1  chr22   51081732
    SRR002271.4568:1:1:621:965#0/1  chr22   32639520
    SRR002271.4876:1:1:955:648#0/1  chr22   35633792
    SRR002271.5667:1:1:261:529#0/1  chr22   33569484
    SRR002271.5945:1:1:271:919#0/1  chr22   31903728
    SRR002271.7729:1:1:448:497#0/1  chr22   37659425
    SRR002271.7991:1:1:412:23#0/1   chr22   32449222

cd paired
grep SRR out.default.sam  | grep chr22 | cut -f 1,3,4 

    SRR002271.570:1:1:779:826#0     chr22   49326746
    SRR002271.570:1:1:779:826#0     chr22   49326746
    SRR002271.1015:1:1:347:652#0    chr22   24362133
    SRR002271.1015:1:1:347:652#0    chr22   24362133
    SRR002271.1140:1:1:518:934#0    chr22   16849425
    SRR002271.1140:1:1:518:934#0    chr22   16849499
    SRR002271.1398:1:1:532:128#0    chr22   35565255
    SRR002271.1398:1:1:532:128#0    chr22   35565052
    SRR002271.2368:1:1:802:857#0    chr22   29618288
    SRR002271.2368:1:1:802:857#0    chr22   29618288
    SRR002271.2972:1:1:499:509#0    chr22   16859449
    SRR002271.2972:1:1:499:509#0    chr22   16859449
    SRR002271.3072:1:1:927:744#0    chr22   49980091
    SRR002271.3072:1:1:927:744#0    chr22   49979916
    SRR002271.3768:1:1:989:778#0    chr22   45840188
    SRR002271.3768:1:1:989:778#0    chr22   45840035
    SRR002271.4204:1:1:815:322#0    chr22   51081732
    SRR002271.4204:1:1:815:322#0    chr22   51081732
    SRR002271.4298:1:1:551:636#0    chr22   30487586
    SRR002271.4298:1:1:551:636#0    chr22   30487586
    SRR002271.4485:1:1:381:110#0    chr22   21074772
    SRR002271.4485:1:1:381:110#0    chr22   21074772
    SRR002271.4568:1:1:621:965#0    chr22   32639520
    SRR002271.4568:1:1:621:965#0    chr22   32639692
    SRR002271.4876:1:1:955:648#0    chr22   35633792
    SRR002271.4876:1:1:955:648#0    chr22   35633975
    SRR002271.5667:1:1:261:529#0    chr22   33569484
    SRR002271.5667:1:1:261:529#0    chr22   33569308
    SRR002271.5734:1:1:777:616#0    chr22   34915214
    SRR002271.5734:1:1:777:616#0    chr22   34915391
    SRR002271.5945:1:1:271:919#0    chr22   31903728
    SRR002271.5945:1:1:271:919#0    chr22   44008877
    SRR002271.6539:1:1:687:954#0    chr22   42458296
    SRR002271.6539:1:1:687:954#0    chr22   42458296
    SRR002271.7729:1:1:448:497#0    chr22   37659425
    SRR002271.7729:1:1:448:497#0    chr22   37659425
    SRR002271.7991:1:1:412:23#0     chr22   32449222
    SRR002271.7991:1:1:412:23#0     chr22   32449060
    SRR002271.8085:1:1:810:933#0    chr22   38739159
    SRR002271.8085:1:1:810:933#0    chr22   38739159
    SRR002271.8554:1:1:827:210#0    chr22   47744598
    SRR002271.8554:1:1:827:210#0    chr22   47744445





NOTES
-----



TEST RUN NOVOALIGN ON USER NODE
-------------------------------

screen -S test-novo

time /nethome/syoung/base/apps/novoalign/2.05.33/novoalign \
-o SAM \
-r All 1 \
-i 200 50 \
-d /nethome/bioinfo/data/sequence/chromosomes/human/hg19/novoalign/chr22/chr22.idx \
-f /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/1/novoalign-chr22-1_1.1.txt /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/1/novoalign-chr22-1_2.1.txt \
> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/chr22/1/out.sam



TOOK 24 HOURS TO COMPLETE!!!

    
    #       Paired Reads:  1000000
    #      Pairs Aligned:    98744
    #     Read Sequences:  2000000
    #            Aligned:   320587
    #   Unique Alignment:   183009
    #   Gapped Alignment:     7517
    #     Quality Filter:    38641
    # Homopolymer Filter:      548
    #       Elapsed Time: 86286,422s
    # Fragment Length Distribution
    #       From    To      Count
    #       30      39      323
    #       40      49      730
    #       50      59      470
    #       60      69      201
    #       70      79      152
    #       80      89      163
    #       90      99      131
    #       100     109     118
    #       110     119     130
    #       120     129     178
    #       130     139     208
    #       140     149     172
    #       150     159     226
    #       160     169     274
    #       170     179     677
    #       180     189     3362
    #       190     199     10613
    #       200     209     15173
    #       210     219     13673
    #       220     229     9330
    #       230     239     3651
    #       240     249     805
    #       250     259     321
    #       260     269     188
    #       270     279     132
    #       280     289     147
    #       290     299     137
    #       300     309     114
    #       310     319     104
    #       320     329     94
    #       330     339     83
    #       340     349     70
    #       350     359     87
    #       360     369     111
    #       370     379     107
    #       380     389     82
    #       390     399     86
    #       400     409     97
    #       410     419     89
    #       420     429     20
    #       430     439     33
    #       440     449     15
    #       450     459     2
    #       460     469     28
    #       470     479     9
    #       480     489     46
    #       490     499     57
    # Mean   207, Std Dev  42.6
    # Done.
    
    real    1438m12.220s
    user    1434m10.055s
    sys     2m18.045s



SAM FILE READ PAIR INFO IN FLAG FIELD
-------------------------------------


E.G.: NOVOALIGN hit.sam FILE ENTRIES CONTAIN READ PAIR NUMBER INFORMATION IN THE FLAG FIELD (2nd COLUMN)

head -n 100 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/novoalign/1/chr22/1/out.sam

    ... 
    SRR002271.1398:1:1:532:128#0    83      chr22   35565255        12      36M     =       35565052 -239     CCTATCAATAGAAAAAGAGGGAATCCTCCCTAACTC    2*/I0,IIIIIIIIIIIIIIIIIFIIIIIIIIIIII    PG:Z:novoalign    AS:i:21 UQ:i:21 NM:i:1  MD:Z:2A33       PQ:i:21 SM:i:0  AM:i:0
    SRR002271.1398:1:1:532:128#0    163     chr22   35565052        12      36M     =       35565255 239      AATGGATAAATTCCTTGACACATACACCCTCCCAAG    IIIIIIIIIIIIIIIIII=IIIII1III;77II4+F    PG:Z:novoalign    AS:i:0  UQ:i:0  NM:i:0  MD:Z:36 PQ:i:21 SM:i:0  AM:i:0
    ... 



SAM FORMAT
----------


The alignment section consists of multiple TAB-delimited lines with each line describing an alignment. Each line is:

    <QNAME> <FLAG> <RNAME> <POS> <MAPQ> <CIGAR> <MRNM> <MPOS> <ISIZE> <SEQ> <QUAL> \
    [<TAG>:<VTYPE>:<VALUE> [...]]

The format of each field is explained in the following table. More detailed descriptions are given in the sections below.

Field Regular expression Range Description

    QNAME [^ \t\n\r]+ Query pair NAME if paired; or Query NAME if unpaired 2
    FLAG [0-9]+ [0,216-1] bitwise FLAG (Section 2.2.2)
    RNAME [^ \t\n\r@=]+ Reference sequence NAME 3
    POS [0-9]+ [0,229-1] 1-based leftmost POSition/coordinate of the clipped sequence
    MAPQ [0-9]+ [0,28-1] MAPping Quality (phred-scaled posterior probability that the mapping
    position of this read is incorrect) 4
    CIGAR ([0-9]+[MIDNSHP])+|\* extended CIGAR string
    MRNM [^ \t\n\r@]+ Mate Reference sequence NaMe; = if the same as <RNAME> 3
    MPOS [0-9]+ [0,229-1] 1-based leftmost Mate POSition of the clipped sequence
    ISIZE -?[0-9]+ [-229,229] inferred Insert SIZE 5
    SEQ [acgtnACGTN.=]+|\* query SEQuence; = for a match to the reference; n/N/. for ambiguity;
    cases are not maintained 6,7
    QUAL [!-~]+|\* [0,93] query QUALity; ASCII-33 gives the Phred base quality 6,7
    TAG [A-Z][A-Z0-9] TAG
    VTYPE [AifZH] Value TYPE
    VALUE [^\t\n\r]+ match <VTYPE> (space allowed)

Notes:

1. QNAME and FLAG are required for all alignments. If the mapping position of the query is not available, RNAME and
CIGAR are set as *, and POS and MAPQ as 0. If the query is unpaired or pairing information is not available, MRNM
equals *, and MPOS and ISIZE equal 0. SEQ and QUAL can both be absent, represented as a star *. If QUAL is
not a star, it must be of the same length as SEQ.
2. The name of a pair/read is required to be unique in the SAM file, but one pair/read may appear multiple times in
different alignment records, representing multiple or split hits. The maximum string length is 254.
3. If SQ is present in the header, RNAME and MRNM must appear in an SQ header record.
4. Field MAPQ considers pairing in calculation if the read is paired. Providing MAPQ is recommended. If such a
calculation is difficult, 255 should be applied, indicating the mapping quality is not available.
5. If the two reads in a pair are mapped to the same reference, ISIZE equals the difference between the coordinate of
the 5?-end of the mate and of the 5?-end of the current read; otherwise ISIZE equals 0 (by the 5?-end we mean the
5?-end of the original read, so for Illumina short-insert paired end reads this calculates the difference in mapping
coordinates of the outer edges of the original sequenced fragment). ISIZE is negative if the mate is mapped to a
smaller coordinate than the current read.
6. Color alignments are stored as normal nucleotide alignments with additional tags describing the raw color
sequences, qualities and color-specific properties (see also Note 5 in section 2.2.4).
7. All mapped reads are represented on the forward genomic strand. The bases are reverse complemented from the
unmapped read sequence and the quality scores and cigar strings are recorded consistently with the bases. This
applies to information in the mate tags (R2, Q2, S2, etc.) and any other tags that are strand sensitive. The strand
bits in the flag simply indicates whether this reverse complement transform was applied from the original read
sequence to obtain the bases listed in the SAM file.



2.2.2. The <flag> field
Field <flag> is a bitwise flag. The meaning of predefined bits is shown in the following table:


Flag Description

0x0001 the read is paired in sequencing, no matter whether it is mapped in a pair
0x0002 the read is mapped in a proper pair (depends on the protocol, normally inferred during alignment) 1
0x0004 the query sequence itself is unmapped
0x0008 the mate is unmapped 1
0x0010 strand of the query (0 for forward; 1 for reverse strand)
0x0020 strand of the mate 1
0x0040 the read is the first read in a pair 1,2
0x0080 the read is the second read in a pair 1,2
0x0100 the alignment is not primary (a read having split hits may have multiple primary alignment records)
0x0200 the read fails platform/vendor quality checks
0x0400 the read is either a PCR duplicate or an optical duplicate

Notes:
1. Flag 0x02, 0x08, 0x20, 0x40 and 0x80 are only meaningful when flag 0x01 is present.
2. If in a read pair the information on which read is the first in the pair is lost in the upstream analysis, flag 0x01 should
be present and 0x40 and 0x80 are both zero.


SAM TAGS
--------

What are TAGs?
TAGs are optional fields on a SAM/BAM Alignment. A TAG is comprised of a two character TAG key, they type of the value, and the value:

[A-Za-z][A-za-z]:[AifZH]:.*

The types, A, i, f, Z, H are used to indicate the type of value stored in the tag.

		Type	Description
		A	character
		i	signed 32-bit integer
		f	single-precision float
		Z	string
		H	hex string

There are a set of predefined tags that are general used in Alignments. They are documented in the SAM Specification.

Predefined tags have been specified for storing information about the read or alignment. Examples of things stored in predefined tags:

Previous settings for various fields if they have been updated due to additional processing
Mappings from the alignment to Header values, used to match to a read group or program.

Additional information which may already be in the header like library and platform.

A user can also use any additional tags to store any information they want. TAGs starting with X, Y, or Z are reserved to be user defined.



Examples:

XT:A:U  - user defined tag called XT.  It holds a character.  The value associated with this tag is 'U'.
NM:i:2  - predefined tag NM means: Edit distance to the reference (number of changes necessary to make this equal the reference, excluding clipping)




SAM TAGS:

AM	i	Smaller single-end mapping quality of the two reads in a pair
AS	i	Alignment score generated by aligner
CC	Z	Reference name of the next hit; = for the same chromosome
CM	i	Number of color differences 2
CP	i	Leftmost coordinate of the next hit
CQ	Z	Color read quality on the same strand as the reference; encoded in the same way as <QUAL> 4
CS	Z	Color read sequence on the same strand as the reference 4
E2	Z	The 2nd most likely base base call.
H0	i	Number of perfect hits 2
H1	i	Number of 1-difference hits (an in/del counted as a difference) 2
H2	i	Number of 2-difference hits (an in/del counted as a difference) 2
HI	i	"Query hit index, indicating the alignment record is the i-th one stored in SAM"
IH	i	Number of stored alignments in SAM that contains the query in the current record
LB	Z	Library. Value should be consistent with the header RG-LB tag if @RG is present.
MD	Z	"String for mismatching positions in the format of [0-9]+(([ACGTN]|\^[ACGTN]+)[0-9]+)* 2,3"
MF	i	MAQ pair flag (MAQ specific)
MQ	i	The mapping quality score the mate alignment
NH	i	Number of reported alignments that contains the query in the current record
NM	i	Number of nucleotide differences (i.e. edit distance to the reference sequence) 2
OQ	Z	Original base quality. Encoded in the same wasy as QUAL.
PG	Z	Program that generates the alignment; match the header PG-ID tag if @PG is present.
PQ	i	"Phred likelihood of the read pair, conditional on both the mapping locations being correct 5"
PU	Z	Platform unit. Value should be consistent with the header RG-PU tag if @RG is present.
Q2	Z	Phred quality for the mate (encoding is the same as <QUAL>).
R2	Z	Sequence of the mate.
RG	Z	Read group. Value matches the header RG-ID tag if @RG is present in the header.
S2	H	Encoded base probabilities for the other 3 bases for the mate-pair read. Same encoding as SQ 1
SA	M	TAGS:
SM	i	Mapping quality if the read is mapped as a single read rather than as a read pair
SQ	H	Encoded base probabilities for the suboptimal bases at each position (deprecated by E2 and U2) 1
Ta	g	Type Description
U2	Z	Phred-scaled log-lk ratio of the 2nd to the 3rd most likely base calls. Encoding is the same as QUAL.
UQ	i	"Phred likelihood of the read sequence, conditional on the mapping location being correct 5"
X?	?	Reserved fields for end users (together with Y? and Z?)



What Information is in the SAM/BAM Header

The SAM/BAM header is not required, but if it is there, it contains generic information for the SAM/BAM file.
The header may contain the version information for the SAM/BAM file and information regarding whether or not and how the file is sorted.
It also contains supplemental information for alignment records like information about the reference sequences, the processing that was used to generate the various reads in the file, and the programs that have been used to process the different reads. The alignment records may then point to this supplemental information identifying which ones the specific alignment is associated with.
For example, a group of reads in the SAM/BAM file may all be assigned to the same reference sequence. Rather than every alignment containing information about the reference sequence, this information is put in the header, and the alignment "points" to the appropriate reference sequence in the header via the RNAME field. The header contains generic information about this reference like its length.

The SAM/BAM Header also may contain comments which are free-form text lines that can contain any information.

Header lines start with an '@'.

Example SAM

Example Header Lines
@HD	VN:1.0	SO:coordinate
@SQ	SN:1	LN:249250621	AS:NCBI37	UR:file:/data/local/ref/GATK/human_g1k_v37.fasta	M5:1b22b98cdeb4a9304cb5d48026a85128
@SQ	SN:2	LN:243199373	AS:NCBI37	UR:file:/data/local/ref/GATK/human_g1k_v37.fasta	M5:a0d9851da00400dec1098a9255ac712e
@SQ	SN:3	LN:198022430	AS:NCBI37	UR:file:/data/local/ref/GATK/human_g1k_v37.fasta	M5:fdfd811849cc2fadebc929bb925902e5
@RG	ID:UM0098:1	PL:ILLUMINA	PU:HWUSI-EAS1707-615LHAAXX-L001	LB:80	DT:2010-05-05T20:00:00-0400	SM:SD37743	CN:UMCORE
@RG	ID:UM0098:2	PL:ILLUMINA	PU:HWUSI-EAS1707-615LHAAXX-L002	LB:80	DT:2010-05-05T20:00:00-0400	SM:SD37743	CN:UMCORE
@PG	ID:bwa	VN:0.5.4
@PG	ID:GATK TableRecalibration	VN:1.0.3471	CL:Covariates=[ReadGroupCovariate, QualityScoreCovariate, CycleCovariate, DinucCovariate, TileCovariate], default_read_group=null, default_platform=null, force_read_group=null, force_platform=null, solid_recal_mode=SET_Q_ZERO, window_size_nqs=5, homopolymer_nback=7, exception_if_no_tile=false, ignore_nocall_colorspace=false, pQ=5, maxQ=40, smoothing=1
In the alignment examples below, you will see that the 2nd alignment maps back to the RG line with ID UM0098.1, and all of the alignments point back to the SQ line with SN:1 because their RNAME is 1.

Example Alignments
This is what the alignment section of a SAM file looks like:
1:497:R:-272+13M17D24M	113	1	497	37	37M	15	100338662	0	CGGGTCTGACCTGAGGAGAACTGTGCTCCGCCTTCAG	0;==-==9;>>>>>=>>>>>>>>>>>=>>>>>>>>>>	XT:A:U	NM:i:0	SM:i:37	AM:i:0	X0:i:1	X1:i:0	XM:i:0	XO:i:0	XG:i:0	MD:Z:37
19:20389:F:275+18M2D19M	99	1	17644	0	37M	=	17919	314	TATGACTGCTAATAATACCTACACATGTTAGAACCAT	>>>>>>>>>>>>>>>>>>>><<>>><<>>4::>>:<9	RG:Z:UM0098:1	XT:A:R	NM:i:0	SM:i:0	AM:i:0	X0:i:4	X1:i:0	XM:i:0	XO:i:0	XG:i:0	MD:Z:37
19:20389:F:275+18M2D19M	147	1	17919	0	18M2D19M	=	17644	-314	GTAGTACCAACTGTAAGTCCTTATCTTCATACTTTGT	;44999;499<8<8<<<8<<><<<<><7<;<<<>><<	XT:A:R	NM:i:2	SM:i:0	AM:i:0	X0:i:4	X1:i:0	XM:i:0	XO:i:1	XG:i:2	MD:Z:18^CA19
9:21597+10M2I25M:R:-209	83	1	21678	0	8M2I27M	=	21469	-244	CACCACATCACATATACCAAGCCTGGCTGTGTCTTCT	<;9<<5><<<<><<<>><<><>><9>><>>>9>>><>	XT:A:R	NM:i:2	SM:i:0	AM:i:0	X0:i:5	X1:i:0	XM:i:0	XO:i:1	XG:i:2	MD:Z:35
In this example, the fields are:
Field	Alignment 1	Alignment 2	Alignment 3	Alignment 4
QNAME	1:497:R:-272+13M17D24M	19:20389:F:275+18M2D19M	19:20389:F:275+18M2D19M	9:21597+10M2I25M:R:-209
FLAG	113	99	147	83
RNAME	1	1	1	1
POS	497	17644	17919	21678
MAPQ	37	0	0	0
CIGAR	37M	37M	18M2D19M	8M2I27M
MRNM/RNEXT	15	=	=	=
MPOS/PNEXT	100338662	17919	17644	21469
ISIZE/TLEN	0	314
SEQ	CGGGTCTGACCTGAGGAGAACTGTGCTCCGCCTTCAG	TATGACTGCTAATAATACCTACACATGTTAGAACCAT	GTAGTACCAACTGTAAGTCCTTATCTTCATACTTTGT	CACCACATCACATATACCAAGCCTGGCTGTGTCTTCT
QUAL	0;==-==9;>>>>>=>>>>>>>>>>>=>>>>>>>>>>	>>>>>>>>>>>>>>>>>>>><<>>><<>>4::>>:<9	;44999;499<8<8<<<8<<><<<<><7<;<<<>><<	<;9<<5><<<<><<<>><<><>><9>><>>>9>>><>
TAGs	XT:A:U	NM:i:0	SM:i:37	AM:i:0	X0:i:1	X1:i:0	XM:i:0	XO:i:0 XG:i:0	MD:Z:37	RG:Z:UM0098:1	XT:A:R	NM:i:0	SM:i:0	AM:i:0	X0:i:4 X1:i:0	XM:i:0	XO:i:0	XG:i:0	MD:Z:37	XT:A:R	NM:i:2	SM:i:0	AM:i:0	X0:i:4	X1:i:0	XM:i:0 XO:i:1	XG:i:2	MD:Z:18^CA19	XT:A:R	NM:i:2	SM:i:0	AM:i:0	X0:i:5	X1:i:0	XM:i:0	XO:i:1 XG:i:2	MD:Z:35

You should now be a SAM expert :-)





CHECK INSERT SIZE AND STANDARD DEVIATION
----------------------------------------

/nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/insertSize.pl \
--inputfile /ngs/bioinfo/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/1/chr22/2/reanalysis_1_export.txt \
--matefile /ngs/bioinfo/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/1/chr22/2/reanalysis_2_export.txt \
--outputfile /ngs/bioinfo/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/1/chr22/2/insertsize.txt \
--lines 1000

    
    INSERT SIZE STATISTICS
    ----------------------
    inputfile  : /ngs/bioinfo/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/1/chr22/2/reanalysis_1_export.txt
    matefile   : /ngs/bioinfo/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/1/chr22/2/reanalysis_2_export.txt
    
    median: 1797
    sample standard deviation: 4976798.39148946
    reads: 10000
    mean: 1344462
    distance        count
    700     0
    800     0
    900     0
    1000    0
    1100    0
    1200    3
    1300    4
    1400    0
    1500    0
    1600    4
    1700    9
    1800    18
    1900    12
    2000    12
    2100    6
    2200    2
    2300    1
    2400    0
    2500    0
    2600    0
    2700    0






NOVOALIGN OPTIONS
-----------------


http://www.novocraft.com/wiki/tiki-index.php?page=Reporting+Multiple+Alignments+per+Read&structure=Novocraft+Technologies&page_ref_id=41

BY DEFAULT, NOVOALIGN DOES NOT REPORT ANY ALIGNMENT OTHER THAN THE BEST ALIGNMENT


http://www.novocraft.com/wiki/tiki-index.php?page=Novoalign%20command%20line%20Options

Options for reporting:

-o format	Specifies the report format. Native, Pairwise & SAM. Default is Native.

-R 99	Sets score difference between best and second best alignment for calling a repeat. Default 5.

-r strategy [limit]	Sets strategy for reporting repeats. 'None', 'Random', 'All', 'Exhaustive', or a posterior probability limit. Default None.
        An optional limit on the maximum number of alignments to report can also be set. Default is no limit. 
        When using the 'Exhaustive' option a limit and an alignment threshold must be set.

-Q 99	Sets lower limit on alignment quality for reporting. Default 0.

-e 999	Sets a limit on number of alignments for a single read. This limit applies to the number of alignments with score equal to that of the best alignment. Alignment process will stop when the limit is reached. Default 1000 in default report mode, off for other modes.

-q 9	Sets number of decimal places for quality score. Default zero.

-K [file]	Collects mismatch statistics for quality calibration by position in the read and called base quality. Mismatch counts are written to the named file after all reads are processed. When used with -k option the mismatch counts include any read from the input quality calibration file.




NOVOALIGN
Reporting Multiple Alignments per Read

http://www.novocraft.com/wiki/tiki-index.php?page=Reporting+Multiple+Alignments+per+Read&structure=Novocraft+Technologies&page_ref_id=41
      

Novoalign is quite flexible when it comes to reporting reads that have multiple alignment loci.

The default option is to report no locus if the posterior alignment probability of the best alignment is less than 0.7.
Other options are:
Randomly selecting a single alignment locus from the set loci. The probability of a locus being chosen is equal to it's posterior alignment probability. Behaviour is similar to MAQ & BWA.
Reporting all alignments where alignment score is within a certain range of the best alignment.
Reporting all alignments below a score threshold.
Reporting all alignment loci with posterior alignment probability over a user defined limit.

For above options that report multiple alignments you can also set a limit on the maximum number of alignment loci to report.

Command Line Options


-r method [limit] [-t threshold]


Sets the rules for handling of reads with multiple alignment locations.


Values are:-

Method	Limit	-t threshold	Description
None	NA	Optional	No alignments will be reported. The read will be reported as a type R with no alignment locations. A reporting "limit" should not be set.
Random	NA	Optional	A single alignment location is randomly chosen from amongst all the alignment results. A reporting "limit" should not be set.
All	Optional	Optional	All alignment locations are reported. The 'All' method can optionally specify a limit for the number of lines reported. e.g. '-r All 10' will report at most 10 randomly selected alignments.
Exhaustive	Required	Required	Reports all alignments with a alignment score, P(R|Ai) , less than or equal to the threshold. The 'Exhaustive' method requires that a limit for the number of lines reported. e.g. '-r E 10' will report at most 10 randomly selected alignments per read. This is to avoid situations where high copy number repeats result in reporting millions of alignments for a read. The alignment threshold (-t option) must be set when using the -r Exhaustive option.
0.99	NA	Optional	Posterior probability threshold. All alignments with posterior probability greater than the set value will be reported.


-R "99"


Specifies a score difference between first two alignments for reporting repeats. If the difference is less than this then the read is treated as aligning to a repeat and '-r method' applies. If the score difference is greater than this then the higher scoring alignment is reported as a unique alignment. Default is 5 and corresponds approximately to first alignment having a probability of 0.75 and the second a probability of 0.25.

The following table shows approximate alignment probabilities for different settings in case when two alignments have been found. If the posterior alignment probability of the first alignment is below the P(1st) value then the alignment will be classed as a repeat.

Score Difference	P(1st)	P(2nd)
5	0.760	0.240
10	0.909	0.091
20	0.990	0.010
30	0.999	0.001



Examples

novoalign -r Ex 10 -t 180 -d ...	 Reports up to 10 alignments per read having alignment score less than 180. If more than 10 alignments found then they are chosen randomly from the lowest scoring alignments.
novoalign -r All -d ...	            Reports all alignments with a score within 5 points of the best alignment.
novoalign -r All -R 30 -d ...	    Reports all alignments with a score within 30 points of the best alignment.
novoalign -r All 20 -R 30 -d ...	Reports no more than 20 alignments with a score within 30 points of the best alignment.
novoalign -r Random -R30 -d ...	    Reports a randomly selected alignment from all alignments with a score within 30 points of the best alignment. The probability of an alignment being selected is proportional to its posterior alignment probability.
novoalign -d ...	                Default reporting option is to report only unique alignments. A unique alignment has a posterior probability > 0.75
novoalign -r 0.05	                Reports all alignments with a posterior alignment probability greater than 0.05. This option is quite different in effect to the other options, if a read aligns to, say, 50 locations with same score then each will have a posterior probability of 0.02 and no alignments are reported. However, if it aligned to 10 locations with the same score then they would each have a probability of 0.1 and they would all be reported.



</entry>



<entry [Sun Oct 31 01:35:20 EDT 2010] RERUN MAQ WITH -C 1 SETTING>




ELAND -- ALREADY DONE (REPORTS UNIQUE HITS ONLY BY DEFAULT - *_export.txt)

BOWTIE -- ALREADY DONE (REPORTS UNIQUE HITS ONLY BY DEFAULT)
-k <int>
Report up to <int> valid alignments per read or pair (default: 1). Validity of alignments is determined by the alignment policy (combined effects of -n, -v, -l, and -e). If more than one valid alignment exists and the --best and --strata options are specified, then only those alignments belonging to the best alignment "stratum" will be reported. Bowtie is designed to be very fast for small -k but bowtie can become significantly slower as -k increases. 

MAQ -- RUNNING WITH -C 1 SETTING TO REPORT ONLY THE BEST HIT

Usage:   maq map [options] <out.map> <chr.bfa> <reads_1.bfq> [reads_2.bfq]

    -C INT      max number of hits to output. >512 for all 01 hits. [250]



COMPARE HITS:

MAQ WITH '-C 1'

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/1/chr22/1
emacs -nw maq-chr22-stdout.txt

Running MAQ: time /nethome/bioinfo/apps/maq/0.7.1/maq match -C 1 /scratch/syoung/base/pipeline/SRA/\
NA18507/SRP000239/sampled/200bp/chr22/maq/1/chr22/1/out.map /nethome/bioinfo/data/sequence/chromoso\
mes/human/hg19/maq/chr22/chr22.bfa /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200b\
p/chr22/maq/1/1/maq-200bp-chr22-1_1.1.bfq /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampl\
ed/200bp/chr22/maq/1/1/maq-200bp-chr22-1_2.1.bfq  &> /scratch/syoung/base/pipeline/SRA/NA18507/SRP0\
00239/sampled/200bp/chr22/maq/1/chr22/1/maq-chr22-outerr.txt

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/1/chr22/1
ll
    -rw-rw-rw-  1 syoung root  85M Oct 28 15:40 hit.sam

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/1/chr22/1
head hit.sam
    
    SRR002272.6137443:2:77:867:590#0        85      chr22   14431654        0       *       *       0  GCTGCCTAGACAGAGCTGATTTATCAAGAAAGAGAT     &+'.&$+7511I4E+*.2.,4+I1D6IEIII;5IGI    MF:i:192
    SRR002272.6137443:2:77:867:590#0        153     chr22   14431654        0       36M     *       0  GCTCTGAATCCTGCTACCTGGAGGCTTCATCTACAT     "'%&)+%)"/+++-,-2(*10,2-'.628/I5I?I4    MF:i:64 AM:i:0  SM:i:0      NM:i:3  UQ:i:32 H0:i:0  H1:i:0
    SRR002272.203817:1:10:390:446#0 85      chr22   14431708        0       *       *       0       0  AGTTATGTTAACAGAGATTCTTTATAGAGGCAAATT     -+++6/04/I,5,;?+F<5D4II;IIFI?IIIIIII    MF:i:192
    SRR002272.203817:1:10:390:446#0 153     chr22   14431708 



MAQ DEFAULT 


cd /ngs/bioinfo/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/maq/maq/1/chr22/1

Running MAQ: time /nethome/bioinfo/apps/maq/0.7.1/maq match /scratch/syoung/base/pipeline/SRA/NA1\
8507/SRP000239/sampled/200bp/autochr22/maq/1/chr22/1/out.map /nethome/bioinfo/data/sequence/chrom\
osomes/human/hg19/maq/chr22/chr22.bfa /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled\
/200bp/autochr22/maq/1/1/maq-200bp-autochr22-1_1.1.bfq /scratch/syoung/base/pipeline/SRA/NA18507/\
SRP000239/sampled/200bp/autochr22/maq/1/1/maq-200bp-autochr22-1_2.1.bfq  &> /scratch/syoung/base/\
pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/maq/1/chr22/1/maq-chr22-outerr.txt

cd /ngs/bioinfo/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/maq/maq/1/chr22/1
ll

    -rw-rw-rw-+  1 syoung bioinfo  85M Oct  8 00:52 hit.sam

cd /ngs/bioinfo/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/maq/maq/1/chr22/1
head hit.sam

    RR002271.11543377:3:120:694:964#0       69      chr22   14431781        0       *       *       0TTTATTTGGCTACAGTTAAGGATGTGCCCATGACAC     IIIIIIIIIDI<?8E&B3*BA)-6$&#%&&(%%&&%    MF:i:192
    RR002271.11543377:3:120:694:964#0       137     chr22   14431781        10      36M     *       0TGTTTAAATCTACCTATGATCTGGAAGTCCCTGCTT     :5;II<569*6-+51&0'%2.&')%&(&(&*(+'%*    MF:i:64 AM:i:0  SM:i:10   NM:i:4  UQ:i:39 H0:i:0  H1:i:0



CHECK INTERSECTION BETWEEN HITS:

MAQ WITH '-C 1'

time /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/indexReads.pl \
--inputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/1/chr22/1/hit.sam \
--dbfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/1/chr22/1/hit.sam.db
    
    indexReads.pl    Reads indexed: 499443
    bowtieIndex.pl    Run time: 00:01:48
    bowtieIndex.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/indexReads.pl
    bowtieIndex.pl    11:20AM, 15 November 2010
    bowtieIndex.pl    ****************************************

time /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/numberReads.pl \
--dbfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/1/chr22/1/hit.sam.db
    
    499443
    
    real    0m4.535s
    user    0m3.026s
    sys     0m0.227s



MAQ WITH DEFAULT

time /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/indexReads.pl \
--inputfiles /ngs/bioinfo/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/maq/maq/1/chr22/1/hit.sam \
--dbfile /ngs/bioinfo/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/maq/maq/1/chr22/1/hit.sam.db
    
    indexReads.pl    Reads indexed: 499443
    bowtieIndex.pl    Run time: 00:01:51
    bowtieIndex.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/indexReads.pl
    bowtieIndex.pl    11:20AM, 15 November 2010
    bowtieIndex.pl    ****************************************

time /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/numberReads.pl \
--dbfile /ngs/bioinfo/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/maq/maq/1/chr22/1/hit.sam.db

    499443
    
    real    0m3.307s
    user    0m3.044s
    sys     0m0.171s



MERGE DB FILES (WILL RESULT IN DUPLICATES IF THE HITS MATCH TO DIFFERENT LOCATIONS):

mkdir -p /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/venn/default-onehit
cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/venn/default-onehit


/nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/mergeIndexes.pl \
--inputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/1/chr22/1/hit.sam.db,/ngs/bioinfo/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/maq/maq/1/chr22/1/hit.sam.db \
--outputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/venn/default-onehit/1-hit.sam.merged.db

    mergeIndexes.pl    Run time: 00:00:18
    mergeIndexes.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/mergeIndexes.pl
    mergeIndexes.pl    12:14AM, 15 November 2010
    mergeIndexes.pl    ****************************************


CHECK NUMBER READS IN MERGED DB FILE:

time /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/numberReads.pl \
--dbfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/venn/default-onehit/1-hit.sam.merged.db
    
    535864
    
    real    0m3.967s
    user    0m3.458s
    sys     0m0.258s




ALSO TRIED TO USE samVenn.pl BUT IT HUNG (SHORTAGE OF MEMORY MOST LIKELY):

mkdir -p /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/venn/default-onehit
cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/venn/default-onehit

/nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/samVenn.pl \
--queryfile /ngs/bioinfo/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/maq/maq/1/chr22/1/hit.sam \
--targetfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/1/chr22/1/hit.sam \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/venn/default-onehit \
--querylabel default \
--targetlabel onehit



SO CREATED indexVenn.pl:

mkdir -p /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/venn/default-onehit
cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/venn/default-onehit

/nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/indexVenn.pl \
--queryfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/1/chr22/1/hit.sam.db \
--targetfile /ngs/bioinfo/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/maq/maq/1/chr22/1/hit.sam.db \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/venn/default-onehit \
--querylabel default \
--targetlabel onehit









KILL ALREADY TERMINATED PROCESSES ON PEGASUS
--------------------------------------------


ps ax | awk { if ($NF == ) print $1 } | xargs kill -9

PREVIOUS RUN
------------

PREVIOUS RUN OF 10 FILES GENERATED hit.sam FILES

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq
ll */chr22/hit.sam

    -rw-rw-rw- 1 syoung root 3.9G Oct 28 17:06 10/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 3.9G Oct 28 17:08 1/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 3.9G Oct 28 17:10 2/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 3.9G Oct 28 17:03 3/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 3.9G Oct 28 17:10 4/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 3.9G Oct 28 17:08 5/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 3.9G Oct 28 17:05 6/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 3.9G Oct 28 17:01 7/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 3.9G Oct 28 17:07 8/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 3.9G Oct 28 17:10 9/chr22/hit.sam



SECOND ROUND
------------

screen -S loop-maq-1

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/MAQ.pl \
--replicates 26-33 \
--loop serial \
--params "-C 1" \
--inputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-%REPLICATE%.reads_1.sequence.txt \
--matefiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-%REPLICATE%.reads_2.sequence.txt \
--referencedir /nethome/bioinfo/data/sequence/chromosomes/human/hg19/maq/chr22 \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/%REPLICATE% \
--species human \
--label maq-200bp-chr22-%REPLICATE% \
--maxjobs 1000 \
--walltime 24 \
--queue large \
--cluster LSF \
--cpus 1 \
--reads 1000000 \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/%REPLICATE%/maq-200bp-chr22-%REPLICATE%.out 

    Run time: 17:49:07
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    6:10PM, 2 November 2010
    ****************************************


cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq
ll */chr22/hit.sam

    -rw-rw-rw- 1 syoung root 3.9G Oct 28 17:08 1/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 3.9G Oct 28 17:10 2/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 3.9G Oct 28 17:03 3/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 3.9G Oct 28 17:10 4/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 3.9G Oct 28 17:08 5/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 3.9G Oct 28 17:05 6/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 3.9G Oct 28 17:01 7/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 3.9G Oct 28 17:07 8/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 3.9G Oct 28 17:10 9/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 3.9G Oct 28 17:06 10/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 3.9G Oct 31 04:35 11/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 3.9G Oct 31 07:13 12/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 3.9G Oct 31 09:25 13/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 3.9G Oct 31 10:27 14/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 3.9G Nov  1 01:46 15/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 3.9G Nov  1 04:08 16/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 3.9G Nov  1 06:14 17/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 3.9G Nov  1 08:18 18/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 3.9G Nov  1 10:26 19/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 3.9G Nov  1 12:42 20/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 3.9G Nov  1 02:29 21/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 3.9G Nov  1 04:55 22/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 3.9G Nov  1 07:12 23/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 3.9G Nov  1 09:41 24/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 3.9G Nov  1 11:54 25/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 3.9G Nov  2 02:03 26/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 3.9G Nov  2 04:12 27/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 3.9G Nov  2 06:35 28/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 3.9G Nov  2 09:04 29/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 3.9G Nov  2 10:09 30/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 3.9G Nov  2 12:29 31/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 3.9G Nov  2 15:00 32/chr22/hit.sam
    -rw-rw-rw- 1 syoung root 3.9G Nov  2 17:26 33/chr22/hit.sam



APPROXIMATELY 23 MILLION READS HAD HITS AGAINST chr22

lines 1/chr22/hit.sam

    1/chr22/hit.sam: 23,235,818



gzip SAM FILES
--------------

screen -S maq-gzip

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/converters/gzipSamfile.pl \
--replicates 2-33 \
--loop distributed \
--reference chr22 \
--outdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/%REPLICATE% \
--samfile hit.sam \
--label gzipSamfile \
--queue large \
--cluster LSF \
--cpus 1 \
--maxjobs 1000
        
    Run time: 00:17:22
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    10:30AM, 4 November 2010
    ****************************************


TEST SINGLE

perl /nethome/bioinfo/apps/agua/0.5/bin/apps/converters/gzipSamfile.pl \
--reference chr22 \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/1 \
--samfile hit.sam \
--label maq-gzipSamfile \
--keep \
--queue small \
--cluster LSF \
--cpus 1 \
--maxjobs 1000 \
--clean




CALL SNPS
---------


mkdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/samToSnp
cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/samToSnp

screen -S maq-snp

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--replicates 1-33 \
--loop distributed \
--outdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/samToSnp \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/converters/samToSnp.pl \
--reference chr22 \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/%REPLICATE% \
--species human \
--samfile hit.sam \
--label samToSnp \
--keep \
--queue large \
--cluster LSF \
--cpus 1 \
--maxjobs 1000 \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/samToSnp/samToSnp.stdout

    Run time: 00:12:43
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    11:27AM, 4 November 2010
    ****************************************


SINGLE TEST

perl /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/samToSnp.pl \
--reference chr22 \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/1 \
--species human \
--samfile hit.sam \
--label msq-samToSnp \
--keep \
--queue small \
--cluster LSF \
--cpus 1 \
--maxjobs 1000 \
--clean

    samToSnp.pl    Run time: 00:06:41
    samToSnp.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/samToSnp.pl
    samToSnp.pl    10:27AM, 4 November 2010
    samToSnp.pl    ****************************************

    OK


OUTPUT FILES (NOTE FILE 33 IS SHORT):

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq
ll */chr22/hit.snp

    -rw-rw-rw- 1 syoung root 1.1M Nov  4 11:27 1/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.1M Nov  4 11:27 2/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.1M Nov  4 11:27 3/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.1M Nov  4 11:27 4/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.1M Nov  4 11:27 5/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.1M Nov  4 11:27 6/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.1M Nov  4 11:27 7/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.1M Nov  4 11:27 8/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.1M Nov  4 11:24 9/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.1M Nov  4 11:24 10/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.1M Nov  4 11:24 11/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.1M Nov  4 11:24 12/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.1M Nov  4 11:24 13/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.1M Nov  4 11:24 14/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.1M Nov  4 11:24 15/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.1M Nov  4 11:24 16/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.1M Nov  4 11:26 17/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.1M Nov  4 11:26 18/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.1M Nov  4 11:26 19/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.1M Nov  4 11:26 20/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.1M Nov  4 11:26 21/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.1M Nov  4 11:26 22/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.1M Nov  4 11:26 23/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.1M Nov  4 11:26 24/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.1M Nov  4 11:25 25/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.1M Nov  4 11:25 26/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.1M Nov  4 11:25 27/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.1M Nov  4 11:25 28/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.1M Nov  4 11:25 29/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.1M Nov  4 11:25 30/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.1M Nov  4 11:25 31/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 1.1M Nov  4 11:21 32/chr22/hit.snp
    -rw-rw-rw- 1 syoung root 420K Nov  4 11:18 33/chr22/hit.snp



CUMULATIVE SNPS
---------------


mkdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative
cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative

screen -S maq-cum

perl /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/cumulativeSnp.pl \
--inputdirs \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/1,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/2,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/3,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/4,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/5,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/6,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/7,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/8,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/9,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/10,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/11,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/12,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/13,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/14,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/15,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/16,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/17,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/18,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/19,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/20,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/21,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/22,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/23,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/24,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/25,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/26,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/27,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/28,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/29,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/30,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/31,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/32,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/33 \
--samfile hit.sam.gz \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative \
--species human \
--zipped gzip \
--label cumulative \
--walltime 48 \
--cluster LSF \
--queue large \
--cpus 1 \
--maxjobs 1000 \
--clean \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative/cumulativeSnp.out



STOPPED AT FILE 23 BECAUSE OF PEGASUS SHUTDOWN:

tail /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative/cumulativeSnp.out

    ....
    cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative/chr22
    
    /nethome/bioinfo/apps/samtools/0.1.6/samtools pileup -vcf /nethome/bioinfo/data/sequence/chromosomes/human/hg19/samtools/chr22.fa /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative/chr22/merged.bam | tee hit-23.raw | /nethome/bioinfo/apps/samtools/0.1.6/samtools.pl varFilter -D100 > hit-23.filter
    
    awk '($3=="*"&&$6>=50)||($3!="*"&&$6>=20)' hit-23.filter > hit-23.snp
    
    SNP::bamSnps    Running jobs:
    Cluster::runJobs    Running 1 jobs
    Cluster::runJobs    scriptfile: /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative/chr22/cumulativeSnp-chr22-23.sh
    ...
    LSF daemon (LIM) not responding ... still trying
    [Sat Nov  6 20:41:42 2010] cumulativeSnp.pl: Can't exec "bjobs": No such file or directory at /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/../../../lib/Monitor/LSF.pm line 582.
    [Sat Nov  6 20:41:42 2010] cumulativeSnp.pl: Use of uninitialized value in split at /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/../../../lib/Monitor/LSF.pm line 586.
    [Sat Nov  6 20:41:42 2010] cumulativeSnp.pl: Can't exec "bjobs": No such file or directory at /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/../../../lib/Monitor/LSF.pm line 582.
    [Sat Nov  6 20:41:42 2010] cumulativeSnp.pl: Use of uninitialized value in split at /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/../../../lib/Monitor/LSF.pm line 586.
    Command 'bsub' not found in /sw/bin, /nethome/syoung/base/bin, /usr/X11R6/bin, /nethome/syoung/base/bin/utils, /home/syoung/base/bin/nextgen, /home/syoung/base/apps/amos/bin, /home/apps/alta-cyclic/0.1.0/external.programs/libsvm-2.86, /home/apps/alta-cyclic/0.1.0/blat/bin/i386, /home/bioinfo/apps/ngs/bin/nextgen, /home/bioinfo/apps/ngs/bin/exome, /home/bioinfo/apps/ngs/bin/utils, /home/bioinfo/apps/ngs/bin, /nethome/syoung/base/apps/python/python/2.7/bin, /share/apps/lsf/7.0/linux2.6-glibc2.3-x86_64/etc, /share/apps/lsf/7.0/linux2.6-glibc2.3-x86_64/bin, /usr/kerberos/bin, /usr/local/bin, /bin, /usr/bin at /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/../../../lib/external/LSF.pm line 62
    


RESTART FROM FILE 21:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative/chr22
ll -tr merged.bam*

    -rw-r--r-- 1 syoung root 21982038328 Nov  7 07:16 merged.bam
    -rw-r--r-- 1 syoung root  1282710843 Nov  4 14:25 merged.bam-1
    -rw-r--r-- 1 syoung root  2533489401 Nov  4 12:56 merged.bam-2
    -rw-r--r-- 1 syoung root  3557956611 Nov  4 19:19 merged.bam-3
    -rw-r--r-- 1 syoung root  3766914960 Nov  4 20:23 merged.bam-4
    -rw-r--r-- 1 syoung root  5012929458 Nov  4 21:51 merged.bam-5
    -rw-r--r-- 1 syoung root  6248472223 Nov  4 23:38 merged.bam-6
    -rw-r--r-- 1 syoung root  7475737176 Nov  5 01:43 merged.bam-7
    -rw-r--r-- 1 syoung root  8697784380 Nov  5 04:02 merged.bam-8
    -rw-r--r-- 1 syoung root  9916179435 Nov  5 06:34 merged.bam-9
    -rw-r--r-- 1 syoung root 11130666225 Nov  5 09:34 merged.bam-10
    -rw-r--r-- 1 syoung root 12342392588 Nov  5 12:37 merged.bam-11
    -rw-r--r-- 1 syoung root 13552077173 Nov  5 15:58 merged.bam-12
    -rw-r--r-- 1 syoung root 14760336362 Nov  5 19:43 merged.bam-13
    -rw-r--r-- 1 syoung root 15967045340 Nov  5 23:44 merged.bam-14
    -rw-r--r-- 1 syoung root 15967045340 Nov  5 23:44 merged.bam-15
    -rw-r--r-- 1 syoung root 17172343011 Nov  6 03:49 merged.bam-16
        -rw-r--r-- 1 syoung root 18376289972 Nov  6 08:19 merged.bam-17
    -rw-r--r-- 1 syoung root 19579349912 Nov  6 12:27 merged.bam-18
    -rw-r--r-- 1 syoung root 20781074219 Nov  6 16:24 merged.bam-19
    -rw-r--r-- 1 syoung root 21982038328 Nov  7 07:26 merged.bam-20
    -rw-r--r-- 1 syoung root  1283128386 Nov  6 21:48 merged.bam-22 <=== DIED HERE SO RESTART FROM FILE 21





RERUN FROM 21:


screen -S maq-cum


perl /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/cumulativeSnp.pl \
--inputdirs \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/21,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/22,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/23,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/24,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/25,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/26,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/27,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/28,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/29,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/30,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/31,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/32,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/33 \
--start 21 \
--samfile hit.sam.gz \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative \
--species human \
--zipped gzip \
--label cumulative \
--walltime 48 \
--cluster LSF \
--queue large \
--cpus 1 \
--maxjobs 1000 \
--clean \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative/cumulativeSnp.out


RUNNING:

    Cluster::runJobs    scriptfile: /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative/chr22/cumulativeSnp-chr22-21.sh
    Job <2246564> is submitted to queue <large>.
    Mon Nov  8 12:08:35 EST 2010

COMPLETED BUT INTERRUPTED:

    cumulativeSNP.pl    Run time: 12:19:43
    cumulativeSNP.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/cumulativeSnp.pl
    cumulativeSNP.pl    0:28AM, 9 November 2010
    cumulativeSNP.pl    ****************************************


ll merged.bam* | grep -v bai | grep -v cover

    -rw-r--r-- 1 syoung root  21G Nov  9 00:08 merged.bam
    -rw-r--r-- 1 syoung root 1.2G Nov  4 14:25 merged.bam-1
    -rw-r--r-- 1 syoung root 2.4G Nov  4 12:56 merged.bam-2
    -rw-r--r-- 1 syoung root 3.4G Nov  4 19:19 merged.bam-3
    -rw-r--r-- 1 syoung root 3.6G Nov  4 20:23 merged.bam-4
    -rw-r--r-- 1 syoung root 4.7G Nov  4 21:51 merged.bam-5
    -rw-r--r-- 1 syoung root 5.9G Nov  4 23:38 merged.bam-6
    -rw-r--r-- 1 syoung root 7.0G Nov  5 01:43 merged.bam-7
    -rw-r--r-- 1 syoung root 8.2G Nov  5 04:02 merged.bam-8
    -rw-r--r-- 1 syoung root 9.3G Nov  5 06:34 merged.bam-9
    -rw-r--r-- 1 syoung root  11G Nov  5 09:34 merged.bam-10
    -rw-r--r-- 1 syoung root  12G Nov  5 12:37 merged.bam-11
    -rw-r--r-- 1 syoung root  13G Nov  5 15:58 merged.bam-12
    -rw-r--r-- 1 syoung root  14G Nov  5 19:43 merged.bam-13
    -rw-r--r-- 1 syoung root  15G Nov  5 23:44 merged.bam-14
    -rw-r--r-- 1 syoung root  15G Nov  5 23:44 merged.bam-15
    -rw-r--r-- 1 syoung root  16G Nov  6 03:49 merged.bam-16
    -rw-r--r-- 1 syoung root  18G Nov  6 08:19 merged.bam-17
    -rw-r--r-- 1 syoung root  19G Nov  6 12:27 merged.bam-18
    -rw-r--r-- 1 syoung root  20G Nov  6 16:24 merged.bam-19
    -rw-r--r-- 1 syoung root  21G Nov  7 07:26 merged.bam-20
    -rw-r--r-- 1 syoung root 1.2G Nov  6 21:48 merged.bam-22
    -rw-r--r-- 1 syoung root 4.3G Nov  9 00:11 merged.bam-24
    -rw-r--r-- 1 syoung root  22G Nov  8 21:33 merged.bam.temp


cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative/chr22
ll merged.bam* | grep -v bai | grep -v cov

    -rw-r--r-- 1 syoung root  21G Nov  9 00:08 merged.bam
    -rw-r--r-- 1 syoung root 1.2G Nov  4 14:25 merged.bam-1
    -rw-r--r-- 1 syoung root  11G Nov  5 09:34 merged.bam-10
    -rw-r--r-- 1 syoung root  12G Nov  5 12:37 merged.bam-11
    -rw-r--r-- 1 syoung root  13G Nov  5 15:58 merged.bam-12
    -rw-r--r-- 1 syoung root  14G Nov  5 19:43 merged.bam-13
    -rw-r--r-- 1 syoung root  15G Nov  5 23:44 merged.bam-14
    -rw-r--r-- 1 syoung root  15G Nov  5 23:44 merged.bam-15
    -rw-r--r-- 1 syoung root  16G Nov  6 03:49 merged.bam-16
    -rw-r--r-- 1 syoung root  18G Nov  6 08:19 merged.bam-17
    -rw-r--r-- 1 syoung root  19G Nov  6 12:27 merged.bam-18
    -rw-r--r-- 1 syoung root  20G Nov  6 16:24 merged.bam-19
    -rw-r--r-- 1 syoung root 2.4G Nov  4 12:56 merged.bam-2
    -rw-r--r-- 1 syoung root  21G Nov  7 07:26 merged.bam-20
    -rw-r--r-- 1 syoung root 1.2G Nov  6 21:48 merged.bam-22
    -rw-r--r-- 1 syoung root 4.3G Nov  9 00:11 merged.bam-24
    -rw-r--r-- 1 syoung root 3.4G Nov  4 19:19 merged.bam-3
    -rw-r--r-- 1 syoung root 3.6G Nov  4 20:23 merged.bam-4
    -rw-r--r-- 1 syoung root 4.7G Nov  4 21:51 merged.bam-5
    -rw-r--r-- 1 syoung root 5.9G Nov  4 23:38 merged.bam-6
    -rw-r--r-- 1 syoung root 7.0G Nov  5 01:43 merged.bam-7
    -rw-r--r-- 1 syoung root 8.2G Nov  5 04:02 merged.bam-8
    -rw-r--r-- 1 syoung root 9.3G Nov  5 06:34 merged.bam-9
    -rw-r--r-- 1 syoung root  22G Nov  8 21:33 merged.bam.temp

ll *snp

    -rw-rw-rw- 1 syoung root 1007K Nov  5 10:10 hit-10.snp
    -rw-rw-rw- 1 syoung root  1.1M Nov  5 13:16 hit-11.snp
    -rw-rw-rw- 1 syoung root  1.1M Nov  5 16:41 hit-12.snp
    -rw-rw-rw- 1 syoung root  1.1M Nov  5 20:33 hit-13.snp
    -rw-rw-rw- 1 syoung root  1.1M Nov  4 14:32 hit-1.snp
    -rw-rw-rw- 1 syoung root     0 Nov  6 21:48 hit-22.snp
    -rw-rw-rw- 1 syoung root  1.5M Nov  4 13:06 hit-2.snp
    -rw-rw-rw- 1 syoung root  1.5M Nov  4 19:32 hit-3.snp
    -rw-rw-rw- 1 syoung root  1.1M Nov  4 20:38 hit-4.snp
    -rw-rw-rw- 1 syoung root  1.1M Nov  4 22:09 hit-5.snp
    -rw-rw-rw- 1 syoung root  989K Nov  4 23:59 hit-6.snp
    -rw-rw-rw- 1 syoung root  957K Nov  5 02:13 hit-7.snp
    -rw-rw-rw- 1 syoung root  958K Nov  5 04:31 hit-8.snp
    -rw-rw-rw- 1 syoung root  985K Nov  5 07:06 hit-9.snp






SNP::bamSnps    COMMANDS:

time zcat /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/21/chr22/hit.sam.gz > /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/21/chr22/hit.sam

time /nethome/bioinfo/apps/samtools/0.1.8/samtools view -bt /nethome/bioinfo/data/sequence/chromosomes/human/hg19/samtools/chr22.fai -o /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/21/chr22/hit.bam /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/21/chr22/hit.sam

time cp merged.bam-20 /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative/chr22/merged.bam

time /nethome/bioinfo/apps/samtools/0.1.8/samtools merge /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative/chr22/merged.bam.temp /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/21/chr22/hit.bam /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative/chr22/merged.bam

time /nethome/bioinfo/apps/samtools/0.1.8/samtools sort /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative/chr22/merged.bam.temp /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/21/chr22/hit

time mv -f /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/21/chr22/hit.bam /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative/chr22/merged.bam

time cp /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative/chr22/merged.bam /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative/chr22/merged.bam-21

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative/chr22

/nethome/bioinfo/apps/samtools/0.1.8/samtools pileup -vcf /nethome/bioinfo/data/sequence/chromosomes/human/hg19/samtools/chr22.fa /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative/chr22/merged.bam | tee hit-21.raw | /nethome/bioinfo/apps/samtools/0.1.8/samtools.pl varFilter -D100 > hit-21.filter

awk '($3=="*"&&$6>=50)||($3!="*"&&$6>=20)' hit-21.filter > hit-21.snp




RE-RESTART FROM 21:
Mon Nov 15 10:59:10 EST 2010

screen -S maq-cum

perl /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/cumulativeSnp.pl \
--inputdirs \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/21,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/22,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/23,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/24,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/25,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/26,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/27,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/28,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/29,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/30,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/31,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/32,\
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/33 \
--start 21 \
--samfile hit.sam.gz \
--outputdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative \
--species human \
--zipped gzip \
--label cumulative \
--walltime 48 \
--cluster LSF \
--queue large \
--cpus 1 \
--maxjobs 1000 \
--clean \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative/cumulativeSnp.out

RUNNING
Mon Nov 15 10:18:00 EST 2010

PROBLEM WITH LSF AT Mon Nov 15 13:53:37 EST 2010:

/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative/cumulativeSnp.out

    LSF daemon (LIM) not responding ... still trying
    LSF daemon (LIM) not responding ... still trying
    LSF daemon (LIM) not responding ... still trying
    LSF daemon (LIM) not responding ... still trying
    LSF daemon (LIM) not responding ... still trying
    LSF daemon (LIM) not responding ... still trying
    LSF daemon (LIM) not responding ... still trying
    LSF daemon (LIM) not responding ... still trying
    LSF daemon (LIM) not responding ... still trying
    LSF daemon (LIM) not responding ... still trying
    LSF daemon (LIM) not responding ... still trying
    LSF daemon (LIM) not responding ... still trying
    LSF daemon (LIM) not responding ... still trying

    Cluster::runJobs    cleanup not defined. Leaving scriptfiles.
    cumulativeSNP.pl    Run time: 44:08:28
    cumulativeSNP.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/snp/cumulativeSnp.pl
    cumulativeSNP.pl    7:00AM, 17 November 2010
    cumulativeSNP.pl    ****************************************


MISSING FILES 22-25, 28, 29:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative/chr22
ls -al -tr merged.bam-* | grep -v bai | grep -v cov


    -rw-r--r-- 1 syoung root  2533489401 Nov  4 12:56 merged.bam-2
    -rw-r--r-- 1 syoung root  1282710843 Nov  4 14:25 merged.bam-1
    -rw-r--r-- 1 syoung root  3557956611 Nov  4 19:19 merged.bam-3
    -rw-r--r-- 1 syoung root  3766914960 Nov  4 20:23 merged.bam-4
    -rw-r--r-- 1 syoung root  5012929458 Nov  4 21:51 merged.bam-5
    -rw-r--r-- 1 syoung root  6248472223 Nov  4 23:38 merged.bam-6
    -rw-r--r-- 1 syoung root  7475737176 Nov  5 01:43 merged.bam-7
    -rw-r--r-- 1 syoung root  8697784380 Nov  5 04:02 merged.bam-8
    -rw-r--r-- 1 syoung root  9916179435 Nov  5 06:34 merged.bam-9
    -rw-r--r-- 1 syoung root 11130666225 Nov  5 09:34 merged.bam-10
    -rw-r--r-- 1 syoung root 12342392588 Nov  5 12:37 merged.bam-11
    -rw-r--r-- 1 syoung root 13552077173 Nov  5 15:58 merged.bam-12
    -rw-r--r-- 1 syoung root 14760336362 Nov  5 19:43 merged.bam-13
    -rw-r--r-- 1 syoung root 15967045340 Nov  5 23:44 merged.bam-14
    -rw-r--r-- 1 syoung root 15967045340 Nov  5 23:44 merged.bam-15
    -rw-r--r-- 1 syoung root 17172343011 Nov  6 03:49 merged.bam-16
    -rw-r--r-- 1 syoung root 18376289972 Nov  6 08:19 merged.bam-17
    -rw-r--r-- 1 syoung root 19579349912 Nov  6 12:27 merged.bam-18
    -rw-r--r-- 1 syoung root 20781074219 Nov  6 16:24 merged.bam-19
    -rw-r--r-- 1 syoung root  1283128386 Nov  6 21:48 merged.bam-22
    -rw-r--r-- 1 syoung root 21982038328 Nov  7 07:26 merged.bam-20
    -rw-r--r-- 1 syoung root  4511973376 Nov  9 00:11 merged.bam-24
    -rw-r--r-- 1 syoung root   497738713 Nov 15 10:47 merged.bam-25
    -rw-r--r-- 1 syoung root 21982038328 Nov 15 14:03 merged.bam-21
    -rw-r--r-- 1 syoung root  5741588480 Nov 16 10:55 merged.bam-26
    -rw-r--r-- 1 syoung root  9159262208 Nov 16 10:56 merged.bam-27
    -rw-r--r-- 1 syoung root 20857972154 Nov 16 18:54 merged.bam-30
    -rw-r--r-- 1 syoung root  5452152832 Nov 16 22:59 merged.bam-31
    -rw-r--r-- 1 syoung root 22065249521 Nov 17 06:59 merged.bam-33


HOWEVER, THE SORTED FILES FROM FILE 21 ONWARD APPEAR NORMAL AS HOPED:

ls -al merged*.bam | grep -v "\.0"

    -rw-r--r-- 1 syoung root  3770934242 Nov  4 14:39 merged-13-sorted.bam
    -rw-r--r-- 1 syoung root 22065249521 Nov 17 06:51 merged.bam
    -rw-rw-rw- 1 syoung root 16095604736 Nov 15 14:50 merged.sorted-21.bam
    -rw-rw-rw- 1 syoung root 17178046464 Nov 15 18:52 merged.sorted-22.bam
    -rw-rw-rw- 1 syoung root 17095139328 Nov 15 22:53 merged.sorted-23.bam
    -rw-rw-rw- 1 syoung root 14985842688 Nov 16 02:53 merged.sorted-24.bam
    -rw-rw-rw- 1 syoung root 21155708928 Nov 16 06:54 merged.sorted-25.bam
    -rw-rw-rw- 1 syoung root 20357452082 Nov 16 10:39 merged.sorted-26.bam
    -rw-rw-rw- 1 syoung root 20357452082 Nov 16 10:40 merged.sorted-27.bam
    -rw-rw-rw- 1 syoung root 21566006866 Nov 16 14:45 merged.sorted-28.bam
    -rw-rw-rw- 1 syoung root 21566006866 Nov 16 14:44 merged.sorted-29.bam
    -rw-rw-rw- 1 syoung root 20857972154 Nov 16 18:35 merged.sorted-30.bam
    -rw-rw-rw- 1 syoung root 22065242230 Nov 16 22:48 merged.sorted-31.bam
    -rw-rw-rw- 1 syoung root 22848372736 Nov 17 03:00 merged.sorted-32.bam
    -rw-rw-rw- 1 syoung root 22065249521 Nov 17 06:42 merged.sorted-33.bam


SOLUTION

RERUN AS cumulativ3:








FALSE START

time \
/nethome/bioinfo/apps/samtools/0.1.8/samtools \
merge \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative/chr22/merged.bam.temp \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/21/chr22/hit.bam \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative/chr22/merged.bam


NOW RUNNING

time \
/nethome/bioinfo/apps/samtools/0.1.8/samtools \
merge \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative/chr22/merged.bam.temp \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/25/chr22/hit.bam \
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative/chr22/merged.bam





bamCoverage.pl
--------------


FIRST RUN (1-10)
---------------

screen -S maq-bamcov

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/bamCoverage.pl \
--outdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative \
--inputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative/chr22/merged.bam-%REPLICATE% \
--outputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative/chr22/merged.bam-%REPLICATE%.coverage \
--replicates 1-10 \
--loop distributed \
--label bamCoverage \
--cluster LSF \
--maxjobs 1000 \
--queue small

    Run time: 00:23:17
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    11:45AM, 5 November 2010
    ****************************************

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative/chr22/

    merged.bam-1.coverage	average 11.250360
    merged.bam-2.coverage	average 22.507861
    merged.bam-3.coverage	average 35.137527
    merged.bam-4.coverage	average 46.395830
    merged.bam-5.coverage	average 57.654539
    merged.bam-6.coverage	average 68.911185
    merged.bam-7.coverage	average 80.165655
    merged.bam-8.coverage	average 91.422721
    merged.bam-9.coverage	average 102.681961


--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative/cumulativeSnp.out
cumulativeSNP.pl    Printing STDOUT to stdoutfile:



SECOND RUN (11-20)
-----------------

screen -S maq-bamcov

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/bamCoverage.pl \
--outdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative \
--inputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative/chr22/merged.bam-%REPLICATE% \
--outputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/maq/cumulative/chr22/merged.bam-%REPLICATE%.coverage \
--replicates 11-20 \
--loop distributed \
--label bamCoverage \
--cluster LSF \
--maxjobs 1000 \
--queue small

    
    Run time: 01:00:59
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    11:35AM, 8 November 2010
    ****************************************


    merged.bam-1.coverage	average 11.250360
    merged.bam-2.coverage	average 22.507861
    merged.bam-3.coverage	average 35.137527
    merged.bam-4.coverage	average 46.395830
    merged.bam-5.coverage	average 57.654539
    merged.bam-6.coverage	average 68.911185
    merged.bam-7.coverage	average 80.165655
    merged.bam-8.coverage	average 91.422721
    merged.bam-9.coverage	average 102.681961


==> merged.bam-10.coverage <==
average 113.932965

==> merged.bam-11.coverage <==
average 125.188901

==> merged.bam-12.coverage <==
average 136.445745

==> merged.bam-13.coverage <==
average 147.703428

==> merged.bam-14.coverage <==
average 158.958967

==> merged.bam-15.coverage <==
average 158.958967

==> merged.bam-16.coverage <==
average 170.217974

==> merged.bam-17.coverage <==
average 181.477059

==> merged.bam-18.coverage <==
average 192.730847

==> merged.bam-19.coverage <==
average 203.984893





NOTES
-----

MAQ OPTIONS
-----------

/nethome/bioinfo/apps/maq/0.7.1/maq match 

Usage:   maq map [options] <out.map> <chr.bfa> <reads_1.bfq> [reads_2.bfq]

Options: -1 INT      length of the first read (<=127) [0]
         -2 INT      length of the second read (<=127) [0]
         -m FLOAT    rate of difference between reads and references [0.001]
         -e INT      maximum allowed sum of qualities of mismatches [70]
         -d FILE     adapter sequence file [null]
         -a INT      max distance between two paired reads [250]
         -A INT      max distance between two RF paired reads [0]
         -n INT      number of mismatches in the first 24bp [2]
         -M c|g      methylation alignment mode [null]
         -u FILE     dump unmapped and poorly aligned reads to FILE [null]
         -H FILE     dump multiple/all 01-mismatch hits to FILE [null]
         -C INT      max number of hits to output. >512 for all 01 hits. [250]
         -s INT      seed for random number generator [random]
         -W          disable Smith-Waterman alignment
         -t          trim all reads (usually not recommended)
         -c          match in the colorspace
         


ELAND OPTIONS
-------------

http://bioit.dbi.udel.edu/manuals/GAPipeline/Whole_genome_alignments_using_ELAND

Running ELAND as a standalone program

	This has changed for 0.4
The eland_extended and eland_pair modes introduced in Pipeline version 0.3 share a common 'export' file format. The intention of this file is to combine all the important information for a lane into one file (or two files in the case of a paired read run). These scripts:

Bring in the base quality value information
Use the base quality values to pick the best alignment (taking into account read-pairing if relevant)
Give a quality score to the alignment
You do not get these files just by running the ELAND executable, the export files are generated by running several scripts to postprocess the raw ELAND output.
There seems to be an increasingly common requirement to run this set of scripts in a 'standalone' fashion. This can be done via the script Pipeline/Eland/ELAND_standalone.pl. Minimal usage:

./Pipeline/Eland/ELAND_standalone.pl -if read1.fastq -if read2.fastq -it fastq
-eg /lustre/data01/Mondas_software/Genomes/E_coli_ELAND
Full list of options:

option	short form	Description
--input-file	-if	must specify at least one file, specify two for paired analysis
--input-type	-it	type of input file: fastq, fasta or export
--read-length	-rl	will work it out from input file(s) if not specified
--seed-length	-sl	length of read used for ELAND alignment - default is to min of read-length and 32
--eland-genome	-eg	full path of a squashed genome directory
--output-prefix	-op	will produce a set of output files whose names prefixed by this - defaults to 'reanalysis'
--pipeline-dir	-pd	path of pipeline installation to call - by default, looks in same dir as executable is found
--base-quality	-bq	in fasta mode assume all bases have this quality (TBD)
--pair-params	-pp	paired read analysis parameters to pass to pickBestPair - multiple arguments must go in quotes - defaults to '--circular' - treats all chromosomes as circular
NB: for a paired read analysis, both reads must share same
input-type, read-length and seed-length


TBDs:

As of today (5.3.8), -it fasta doesn't work. You'll have to fake a fastq file with a constant base quality value of your choice.
I want to add in a partial reanalysis capability to do things like varying the filtering without having to do the whole realignment.
It doesn't do quality value recalibration at the moment (5.3.8), because that code is subject to change. It will do 'soon.'
For a paired-read run, the ELAND alignment of the two reads could be run in parallel to halve the time to result (assuming you have at least 2 cores free, as even your iPod probably does these days). It doesn't do this yet, it could.

ELAND_standalone is meant for:

Quickly testing effect of different filter parameters
Quickly testing alignment targets (e.g. align to genome + contaminants to check for contaminants).
Testing applications that read export files.
Quickly testing pipeline components (for internal use)
If you want to e.g. produce a set of export files for submission then it is probably best to re-run GERALD part of the pipeline to get a 'proper' analysis.

Pitfall:
It uses 'our' fastq encoding scheme (ASCII character = quality value + 64) rather than the more standard ASCII character = quality value + 32

A quick and dirty conversion from 'rest of the world' to 'us' can be done by

 
cat file.fastq | perl -lane '{ if ($l=~/^\+/) { s/(.)/chr(ord($1)+32)/eg;} print; $l=$_ }' > new.fastq
I propose to make ELAND_standalone.pl part of the 0.4 release as several of our informed external users have asked for it and it can't break the existing pipeline code to do so.





</entry>



<entry [Fri Oct 29 13:44:22 EDT 2010] DISC USAGE, SHIFT autochr22/maq AND hiseq TO /ngs/bioinfo>





screen -S mv-hiseq

RUNNING Sun Oct 31 02:13:08 EDT 2010



screen -S mv-maq

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22

mv maq /ngs/bioinfo/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/maq 




ON /ngs/bioinfo
---------------

/ngs/bioinfo/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22
-rw-rw-r--+  1 syoung bioinfo 31 Oct 28 11:41 du.txt

    bash-3.2$ cat du.txt
    579G    bowtie
    678G    eland
    22M     maq
    bash-3.2$ pwd
    
    
ON SCRATCH
-----------
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp
-rw-rw-r-- 1 syoung root   95 Oct 28 12:43 du.txt

    bash-3.2$ cat du.txt
    575G    100M
    2.6T    autochr22
    1.5K    du.txt
    8.1G    SRX000600
    31G     SRX000601
    123G    SRX000602
    55G     SRX000603
        
/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled

-rw-rw-r--  1 syoung root   63 Oct 28 13:19 du.txt

    bash-3.2$ cat du.txt .
    298G    2000bp
    3.3T    200bp
    1.5K    du.txt
    20G     SRX001539
    37G     SRX001540

  
/scratch/syoung/base/pipeline/SRA/NA18507
-rw-rw-r--  1 syoung root  45 Oct 28 13:19 du.txt

    bash-3.2$ cat du.txt 
    4.4T    SRP000239
    121G    SRP000726
    448M    SRS000101
    bash-3.2$ pwd
    
/scratch/syoung/base/pipeline
-rw-rw-r--  1 syoung root  99 Oct 28 12:49 du.txt

    bash-3.2$ cat du.txt
    3.3M    casava
    566K    catfilter
    26G     data
    1.5K    du.txt
    379G    hiseq
    155M    lemmon
    204K    lsf
    947M    piqa
    4.6T    SRA
    





</entry>



<entry [Fri Oct 29 13:43:22 EDT 2010] RUN bamCoverage.pl ON ALL ELAND 100M READ FILE HITS AND CUMULATIVELY MERGED BAM FILES>




1. USE samToBam.pl TO CONVERT ALL eland/*/chr22/hit.sam FILES TO BAM FILES
--------------------------------------------------------------------------

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/converters/samToBam.pl \
--replicates 1-33 \
--concurrent \
--inputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/%REPLICATE%/chr22/hit.sam \
--outputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/%REPLICATE%/chr22/hit.bam \
--reference chr22 \
--species human \
--walltime 24 \
--queue small \
--cluster LSF \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/%REPLICATE%/chr22/eland-chr22-samToBam-%REPLICATE%.out \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/loop-samToBam.out

    Run time: 00:02:38
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    1:43PM, 29 October 2010
    ****************************************

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland
ll */chr22/hit.bam

    -rw-r--r-- 1 syoung root 128M Oct 29 13:42 10/chr22/hit.bam
    -rw-r--r-- 1 syoung root 128M Oct 29 13:42 11/chr22/hit.bam
    -rw-r--r-- 1 syoung root 128M Oct 29 13:42 12/chr22/hit.bam
    -rw-r--r-- 1 syoung root 128M Oct 29 13:43 13/chr22/hit.bam
    -rw-r--r-- 1 syoung root 128M Oct 29 13:43 14/chr22/hit.bam
    -rw-r--r-- 1 syoung root 128M Oct 29 13:43 15/chr22/hit.bam
    -rw-r--r-- 1 syoung root 128M Oct 29 13:43 16/chr22/hit.bam
    -rw-r--r-- 1 syoung root 128M Oct 29 13:43 17/chr22/hit.bam
    -rw-r--r-- 1 syoung root 128M Oct 29 13:43 18/chr22/hit.bam
    -rw-r--r-- 1 syoung root 128M Oct 29 13:42 19/chr22/hit.bam
    -rw-r--r-- 1 syoung root 171M Oct 29 13:42 1/chr22/hit.bam
    -rw-r--r-- 1 syoung root 128M Oct 29 13:42 20/chr22/hit.bam
    -rw-r--r-- 1 syoung root 128M Oct 29 13:42 21/chr22/hit.bam
    -rw-r--r-- 1 syoung root 128M Oct 29 13:42 22/chr22/hit.bam
    -rw-r--r-- 1 syoung root 128M Oct 29 13:42 23/chr22/hit.bam
    -rw-r--r-- 1 syoung root 128M Oct 29 13:42 24/chr22/hit.bam
    -rw-r--r-- 1 syoung root 128M Oct 29 13:42 25/chr22/hit.bam
    -rw-r--r-- 1 syoung root 128M Oct 29 13:43 26/chr22/hit.bam
    -rw-r--r-- 1 syoung root 128M Oct 29 13:43 27/chr22/hit.bam
    -rw-r--r-- 1 syoung root 128M Oct 29 13:43 28/chr22/hit.bam
    -rw-r--r-- 1 syoung root 128M Oct 29 13:42 29/chr22/hit.bam
    -rw-r--r-- 1 syoung root 128M Oct 29 13:42 2/chr22/hit.bam
    -rw-r--r-- 1 syoung root 128M Oct 29 13:42 30/chr22/hit.bam
    -rw-r--r-- 1 syoung root 128M Oct 29 13:42 31/chr22/hit.bam
    -rw-r--r-- 1 syoung root 128M Oct 29 13:42 32/chr22/hit.bam
    -rw-r--r-- 1 syoung root 128M Oct 29 13:42 33/chr22/hit.bam
    -rw-r--r-- 1 syoung root 128M Oct 29 13:43 3/chr22/hit.bam
    -rw-r--r-- 1 syoung root 128M Oct 29 13:43 4/chr22/hit.bam
    -rw-r--r-- 1 syoung root 128M Oct 29 13:43 5/chr22/hit.bam
    -rw-r--r-- 1 syoung root 128M Oct 29 13:43 6/chr22/hit.bam
    -rw-r--r-- 1 syoung root 128M Oct 29 13:43 7/chr22/hit.bam
    -rw-r--r-- 1 syoung root 128M Oct 29 13:43 8/chr22/hit.bam
    -rw-r--r-- 1 syoung root 128M Oct 29 13:43 9/chr22/hit.bam


2. SORT BAM FILES
-----------------

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/converters/sortBam.pl \
--replicates 1-33 \
--concurrent \
--inputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/%REPLICATE%/chr22/hit.bam \
--outputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/%REPLICATE%/chr22/hit.sorted.bam \
--walltime 24 \
--queue small \
--cluster LSF \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/%REPLICATE%/chr22/eland-chr22-sortBam-%REPLICATE%.out \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/loop-sortBam.out
    
    Run time: 00:02:54
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    2:56PM, 29 October 2010
    ****************************************


OUTPUT FILES HAVE THE SAME SIZE AS INPUT FILES:

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland
ls -al */chr22/hit*bam

    -rw-r--r-- 1 syoung root 133569477 Oct 29 13:42 10/chr22/hit.bam
    -rw-r--r-- 1 syoung root 133569477 Oct 29 14:55 10/chr22/hit.sorted.bam
    -rw-r--r-- 1 syoung root 133415726 Oct 29 13:42 11/chr22/hit.bam
    -rw-r--r-- 1 syoung root 133415726 Oct 29 14:55 11/chr22/hit.sorted.bam
    -rw-r--r-- 1 syoung root 133364351 Oct 29 13:42 12/chr22/hit.bam
    -rw-r--r-- 1 syoung root 133364351 Oct 29 14:55 12/chr22/hit.sorted.bam
    -rw-r--r-- 1 syoung root 133518481 Oct 29 13:43 13/chr22/hit.bam
    ...



3. RUN indexBam.pl TO INDEX BAM FILES
-------------------------------------

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/converters/indexBam.pl \
--replicates 1-33 \
--concurrent \
--inputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/%REPLICATE%/chr22/hit.sorted.bam \
--outputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/%REPLICATE%/chr22/hit.sorted.bam.bai \
--walltime 24 \
--queue small \
--cluster LSF \
--stdout /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/%REPLICATE%/chr22/eland-chr22-indexBam-%REPLICATE%.out \
&> /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/cumulative/loop-indexBam.out
    
    Run time: 00:01:34
    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl
    4:45PM, 29 October 2010
    ****************************************



4. RUN bamCoverage.pl ON ALL BAM FILES
--------------------------------------

cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/bowtie/cumulative-5

screen -S eland-bamcov

/nethome/bioinfo/apps/agua/0.5/bin/apps/logic/loop.pl \
--executable /nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/bamCoverage.pl \
--outdir /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland \
--inputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/%REPLICATE%/chr22/hit.sorted.bam \
--outputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/%REPLICATE%/chr22/hit.sorted.bam.genome-coverage \
--replicates 1-33 \
--loop distributed \
--label bamCoverage \
--cluster LSF \
--maxjobs 1000 \
--queue small


OUTPUT FILES:

NOTE: FILE 1 hit.bam APPEARS TO HAVE AN EXCESSIVE NUMBER OF HITS


cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland
head */chr22/*coverage
    
    ==> 1/chr22/hit.sorted.bam.genome-coverage <==
    average 2.741045
    
    ==> 2/chr22/hit.sorted.bam.genome-coverage <==
    average 1.834721
    
    ==> 30/chr22/hit.sorted.bam.genome-coverage <==
    average 1.836326
    
    ==> 3/chr22/hit.sorted.bam.genome-coverage <==
    average 1.834348
    
    ==> 4/chr22/hit.sorted.bam.genome-coverage <==
    average 1.835051
    
    ==> 5/chr22/hit.sorted.bam.genome-coverage <==
    average 1.835160
    
    ==> 6/chr22/hit.sorted.bam.genome-coverage <==
    average 1.835015
    
    ==> 7/chr22/hit.sorted.bam.genome-coverage <==
    average 1.833538
    
    ==> 8/chr22/hit.sorted.bam.genome-coverage <==
    average 1.834927
    
    ==> 9/chr22/hit.sorted.bam.genome-coverage <==
    average 1.836536

    ==> 10/chr22/hit.sorted.bam.genome-coverage <==
    average 1.836427
    
    ==> 11/chr22/hit.sorted.bam.genome-coverage <==
    average 1.834642
    
    ==> 12/chr22/hit.sorted.bam.genome-coverage <==
    average 1.833757
    
    ==> 13/chr22/hit.sorted.bam.genome-coverage <==
    average 1.835765
    
    ==> 14/chr22/hit.sorted.bam.genome-coverage <==
    average 1.838303
    
    ==> 15/chr22/hit.sorted.bam.genome-coverage <==
    average 1.833275
    
    ==> 16/chr22/hit.sorted.bam.genome-coverage <==
    average 1.832750
    
    ==> 17/chr22/hit.sorted.bam.genome-coverage <==
    average 1.832687
    
    ==> 18/chr22/hit.sorted.bam.genome-coverage <==
    average 1.833080
    
    ==> 19/chr22/hit.sorted.bam.genome-coverage <==
    average 1.833941
    
    ==> 20/chr22/hit.sorted.bam.genome-coverage <==
    average 1.834073
    
    ==> 21/chr22/hit.sorted.bam.genome-coverage <==
    average 1.835210
    
    ==> 22/chr22/hit.sorted.bam.genome-coverage <==
    average 1.831621
    
    ==> 23/chr22/hit.sorted.bam.genome-coverage <==
    average 1.833807
    
    ==> 24/chr22/hit.sorted.bam.genome-coverage <==
    average 1.835943
    
    ==> 25/chr22/hit.sorted.bam.genome-coverage <==
    average 1.835538
    
    ==> 26/chr22/hit.sorted.bam.genome-coverage <==
    average 1.833362
    
    ==> 27/chr22/hit.sorted.bam.genome-coverage <==
    average 1.836140
    
    ==> 28/chr22/hit.sorted.bam.genome-coverage <==
    average 1.837566
    
    ==> 29/chr22/hit.sorted.bam.genome-coverage <==
    average 1.833393
    
    ==> 31/chr22/hit.sorted.bam.genome-coverage <==
    average 1.834134
    
    ==> 32/chr22/hit.sorted.bam.genome-coverage <==
    average 1.835982
    
    ==> 33/chr22/hit.sorted.bam.genome-coverage <==
    average 1.834751
    



WHICH RUNS:

/nethome/bioinfo/apps/agua/0.5/bin/apps/aligners/bamCoverage.pl \
--inputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/1/chr22/hit.sorted.bam \
--outputfile /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/1/chr22/hit.sorted.bam.genome-coverage

    average 0.641921



NOTES
-----


TEST SINGLE RUN OF indexBam.pl

/nethome/bioinfo/apps/agua/0.5/bin/apps/converters/indexBam.pl \
--inputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/1/chr22/hit.sorted.bam \
--cluster LSF \
--queue small
    


TEST SINGLE RUN OF sortBam.pl

/nethome/bioinfo/apps/agua/0.5/bin/apps/converters/sortBam.pl \
--inputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/1/chr22/hit.bam \
--outputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/1/chr22/hit.sorted.bam \
--cluster LSF \
--queue small
    
    sortBam.pl    Run time: 00:01:57
    sortBam.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/converters/sortBam.pl
    sortBam.pl    10-10-29 14:14:58
    sortBam.pl    ****************************************



NB: sortBam.pl TAKES ABOUT THE SAME TIME TO SORT ALREADY SORTED BAMFILE:

/nethome/bioinfo/apps/agua/0.5/bin/apps/converters/sortBam.pl \
--inputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/1/chr22/hit.sorted.bam \
--outputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/1/chr22/hit.sorted.bam \
--cluster LSF \
--queue small
    
    sortBam.pl    Run time: 00:02:13
    sortBam.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/converters/sortBam.pl
    sortBam.pl    10-10-29 14:21:02
    sortBam.pl  


TEST SINGLE RUN OF samToBam.pl

/nethome/bioinfo/apps/agua/0.5/bin/apps/converters/samToBam.pl \
--inputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/1/chr22/hit.sam \
--outputfiles /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/1/chr22/hit.bam \
--reference chr22 \
--species human \
--cluster LSF \
--queue large

    OK
    
    samToBam.pl    Run time: 00:02:02
    samToBam.pl    Completed /nethome/bioinfo/apps/agua/0.5/bin/apps/converters/samToBam.pl
    samToBam.pl    10-10-29 13:25:24
    samToBam.pl    ****************************************
    
    
cd /scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/autochr22/eland/1/chr22/
ll 
    -rw-r--r-- 1 syoung root 171M Oct 29 13:24 hit.bam
    -rw-rw-r-- 1 syoung root 596M Oct 13 13:41 hit.sam
    ...


