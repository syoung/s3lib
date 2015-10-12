CREATE TABLE dbsnp (

    chromosome      varchar(255),
    chromosomeStart int(10),
    chromosomeEnd   int(10),
    snp             varchar(20),
    score           int(10),
    strand          char(1),
    
    PRIMARY KEY(snp)
);

