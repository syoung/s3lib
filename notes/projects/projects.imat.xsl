projects.imat

<entry [Sat 2011:04:09 22:02:16 EST] IMAT WORKFLOW OUTLINE>
    
PACKAGE		Workflow

PURPOSE:	A WORKFLOW IS AN OBJECT COMPOSED OF A CHAIN OR TREE OF App OBJECTS
            TIED TOGETHER WITH 'before' AND 'after' STAGE NUMBERS
            
E.G.,

PATHWAY STRUCTURE				PATHWAY NAME	PATHWAY LEVELS

1........1.......1.......1 	    1.1.1.1			1.1, 2.1, 3.1, 4.1

OR

1........1........1				1.1.1			1.1, 2.1, 3.1
:
:
2........1						1.2.1			1.1, 2.2, 3.1
:
:
3........1.........1			1.3.1.1			1.1, 2.3, 3.1, 4.1
         :
         :
         2.........1			1.3.2.1			1.1, 2.3, 3.2, 4.1


DATA STRUCTURE: HASHES AND ARRAYS
$array[1] = $ref1;
@$ref1 = 

my $hash = { 'stage'    => ..., 

    # APPLICATION INFO

    application,			# iprscan4.pl	
    type,					# perl | bin | sh | ... etc.
    configfile,
    inputfile,
    outputfile,
    arguments,
    stdoutfile,
    stderrfile, 
    
                            # PIPELINE INFO

    pipeline,				
    stage,
    database,
    user,
    password,
    status		
};


EXAMPLE

    Orthologues Workflow
    
    THIS COLLECTION OF Workflow OBJECTS IS SPECIFICALLY	DESIGNED TO PROCESS,
    
    ANALYSE AND DISPLAY A COLLECTION OF ORTHOLOGOUS	SEQUENCES (THIS SCHEMA
    
    MAY CHANGE BUT THE OVERALL DESIGN REMAINS THE SAME)
    
    THE Workflow OBJECTS RUN THEIR COMPONENT STAGES AND UPDATE THE DATABASE
    
    WITH THE PROGRESS STATUS (none, running, completed, error), DATETIME, ETC.
    
    
    Workflow 1  -  PROCESS RAW DATA INTO orthologue AND RUN IPRSCAN
    ==========
    
        1.1.1	orthologues.pl              LOAD ORTHOLOGUE SEQUENCES INTO DATABASE
        
        1.2.1	orthologuesorf.pl			GET ORFS
        
        1.3.1	orthologuesarrayiprscan.pl	RUN ARRAY IPRSCAN
        
        1.4.1	orthologuesiprscan.pl		1. PARSE IPRSCAN OUTPUT FILES USING ORF INFORMATION
                                            2. PRINTS .TSV FILE
                                            3. LOAD IPRSCAN FILES INTO orthologuesiprscan TABLE 
        
    Workflow 2 - BLAST
    ==========
    
        REQUIRES:  Workflow 1, stage 2.1
        
        2.1.1	orthologuesarrayblast.pl	RUN ARRAY BLAST
        
        2.2.1	orthologuesarrayblastloaddata.pl	LOAD DATA INTO orthologuesblast TABLE
        
        2.3.1	orthologuesbesthit.pl		1. GET BEST HITS
                                            2. PRINT .TSV FILE
                                            3. LOAD INTO orthologuesbesthit TABLE
                                            
        2.4.1	orthologuesannotation.pl	DO ANNOTATION
    
    
    Workflow 3 - IPRSCAN SVG
    ==========
    
    REQUIRES	orthologuesannotation.pl			WORKFLOW 1, ST
    REQUIRED	orthologuesiprscan.pl				WORKFLOW 2
    
    orthologuesiprscansvg.pl
    
    orthologuesiprscandomain.pl
    
    orthologuesiprscandomainsvg.pl
    
    iprscan.cgi


    # WORKFLOW INFO
    SCHEMA
    pipeline,				
    stage,
    database,
    user,
    password,
    status
    

    
</entry>


