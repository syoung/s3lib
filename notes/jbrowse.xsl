jbrowse


<entry [Thu 2013:07:25 05:03:58 EST] CONVERTED ALL FEATURE FILES TO FEATURES WITH data-to-json.pl>

1. MOVED ALL DOWNLOADED *.txt.gz AND *.sql FILES TO

/mnt/data/jbrowse/species/human/hg19/ucsc/in


2. DOWNLOADED trackDb.sql AND trackDb.txt.gz TO uscs/in:

wget ftp://hgdownload.cse.ucsc.edu/goldenPath/hg19/database/trackDb.txt.gz
wget ftp://hgdownload.cse.ucsc.edu/goldenPath/hg19/database/trackDb.sql


3. RAN ucsc-to-json.pl (OUTPUTS TO 'data' FOLDER)

/aguadev/html/plugins/view/jbrowse/bin/ucsc-to-json.pl --in in --track ccdsGene

    OK - NEW FORMAT OF trackData.json

FORMATTED THESE:
    
ccdsGene
dgv
exoniphy
geneid
hgIkmc
hinv70NonCoding
hinv70PseudoGene
knownGene
nscanGene
refGene
sgpGene
vegaGene
vegaPseudoGene


COULDN'T FORMAT THESE:

Track wgEncodeGencodePolyaV4 not found in the UCSC track database (trackDb.txt.gz) file.  Is it a real UCSC track? at /aguadev/html/plugins/view/jbrowse/bin/ucsc-to-json.pl line 194.

wgEncodeGencodeAutoV4
wgEncodeGencodePolyaV4
wgEncodeGencode2wayConsPseudoV4


4. VERIFIED trackList.json

emacs -nw data/trackList.json

    {
       "tracks" : [
          {
             "urlTemplate" : "tracks/knownGene/{refseq}/trackData.json",
             "style" : {
                "className" : "generic_parent",
                "featureCss" : "background-color: #0c0c78; height: 6px;",
                "histCss" : "background-color: #0c0c78;"
             },
             "compress" : 0,
             "label" : "knownGene",
             "type" : "FeatureTrack",
             "hooks" : {
                "modify" : "function(track, feat, elem) {\n    var fType = feat.get(\"Type\");\n    if (fT\
    ype) {\n        elem.className = \"basic\";\n        switch (fType) {\n        case \"CDS\":\n        \
    case \"thick\":\n            elem.style.height = \"10px\";\n            elem.style.marginTop = \"-3px\\
    ";\n            break;\n        case \"UTR\":\n        case \"thin\":\n            elem.style.height =\
     \"6px\";\n            elem.style.marginTop = \"-1px\";\n            break;\n        }\n        elem.s\
    tyle.backgroundColor = \"#0c0c78\";\n    }\n}\n"
             },
             "key" : "knownGene"
          },

          
          
5. REPLACED hg19-MINI DATA WITH NEW DATA

cd /mnt/data/jbrowse/species/human/hg19/
mv data data-hg19-mini
cp -r ucsc data


6. RERAN addView WITH {refseq}/knownGene REPLACED BY knownGene/{refSeq}




    
</entry>
<entry [Thu 2013:07:25 04:09:43 EST] DOWNLOADED FEATURE DATA FILES FROM UCSC>

DOWNLOADED ALL TRACKS WITH ICONS FROM UCSC:

ftp://hgdownload.cse.ucsc.edu/goldenPath/hg19/database/

E.G.:

wget ftp://hgdownload.cse.ucsc.edu/goldenPath/hg19/database/hinv70PseudoGene.txt.gz
wget ftp://hgdownload.cse.ucsc.edu/goldenPath/hg19/database/hinv70PseudoGene.sql

ALL TRACKS WITH ICONS:

ccdsGene
dgv
exoniphy
geneid
hgIkmc
hinv70NonCoding
hinv70PseudoGene
knownGene
nscanGene
refGene
sgpGene
vegaGene
vegaPseudoGene
wgEncodeGencodeAutoV4
wgEncodeGencodePolyaV4
wgEncodeGencode2wayConsPseudoV4


NB: JBROWSE MINI DATA IS IN OLD FORMAT:

jbrowse-1.2.1-hg19mini (RELEASED March 2012)
cd /mnt/data/jbrowse/species/human/hg19 # 63MB
wget http://jbrowse.org/releases/jbrowse-1.2.1-hg19mini.tar.gz

NB: PREVIOUSLY DOWNLOADED MINI HUMAN DATA (COMPATIBLE WITH JBROWSE VERSION 1.2)
http://jbrowse.org/releases/data/ucsc/hg19mini-2.tar.gz


    
</entry>
<entry [Sun 2013:07:21 14:20:42 EST] ADDED JBrowse DEPENDENCIES>

cd /aguadev/html/dojo

git clone https://github.com/kriszyp/put-selector.git
git clone https://github.com/kriszyp/xstyle.git
git clone https://github.com/rbuels/jszlib.git
git clone https://github.com/jDataView/jDataView.git
git clone https://github.com/rbuels/lazyload.git

    
</entry>
<entry [Sun 2013:07:21 02:05:37 EST] INSTALLED 1.9.8 ON LAPTOP>


1. INSTALL extlib DEPENDENCIES

apt-get install libgd2-xpm          #### ALREADY INSTALLED
apt-get install libgd2-xpm-dev      #### NOT ALREADY INSTALLED

TO AVOID THIS ERROR:
**UNRECOVERABLE ERROR**
Could not find gdlib-config in the search path. Please install libgd 2.0.28 or higher.

cd /mnt/software/jbrowse/1.9.8
cpanm -v --notest -l extlib/ --installdeps .

    Successfully installed GD-2.50    


2. COPY TO PLUGINS

MOVE OLD JBROWSE
mv /aguadev/html/plugins/view/jbrowse/ /mnt/software/jbrowse/jbrowse

COPY NEW JBROWSE
cp -r /mnt/software/jbrowse/1.9.8# /aguadev/html/plugins/view/jbrowse    



</entry>
<entry [Tue 2012:05:22 18:36:36 EST] prepare-refseqs.pl USAGE>

http://gmod.org/wiki/JBrowse_Configuration_Guide#Reference_Sequences

prepare-refseqs.pl

This script is used to input sequence data into JBrowse, and must be run prior to the addition of feature tracks or image tracks. The simplest way to use it is with the --fasta option, which uses a single sequence or set of reference sequences from a FASTA file:

bin/prepare-refseqs.pl --fasta < fasta file> [options]


If the file has multiple sequences (e.g. multiple chromosomes), each sequence will become a reference sequence by default. You may switch between these sequences by selecting the sequence of interest via the pull-down menu to the right of the large "zoom in" button.

You may use any alphabet you wish for your sequences (i.e., you are not restricted to the nucleotides A, T, C, and G; any alphanumeric character, as well as several other characters, may be used). Hence, it is possible to browse RNA and protein in addition to DNA. However, some characters should be avoided, because they will cause the sequence to "split" - part of the sequence will be cut off and and continue on the next line. These characters are the hyphen and question mark. Unfortunately, this prevents the use of hyphens to represent gaps in a reference sequence.

In addition to reading from a fasta file, prepare-refseqs.pl can read sequences from a gff file or a database. In order to read fasta sequences from a database, a config file must be used.

Syntax used to import sequences from gff files:
bin/prepare-refseqs.pl --gff < gff file with sequence information> [options]

Syntax used to import sequences with a config file:

bin/prepare-refseqs.pl --conf < config file that references a database with sequence information> --[refs|refid] < reference sequences> [options]

Option	 Value
fasta, gff, or conf	 Path to the file that JBrowse will use to import sequences. With the fasta and gff options, the sequence information is imported directly from the specified file. With the conf option, the specified config file includes the details necessary to access a database that contains the sequence information. Exactly one of these three options must be used.

out	 A path to the output directory (default is 'data' in the current directory)

seqdir	 The directory where the reference sequences are stored (default: < output directory>/seq)

noseq	 Causes no reference sequence track to be created. This is useful for reducing disk usage.

refs	 A comma-delimited list of the names of sequences to be imported as reference sequences. This option (or refid) is required when using the conf option. It is not required when the fasta or gff options are used, but it can be useful with these options, since it can be used to select which sequences JBrowse will import.

refids	 A comma-delimited list of the database identifiers of sequences to be imported as reference sequences. This option is useful when working with a Chado database that contains data from multiple different species, and those species have at least one chromosome with the same name (e.g. chrX). In this case, the desired chromosome cannot be uniquely identified by name, so it is instead identified by ID. This ID can be found in the 'feature_id' column of 'feature' table in a Chado database.




    
</entry>
<entry [Sun 2012:05:20 22:27:01 EST] JBROWSE - GMOD CONFIG FILES>
    
http://gmod.org/wiki/JBrowseDev/Current/Usage/ConfigFiles


</entry>
<entry [Sun 2012:05:20 17:43:19 EST] GENERATED seq FILES USING jbrowseRefseq.pl>

UPLOAD THESE FILES/DIRS TO aquarius-8 DATA

/data/apps/jbrowse/100511/bin/prepare-refseqs.pl
/data/jbrowse/species/human/hg19/data/trackInfo.js   #### ADDED 'DNA' key
/data/jbrowse/species/human/hg19/seqs
/data/jbrowse/species/human/hg19/refSeqs.js     #### ADDED 'chrM'
/data/sequence/species/human/hg19/fasta/chrM.fa


CHANGED jbrowseRefseq.pl TO USE JBrowse::generateReference:

reset ; \
/agua/bin/jbrowse/jbrowseRefseq.pl \
--inputdir /data/sequence/reference/human/hg19/fasta \
--outputdir /tmp/jbrowse \
--chunksize 20000

    Printed refseqfile: /tmp/jbrowse/data/refSeqs.js
    
    jbrowseRefseq.pl    Run time: 00:03:16
    jbrowseRefseq.pl    Completed /agua/bin/jbrowse/jbrowseRefseq.pl
    jbrowseRefseq.pl    12-05-20 21:34:23
    jbrowseRefseq.pl    ****************************************


WHICH CALLS prepare-refseqs.pl:

/data/apps/jbrowse/100511/bin/prepare-refseqs.pl \
--fasta /data/sequence/reference/human/hg19/fasta/chr22.fa \
--out /tmp/jbrowse



</entry>
<entry [Mon 2012:05:07 02:55:49 EST] CANONICAL LIST OF JBROWSE FEATURES>

SAVED LIST AS /data/jbrowse/species/human/hg19/feature.tsv

agua			exoniphy	static	human	hg19	/data/jbrowse/human/hg19/exoniphy
agua			sgpGene	static	human	hg19	/data/jbrowse/human/hg19/sgpGene
agua			wgEncodeGencodePolyaV4	static	human	hg19	/data/jbrowse/human/hg19/wgEncodeGencodePolyaV4
agua			wgEncodeGencode2wayConsPseudoV4	static	human	hg19	/data/jbrowse/human/hg19/wgEncodeGencode2wayConsPseudoV4
agua			hinv70NonCoding	static	human	hg19	/data/jbrowse/human/hg19/hinv70NonCoding
agua			hinv70PseudoGene	static	human	hg19	/data/jbrowse/human/hg19/hinv70PseudoGene
agua			dgv	static	human	hg19	/data/jbrowse/human/hg19/dgv
agua			knownAlt	static	human	hg19	/data/jbrowse/human/hg19/knownAlt
agua			knownGene	static	human	hg19	/data/jbrowse/human/hg19/knownGene
agua			ccdsGene   
agua			refGene	static	human	hg19	/data/jbrowse/human/hg19/refGene
agua			hgIkmc	static	human	hg19	/data/jbrowse/human/hg19/hgIkmc
agua			nscanGene	static	human	hg19	/data/jbrowse/human/hg19/nscanGene
agua			wgEncodeGencodeAutoV4	static	human	hg19	/data/jbrowse/human/hg19/wgEncodeGencodeAutoV4
agua			vegaPseudoGene	static	human	hg19	/data/jbrowse/human/hg19/vegaPseudoGene
agua			vegaGene	static	human	hg19	/data/jbrowse/human/hg19/vegaGene

    
</entry>
<entry [Sat 2011:12:10 04:25:39 EST] TESTED jbrowseFeatures.pl ON CLUSTER>


1. USING BAM FILE DOWNLOADED FROM THE SRA



2. RAN jbrowseFeatures.pl IN AGUA


WHICH RUNS:

cd /nethome/syoung/agua/Project1/Workflow1/jbrowse/out;
/data/apps/jbrowse/1.2.6/bin/bam-to-json.pl  \/data/apps/jbrowse/100511/bin$ ./prepare-refseqs.pl --fasta /data/sequence/reference/human/hg19/fasta/chr22.fa --out /tmp/jbrowse

--bam /nethome/syoung/agua/Project1/Workflow1/chr22/out.bam  \
--tracklabel tophat-1 \
--key tophat-1



3. CHECKED GENERATED FILES OKAY:

cd /nethome/syoung/agua/Project1/Workflow1/jbrowse/out/data/tracks/chr22/tophat-1
    
    ...
    -rw-r--r-- 1 root root  49K 2011-05-24 12:55 lazyfeatures-98.json
    -rw-r--r-- 1 root root  49K 2011-05-24 12:55 lazyfeatures-99.json
    -rw-r--r-- 1 root root   46 2011-05-24 12:55 lazyfeatures-9.json
    -rw-r--r-- 1 root root 4.8K 2011-05-24 12:55 trackData.json

    
</entry>
<entry [Tue 2011:12:13 05:52:29 EST] FIXED ORDER OF TRACKS DROPPED ONTO>
    
IN Browser.createTrackList, THIS HANDLES ADDING TRACKS FROM TRACKLIST TO DISPLAYED TRACKS:

	var trackCreate = function(track, hint) {
		var node;

			// ADDED: ADD NEW TRACK IN CORRECT ORDER TO TRACKLIST IN View.js
			setTimeout(
				function ()
				{
					brwsr.viewObject.tracklist = brwsr.listTracks();
					brwsr.parentWidget.updateViewTracklist(brwsr.viewObject);
				},
				100
			);



AND THIS HANDLES REMOVING TRACKS OR REORDERING TRACKS:

	dojo.subscribe("/dnd/drop", function(source,nodes,iscopy){

console.log("js.Browser.createTrackList    inside dojo.subscribe('/dnd/drop')    source:");
console.dir({source:source});

		brwsr.onVisibleTracksChanged();
		//multi-select too confusing?
		//brwsr.viewDndWidget.selectNone();

		// ADDED: SIGNAL REMOVE TRACK IN View.js
		// NB: USE track.name FOR NAME OF TRACK
		if ( source === brwsr.viewDndWidget )
		{
			console.log("js.Browser.createTrackList    /dnd/drop   nodes[0].track.name: " + nodes[0].track.name);
			console.dir({track:nodes[0].track});
			console.dir({trackListWidget:brwsr.trackListWidget});
			console.dir({viewDndWidget:brwsr.viewDndWidget});

			// ADD/REMOVE UPDATE TRACKLIST IN View.js
			if ( source.anchor == null ) {
				brwsr.parentWidget.handleTrackChange(brwsr.viewObject, nodes[0].track.name, "remove");
			}
			else {
				console.log("js.Browser.createTrackList    MOVED TRACK. UPDATE TRACK ORDERING");
				brwsr.viewObject.tracklist = brwsr.listTracks();
				brwsr.parentWidget.updateViewTracklist(brwsr.viewObject);
			}
		}
	});


</entry>
<entry [Mon 2011:12:12 23:43:54 EST] ADDED ICON IMAGES FOR ALL FEATURES>

knownGene
hinv70NonCoding
hinv70PseudoGene
hgIkmc
dgv
vegaGene
wgEncodeGencodeAutoV4
vegaPseudoGene
wgEncodeGencodePolyaV4
wgEncodeGencode2wayConsPseudoV4
ccdsGene
refGene
nscanGene
sgpGene
geneid
exoniphy


.view .knownGene-label {
	background-image: url("../../../plugins/view/images/label-ucsc-16.png");	
}

.view .hinv70NonCoding-label {
	background-image: url("../../../plugins/view/images/label-h-inv-16.png");	
}

.view .hinv70PseudoGene-label {
	background-image: url("../../../plugins/view/images/label-h-inv-16.png");	
}

.view .hgIkmc-label {
	background-image: url("../../../plugins/view/images/label-sanger-16.png");	
}

.view .dgv-label {
	background-image: url("../../../plugins/view/images/label-dgv-16.png");	
}

.view .vegaGene-label {
	background-image: url("../../../plugins/view/images/label-vega-16.png");	
}

.view .wgEncodeGencodeAutoV4-label {
	background-image: url("../../../plugins/view/images/label-gencode-16.png");	
}

.view .vegaPseudoGene-label {
	background-image: url("../../../plugins/view/images/label-vega-16.png");	
}

.view .wgEncodeGencodePolyaV4-label {
	background-image: url("../../../plugins/view/images/label-gencode-16.png");	
}

.view .wgEncodeGencode2wayConsPseudoV4-label {
	background-image: url("../../../plugins/view/images/label-gencode-16.png");	
}

.view .ccdsGene-label {
	background-image: url("../../../plugins/view/images/label-ccds-16.png");	
}

.view .refGene-label {
	background-image: url("../../../plugins/view/images/label-refseq-16.png");	
}

.view .nscanGene-label {
	background-image: url("../../../plugins/view/images/label-nscan-16.png");	
}

.view .sgpGene-label {
	background-image: url("../../../plugins/view/images/label-gencode-16.png");	
}

.view .geneid-label {
	background-image: url("../../../plugins/view/images/label-gencode-16.png");	
}


.view .exoniphy-label {
	background-image: url("../../../plugins/view/images/label-exoniphy-16.png");	
}
 

</entry>
<entry [Sun 2011:12:11 02:53:27 EST] ADDED COLOURS FOR DISPLAYED TRACK LABELS>

1. USES THE sourceType KEY ADDED TO trackInfo.js

2. ADDED CODE TO GenomeView.js:

GenomeView.prototype.addTrack = function(track) {

	console.log("js.GenomeView.addTrack    track:" + track);
	console.dir({track:track});

    var trackNum = this.tracks.length;
    var labelDiv = document.createElement("div");
    labelDiv.className = "track-label dojoDndHandle";

	// ADD CLASSES	
	dojo.addClass(labelDiv, track.trackMeta.label + "-label");
	var sourceType = track.trackMeta.sourceType;
	if ( sourceType ) {
		var sourceClass = sourceType + "-label";
		console.log("js.GenomeView.addTrack    ADDING CLASS sourceClass:" + sourceClass);
		
		dojo.addClass(labelDiv, sourceClass);
	}

	// ADD ONDBLCLICK
	var urlInfo = track.trackMeta.urlInfo;
	if ( urlInfo ) {
		console.log("js.GenomeView.addTrack    ADDING ondblclick FOR label:" + track.trackMeta.label);

		labelDiv.ondblclick = function(event) {
			console.log("js.GenomeView.addTrack    FIRED ondblclick FOR urlInfo:" + urlInfo);
			window.open(urlInfo, "_blank");
			event.stopPropagation();
		}
	}
	else {
		labelDiv.ondblclick = function(event) {
			console.log("js.GenomeView.addTrack    FIRED EMPTY ondblclick");
			event.stopPropagation();
		}
	}
	
    
</entry>
<entry [Sun 2011:12:11 01:34:03 EST] ADDED COLOURS FOR TRACK LABELS IN TRACK LIST>


PART 1. ADDED sourceType KEY TO trackData.json (CURRENTLY JUST static/dynamic VALUES)

PART 2. HOOKED INTO THE dropped track OBJECT (ACTUALLY trackInfo.js DATA) Browser.createTrackList

AND THE FULL trackInfo.js LIST in params.trackData. THESE ARE USED INSIDE trackListCreate,

THE CREATOR FOR DROPPED TRACK LABELS:


    var trackListCreate = function(track, hint) {
    ...


	this.trackListWidget = new dojo.dnd.Source(trackListDiv,
		{
			creator: trackListCreate,
			accept: ["track"],
			withHandles: false
		}
	);


PROCEDURE FOR PART 1:
====================

1. BACKUP ALL DATA

sudo cp -r /data/jbrowse/species/human/hg19/demo \
/data/jbrowse/species/human/hg19/demo.bkp2

2 ADD sourceType VALUE

sudo /agua/0.6/bin/jbrowse/trackInfo.pl \
--inputfile /data/jbrowse/species/human/hg19/demo/test1/data/trackInfo.js \
--assign trackInfo \
--mode insert \
--key sourceType \
--value dynamic \
--logfile /tmp/trackinfo.log

sudo /agua/0.6/bin/jbrowse/trackInfo.pl \
--inputfile /data/jbrowse/species/human/hg19/demo/test2/data/trackInfo.js \
--assign trackInfo \
--mode insert \
--key sourceType \
--value dynamic \
--logfile /tmp/trackinfo.log

sudo /agua/0.6/bin/jbrowse/trackInfo.pl \
--inputfile /data/jbrowse/species/human/hg19/demo/control1/data/trackInfo.js \
--assign trackInfo \
--mode insert \
--key sourceType \
--value dynamic \
--logfile /tmp/trackinfo.log

sudo /agua/0.6/bin/jbrowse/trackInfo.pl \
--inputfile /data/jbrowse/species/human/hg19/demo/control2/data/trackInfo.js \
--assign trackInfo \
--mode insert \
--key sourceType \
--value dynamic \
--logfile /tmp/trackinfo.log


head /data/jbrowse/species/human/hg19/demo/*/data/trackInfo.js
    ==> /data/jbrowse/species/human/hg19/demo/control1/data/trackInfo.js <==
    trackInfo = [
       {
          "sourceType" : "dynamic",
          "url" : "data/tracks/{refseq}/control1/trackData.json",
          "label" : "control1",
          "type" : "FeatureTrack",
          "key" : "control1"
       }
    ]
    
    ==> /data/jbrowse/species/human/hg19/demo/control2/data/trackInfo.js <==
    trackInfo = [
       {
          "sourceType" : "dynamic",
          "url" : "data/tracks/{refseq}/control2/trackData.json",
          "label" : "control2",
          "type" : "FeatureTrack",
          "key" : "control2"
       }
    ]
    
    ==> /data/jbrowse/species/human/hg19/demo/test1/data/trackInfo.js <==
    trackInfo = [
       {
          "sourceType" : "dynamic",
          "url" : "data/tracks/{refseq}/test1/trackData.json",
          "label" : "test1",
          "type" : "FeatureTrack",
          "key" : "test1"
       }
    ]
    
    ==> /data/jbrowse/species/human/hg19/demo/test2/data/trackInfo.js <==
    trackInfo = [
       {
          "sourceType" : "dynamic",
          "url" : "data/tracks/{refseq}/test2/trackData.json",
          "label" : "test2",
          "type" : "FeatureTrack",
          "key" : "test2"
       }
    ]



CODE FOR PART 2:
================


ADDED CODE TO Browser.js:

createTrackList : function(parent, params) {
    ...
    
	var setNodeDblClick = function (node, url) {
		node.ondblclick = function(event) {
			//console.log("js.Browser.trackListCreate    DOING DOUBLECLICK url: "  + url);
			window.open(url, "_blank");
			event.stopPropagation();
		};
	};

	var trackListCreate = function(track, hint) {

		var node = document.createElement("div");
		node.className = "tracklist-label";
		node.innerHTML = track.key;

		// ADDED: ONCLICK IF trackInfo.infoUrl EXISTS
		for ( var i = 0; i < params.trackData.length; i++ ) {
			if ( params.trackData[i].label == track.label ) {
				if ( params.trackData[i].urlInfo ) {
					setNodeDblClick(node, params.trackData[i].urlInfo);
				}
				break;
			}		
		}
		
		// ADDED: source LABEL CLASS
		for ( var i = 0; i < params.trackData.length; i++ ) {
			
			if ( params.trackData[i].label == track.label ) {
				if ( params.trackData[i].sourceType != null ) {
					dojo.addClass(node, params.trackData[i].sourceType + "-label");
				}
				continue;
			}	
		}


</entry>
<entry [Sun 2011:12:11 00:45:23 EST] FIXED 'NaN .. NaN 'LOCATION BROWSER FAILURE>

ADDED TO GenomeView LINE 633 TO AVOID 'NaN .. NaN' ON BROWSER STARTUP:

	if ( ! this.minVisible() || ! this.maxVisible() ) {
		console.log("js.GenomeView.showCoarse    ! this.minVisible() or ! this.maxVisible(). Returning");
		return;
	}

    
</entry>
<entry [Fri 2011:12:09 10:45:13 EST] FIXED ERROR: object is undefined>

FIXED BY CHANGING:

    TO return TRUE FROM Agua.removeView TO MAKE SURE Views.updateTrackLocation
    
        CONTINUES ON TO ADD BACK 
    
    TO USE removeObjectsFromArray FOR VIEWFEATURES


</entry>
<entry [Sat 2011:12:10 01:58:37 EST] CORRECTED hist-* URL IN trackData.json OF test1/test2 DEMO DATA>

CREATED SCRIPT jbrowse/replaceHistUrl.pl TO CHANGE TO CORRECT hist-* URL


0. COPIED USER DATA TO JBROWSE demo DATA

mkdir -p /data/jbrowse/species/human/hg19/demo
cd /data/jbrowse/species/human/hg19/demo
cp -r /nethome/syoung/agua/Project1/Workflow9/jbrowse/control1 .
cp -r /nethome/syoung/agua/Project1/Workflow9/jbrowse/control2 .
cp -r /nethome/syoung/agua/Project1/Workflow9/jbrowse/test2 .
cp -r /nethome/syoung/agua/Project1/Workflow9/jbrowse/test1 .


1. PRETTY ALL

sudo /agua/0.6/bin/jbrowse/trackData.pl \
--inputfile "/data/jbrowse/species/human/hg19/demo/*/data/tracks/chr22/*/trackData.json" \
--mode pretty

    /data/jbrowse/species/human/hg19/demo/control2/data/tracks/chr22/control2/trackData.json
    /data/jbrowse/species/human/hg19/demo/test1/data/tracks/chr22/test1/trackData.json
    /data/jbrowse/species/human/hg19/demo/test2/data/tracks/chr22/test2/trackData.json
    /data/jbrowse/species/human/hg19/demo/control1/data/tracks/chr22/control1/trackData.json


tail -n 3 /data/jbrowse/species/human/hg19/demo/*/data/tracks/chr22/*/trackData.json
==> /data/jbrowse/species/human/hg19/demo/control1/data/tracks/chr22/control1/trackData.json <==
   "lazyfeatureUrlTemplate" : "data/tracks/chr22/control1//lazyfeatures-{chunk}.json"

==> /data/jbrowse/species/human/hg19/demo/control2/data/tracks/chr22/control2/trackData.json <==
   "lazyfeatureUrlTemplate" : "data/tracks/chr22/control2//lazyfeatures-{chunk}.json"

==> /data/jbrowse/species/human/hg19/demo/test1/data/tracks/chr22/test1/trackData.json <==
   "lazyfeatureUrlTemplate" : "data/tracks/chr1/test1//lazyfeatures-{chunk}.json"

==> /data/jbrowse/species/human/hg19/demo/test2/data/tracks/chr22/test2/trackData.json <==
   "lazyfeatureUrlTemplate" : "data/tracks/chr1/test2//lazyfeatures-{chunk}.json"


2. ADD CORRECT lazyfeatureUrlTemplate VALUE

sudo /agua/0.6/bin/jbrowse/trackData.pl \
--inputfile /data/jbrowse/species/human/hg19/demo/test1/data/tracks/chr22/test1/trackData.json \
--mode insert \
--key "lazyfeatureUrlTemplate" \
--value "data/tracks/chr22/test1/lazyfeatures-{chunk}.json"    


sudo /agua/0.6/bin/jbrowse/trackData.pl \
--inputfile /data/jbrowse/species/human/hg19/demo/test2/data/tracks/chr22/test2/trackData.json \
--mode insert \
--key "lazyfeatureUrlTemplate" \
--value "data/tracks/chr22/test2/lazyfeatures-{chunk}.json"    


3. MANUALLY EDIT histogramMeta ENTRY IN trackData.json

"histogramMeta" : [
    {
        "basesPerBin" : "1000",
        "arrayParams" : {
           "length" : 249241,
           "chunkSize" : 10000,
===>        "urlTemplate" : "data/tracks/chr1/test2//hist-1000-{chunk}.json"
        }
    },
    {
        "basesPerBin" : "100000",
        "arrayParams" : {
           "length" : 2493,
           "chunkSize" : 10000,
===>        "urlTemplate" : "data/tracks/chr1/test2//hist-100000-{chunk}.json"
        }
    }
],


em /data/jbrowse/species/human/hg19/demo/test1/data/tracks/chr22/test1/trackData.json
em /data/jbrowse/species/human/hg19/demo/test2/data/tracks/chr22/test2/trackData.json


4. UPDATED test1/test2 LOCATIONS IN feature TABLE TO JBROWSE demo DATA LOCATION

update feature set location ='/data/jbrowse/species/human/hg19/demo/test1' where location = '/nethome/syoung/agua/Project1/Workflow9/jbrowse/test1';

update feature set location ='/data/jbrowse/species/human/hg19/demo/test2' where location = '/nethome/syoung/agua/Project1/Workflow9/jbrowse/test2';


5. DROP/ADDED BACK TO VIEW

    OK


    
</entry>
<entry [Fri 2011:12:09 01:32:51 EST] FIXED OPENHAND AND CLOSEDHAND CURSORS IN JBROWSE>

EDITED jbrowse/jbrowse.js LINE 1110:

//_1f.elem.style.cursor="url(\"openhand.cur\"), move";
_1f.elem.style.cursor="url(\"plugins/view/jbrowse/openhand.cur\"), move";


LINE 1151:

//document.body.style.cursor="url(\"closedhand.cur\"), move";
document.body.style.cursor="url(\"closedhand.cur\"), move";


LINE 1219:

//document.body.style.cursor="url(\"closedhand.cur\")";
document.body.style.cursor="url(\"plugins/view/jbrowse/closedhand.cur\")";




AND jbrowse/js/GenomeView.js LINE 353:

//        view.elem.style.cursor = "url(\"openhand.cur\"), move";
        view.elem.style.cursor = "url(\"plugins/view/jbrowse/openhand.cur\"), move";

LINE 406:
	//document.body.style.cursor = "url(\"closedhand.cur\"), move";
	//view.elem.style.cursor = "url(\"closedhand.cur\"), move";
	document.body.style.cursor = "url(\"plugins/view/jbrowse/closedhand.cur\"), move";
	view.elem.style.cursor = "url(\"plugins/view/jbrowse/closedhand.cur\"), move";

LINE 500:

    //document.body.style.cursor = "url(\"closedhand.cur\")";
    document.body.style.cursor = "url(\"plugins/view/jbrowse/closedhand.cur\")";

    
</entry>
<entry [Sat 2011:12:03 03:40:12 EST] INSERTED urlTemplate KEYS INTO ALL FEATURES trackData.json FILES>


0. BACKUP ALL DATA

cd /data/jbrowse/species/human/hg19
sudo cp -r data data-safe


1. PRETTY ALL

sudo /agua/0.6/bin/jbrowse/trackData.pl \
--inputfile "/data/jbrowse/species/human/hg19/data/tracks/*/*/trackData.json" \
--mode pretty

OK

2. ADD KEY

# H-INV PSEUDO GENES
sudo /agua/0.6/bin/jbrowse/trackData.pl \
--inputfile "/data/jbrowse/species/human/hg19/data/tracks/*/hinv70PseudoGene/trackData.json" \
--mode insert \
--key "urlTemplate" \
--value "http://www.h-invitational.jp/hinv/spsoup/transcript_view?hit_id={name}" \
--index 0

sudo /agua/0.6/bin/jbrowse/trackData.pl \
--inputfile "/data/jbrowse/species/human/hg19/data/tracks/*/hinv70NonCoding/trackData.json" \
--mode insert \
--key "urlTemplate" \
--value "http://www.h-invitational.jp/hinv/spsoup/transcript_view?hit_id={name}" \
--index 0


# knownGene AND knownAlt UCSC GENES
#### NB: REMOVED knownAlt FROM GLOBAL trackInfo.js
<!--sudo /agua/0.6/bin/jbrowse/trackData.pl \
--inputfile "/data/jbrowse/species/human/hg19/data/tracks/*/knownAlt/trackData.json" \
--mode insert \
--key "urlTemplate" \
--value "http://genome.ucsc.edu/cgi-bin/hgGene?hgg_gene={ProteinID}" \
--index 0
-->
sudo /agua/0.6/bin/jbrowse/trackData.pl \
--inputfile "/data/jbrowse/species/human/hg19/data/tracks/*/knownGene/trackData.json" \
--mode insert \
--key "urlTemplate" \
--value "http://genome.ucsc.edu/cgi-bin/hgGene?hgg_gene={name}" \
--index 0


# CCDS
sudo /agua/0.6/bin/jbrowse/trackData.pl \
--inputfile "/data/jbrowse/species/human/hg19/data/tracks/*/ccdsGene/trackData.json" \
--mode insert \
--key "urlTemplate" \
--value "http://www.ncbi.nlm.nih.gov/CCDS/CcdsBrowse.cgi?REQUEST=CCDS&GO=MainBrowse&DATA={name}" \
--index 0

<!--# Gencode Auto, PSEUDO AND POLYA
sudo /agua/0.6/bin/jbrowse/trackData.pl \
--inputfile "/data/jbrowse/species/human/hg19/data/tracks/*/wgEncodeGencodePolyaV4/trackData.json
" \
--mode insert \
--key "urlTemplate" \
--value "http://www.ensembl.org/Homo_sapiens/Transcript/Summary?db=core;t={name}" \
--index 0
-->
# NB: REVERSED GENCODE POLYA

sudo /agua/0.6/bin/jbrowse/trackData.pl \
--inputfile "/data/jbrowse/species/human/hg19/data/tracks/*/wgEncodeGencodePolyaV4/trackData.json" \
--mode remove \
--key "urlTemplate"


sudo /agua/0.6/bin/jbrowse/trackData.pl \
--inputfile "/data/jbrowse/species/human/hg19/data/tracks/*/wgEncodeGencodeAutoV4/trackData.json" \
--mode insert \
--key "urlTemplate" \
--value "http://www.ensembl.org/Homo_sapiens/Transcript/Summary?db=core;t={name}" \
--index 0

<!--sudo /agua/0.6/bin/jbrowse/trackData.pl \
--inputfile "/data/jbrowse/species/human/hg19/data/tracks/*/wgEncodeGencode2wayConsPseudoV4/trackData.json
" \
--mode insert \
--key "urlTemplate" \
--value "http://www.ensembl.org/Homo_sapiens/Transcript/Summary?db=core;t={name}" \
--index 0
-->
# NB: REVERSED GENCODE PSEUDO
sudo /agua/0.6/bin/jbrowse/trackData.pl \
--inputfile "/data/jbrowse/species/human/hg19/data/tracks/*/wgEncodeGencode2wayConsPseudoV4/trackData.json" \
--mode remove \
--key "urlTemplate"

# REFSEQ
sudo /agua/0.6/bin/jbrowse/trackData.pl \
--inputfile "/data/jbrowse/species/human/hg19/data/tracks/*/refGene/trackData.json" \
--mode insert \
--key "urlTemplate" \
--value "http://www.ncbi.nlm.nih.gov/nuccore/{name}" \
--index 0

# N-SCAN
sudo /agua/0.6/bin/jbrowse/trackData.pl \
--inputfile "/data/jbrowse/species/human/hg19/data/tracks/*/nscanGene/trackData.json" \
--mode insert \
--key "urlTemplate" \
--value "http://genome.csdb.cn/cgi-bin/hgTrackUi?hgsid={name}&g=nscan" \
--index 0


# VEGA
sudo /agua/0.6/bin/jbrowse/trackData.pl \
--inputfile "/data/jbrowse/species/human/hg19/data/tracks/*/vegaPseudoGene/trackData.json" \
--mode insert \
--key "urlTemplate" \
--value "http://vega.sanger.ac.uk/Homo_sapiens/Transcript/Transcript?t={name}" \
--index 0

sudo /agua/0.6/bin/jbrowse/trackData.pl \
--inputfile "/data/jbrowse/species/human/hg19/data/tracks/*/vegaGene/trackData.json" \
--mode insert \
--key "urlTemplate" \
--value "http://vega.sanger.ac.uk/Homo_sapiens/Transcript/Transcript?t={name}" \
--index 0

# DGV (DATABASE OF GENOMIC VARIANTS)
sudo /agua/0.6/bin/jbrowse/trackData.pl \
--inputfile "/data/jbrowse/species/human/hg19/data/tracks/*/dgv/trackData.json" \
--mode insert \
--key "urlTemplate" \
--value "http://projects.tcag.ca/cgi-bin/variation/xview?source=hg18&view=variation&id=Variation_{name}" \
--index 0


# IKMC (INTERNATIONAL KNOCKOUT MICE COMMISSION)
##### DISABLE FOR NOW - LATER ADD urlRegex TO PARSE ID
<!--sudo /agua/0.6/bin/jbrowse/trackData.pl \
--inputfile "/data/jbrowse/species/human/hg19/data/tracks/*/hgIkmc/trackData.json" \
--mode insert \
--key "urlTemplate" \
--value "http://www.sanger.ac.uk/mouseportal/solr/select?q=}{name}" \
--index 0
-->
sudo /agua/0.6/bin/jbrowse/trackData.pl \
--inputfile "/data/jbrowse/species/human/hg19/data/tracks/*/hgIkmc/trackData.json" \
--mode remove \
--key "urlTemplate" 




3. UNPRETTY

sudo /agua/0.6/bin/jbrowse/trackData.pl \
--inputfile "/data/jbrowse/species/human/hg19/data/tracks/*/*/trackData.json" \
--mode unpretty





TEST chr3 UCSC FILES
====================

PRETTIFY OLD AND NEW FILES:

sudo /agua/0.6/bin/jbrowse/trackData.pl \
--inputfile "/data/jbrowse/species/human/hg19/data/tracks/chr3/knownGene/trackData.json" \
--mode pretty


sudo /agua/0.6/bin/jbrowse/trackData.pl \
--inputfile "/data/jbrowse/species/human/hg19/data-new/tracks/chr3/knownGene/trackData.json" \
--mode pretty


INSERT KEY:

sudo /agua/0.6/bin/jbrowse/trackData.pl \
--inputfile "/data/jbrowse/species/human/hg19/data/tracks/chr3/knownGene/trackData.json" \
--logfile /tmp/insert.log \
--mode insert \
--key "urlTemplate" \
--value "http://genome.ucsc.edu/cgi-bin/hgGene?hgg_gene={ProteinID}" \
--index 0




NOTES
=====

BAD FEATURES:

/data/jbrowse/species/human/hg19/data/tracks/chr3/tRNAs/trackData.json
/data/jbrowse/species/human/hg19/data/tracks/chr3/cpgIslandExt/trackData.json
/data/jbrowse/species/human/hg19/data/tracks/chr3/gap/trackData.json
/data/jbrowse/species/human/hg19/data/tracks/chr3/gwasCatalog/trackData.json
/data/jbrowse/species/human/hg19/data/tracks/chr3/genomicSuperDups/trackData.json
/data/jbrowse/species/human/hg19/data/tracks/chr3/gold/trackData.json
/data/jbrowse/species/human/hg19/data/tracks/chr3/geneid/trackData.json
/data/jbrowse/species/human/hg19/data/tracks/chr3/omimGene/trackData.json
/data/jbrowse/species/human/hg19/data/tracks/chr3/cytoBandIdeo/trackData.json
/data/jbrowse/species/human/hg19/data/tracks/chr3/cytoBand/trackData.json


GOOD FEATURES BUT NO URL:

/data/jbrowse/species/human/hg19/data/tracks/chr3/exoniphy/trackData.json
/data/jbrowse/species/human/hg19/data/tracks/chr3/sgpGene/trackData.json
/data/jbrowse/species/human/hg19/data/tracks/chr3/wgEncodeGencodePolyaV4/trackData.json
/data/jbrowse/species/human/hg19/data/tracks/chr3/wgEncodeGencode2wayConsPseudoV4/trackData.json


GOOD FEATURES AND HAVE URLS:

/data/jbrowse/species/human/hg19/data/tracks/chr3/hinv70NonCoding/trackData.json
/data/jbrowse/species/human/hg19/data/tracks/chr3/hinv70PseudoGene/trackData.json
/data/jbrowse/species/human/hg19/data/tracks/chr3/dgv/trackData.json
/data/jbrowse/species/human/hg19/data/tracks/chr3/knownAlt/trackData.json
/data/jbrowse/species/human/hg19/data/tracks/chr3/knownGene/trackData.json
/data/jbrowse/species/human/hg19/data/tracks/chr3/ccdsGene/trackData.json   
/data/jbrowse/species/human/hg19/data/tracks/chr3/refGene/trackData.json
/data/jbrowse/species/human/hg19/data/tracks/chr3/hgIkmc/trackData.json
/data/jbrowse/species/human/hg19/data/tracks/chr3/nscanGene/trackData.json
/data/jbrowse/species/human/hg19/data/tracks/chr3/wgEncodeGencodeAutoV4/trackData.json
/data/jbrowse/species/human/hg19/data/tracks/chr3/vegaPseudoGene/trackData.json
/data/jbrowse/species/human/hg19/data/tracks/chr3/vegaGene/trackData.json


    
</entry>
<entry [Fri 2011:12:02 14:34:52 EST] CREATED Conf::Json TO EDIT trackData.json FILES>

1. CREATED TEST INPUTS


mkdir -p /agua/0.6/t/bin/jbrowse/inputs
cd /agua/0.6/t/bin/jbrowse/inputs
cp -r /data/jbrowse/species/human/hg19/data .
rm -fr chr*/c* chr*/d* chr*/e* chr*/g* chr*/k* chr*/n* chr*/o* chr*/r* chr*/s* chr*/t* chr*/w* chr*/v* chr*/hgI* chr*/hinv70Non*


cd /agua/0.6/t/bin/jbrowse/inputs/data
du -hs tracks
    940K	tracks

cd /agua/0.6/t/bin/jbrowse
cp -r inputs outputs


2. RAN trackData.pl ON TEST DATA USING t/bin/jbrowse/editTrackData.t

cd /agua/0.6/t/bin/jbrowse/
./editTrackData.t


WHICH RAN TESTS ON pretty, unpretty, insertKey AND MULTIPLE insertKey:

1. PRETTY ALL

/agua/0.6/bin/jbrowse/trackData.pl \
--inputfile /agua/0.6/t/bin/jbrowse/outputs/data/tracks/chr1/hinv70PseudoGene/trackData.json \
--mode pretty

2. ADD KEY

/agua/0.6/bin/jbrowse/trackData.pl \
--inputfile /agua/0.6/t/bin/jbrowse/outputs/data/tracks/chr1/hinv70PseudoGene/trackData.json \
--mode insert \
--key "urlTemplate" \
--value "http://www.h-invitational.jp/evola_main/locus_maps.cgi?hit={}" \
--index 0


3. UNPRETTY
/agua/0.6/bin/jbrowse/trackData.pl \
--inputfile /agua/0.6/t/bin/jbrowse/outputs/data/tracks/chr1/hinv70PseudoGene/trackData.json \
--mode unpretty


</entry>
<entry [Thu 2011:12:01 16:02:46 EST] ADDED EXTERNAL LINKS FOR TRACK LABELS>


1. EDITED trackInfo.js TO ADD INFO POPUP TO TRACK LABELS


ADDED urlInfo TO trackInfo.js:

em /agua/0.6/html/plugins/view/jbrowse//users/admin/Project1/View1/data/trackInfo.js

  {
      "urlInfo": "http://genomewiki.ucsc.edu/index.php/Known_genes_III",
       "url" : "data/tracks/{refseq}/knownGene/trackData.json",
      "label" : "knownGene",
      "type" : "FeatureTrack",
      "key" : "UCSC Genes"
   },


2. DID THE SAME FOR THE ORIGINAL data/trackInfo.js (FROM WHICH THE FEATURE TRACK trackInfo.js IS COPIED):

em /data/jbrowse/species/human/hg19/data/trackInfo.js

trackInfo = [
    {
        "urlInfo": "http://genomewiki.ucsc.edu/index.php/Known_genes_III",
        "url" : "data/tracks/{refseq}/knownGene/trackData.json",
        "label" : "knownGene",
        "type" : "FeatureTrack",
        "key" : "UCSC Genes"
    },


3. ADDED LINKS ALL FEATURES IN:

em /agua/0.6/html/plugins/view/jbrowse//users/admin/Project1/View1/data/trackInfo.js
em /data/jbrowse/species/human/hg19/data/trackInfo.js


4. ADDED ondblclick EVENT TO Browser.createTrackList AT LINE 410:

			if ( params.trackData[i].urlInfo ) {
				node.ondblclick = function(event) {
					window.open(params.trackData[i].urlInfo, "_blank");
					event.stopPropagation();
				};
			}


    
</entry>
<entry [Thu 2011:12:01 03:31:49 EST] ADDED EXTERNAL LINKS FOR FEATURES>


1. EDITED tracks/chrXXX/featureXXX/trackData.json TO ADD FEATURE ONCLICK TO EXTERNAL LINK

ADD 'urlTemplate' TO TRACK INFO IN FEATURE CHROMOSOME trackData.json FILE:

em /agua/0.6/html/plugins/view/jbrowse/users/admin/Project1/View1/data/tracks/chr22/knownGene/trackData.json

{
    "urlTemplate": "http://genome.ucsc.edu/cgi-bin/hgGene?hgg_gene={proteinID}",

   "headers" : [
      "start",
      "end",
      "strand",
      "name",
      "alignID",


2. IF GENERATING FROM SCRATCH, MUST USE urlTemplate ARGUMENT WHEN GENERATING FEATURES TO ADD IT TO trackInfo.js

http://jbrowse.org/code/jbrowse-master/docs/config-desc.html
http://gmod.org/wiki/JBrowseDev/The_UrlTemplate_Option

bin/flatfile-to-json.pl \
--urlTemplate http://www.google.com/search?q={name} \
--getLabels \
--type remark \
--gff docs/tutorial/data_files/volvox.gff3 \
--tracklabel unique_URLs



NB: NEW FEATURE TRACK IS CREATED BY BROWSER HERE:

Browser.createTrackList ON LINE 451 INSIDE trackCreate() :

			var newTrack = new klass(track, url, brwsr.refSeq,
			{
				changeCallback: changeCallback,


3. ADDED LINKS FOR ALL FEATURES IN:

/data/jbrowse/species/human/hg19/data/chr*/feature*/trackData.json



</entry>
<entry [Thu 2011:12:01 16:03:14 EST] LIST OF EXTERNAL LINKS>

H-INV PSEUDO GENES
/data/jbrowse/species/human/hg19/data/tracks/chr3/hinv70NonCoding/trackData.json
/data/jbrowse/species/human/hg19/data/tracks/chr3/hinv70PseudoGene/trackData.json
info
http://www.h-invitational.jp/
link
http://www.h-invitational.jp/hinv/spsoup/transcript_view?hit_id={name}

UCSC knownGene AND knownAlt
/data/jbrowse/species/human/hg19/data/tracks/chr3/knownAlt/trackData.json
/data/jbrowse/species/human/hg19/data/tracks/chr3/knownGene/trackData.json
info
http://genomewiki.ucsc.edu/index.php/Known_genes_III
link
http://genome.ucsc.edu/cgi-bin/hgGene?hgg_gene={name}

NB: Paper 2006 - OUTDATED SO USE Wikipedia)
http://bioinformatics.oxfordjournals.org/content/22/9/1036.full
    
CCDS
/data/jbrowse/species/human/hg19/data/tracks/chr3/ccdsGene/trackData.json   
info
http://www.ncbi.nlm.nih.gov/CCDS/CcdsBrowse.cgi
link
####http://www.ncbi.nlm.nih.gov/sites/varvu?gene=7249&rs={name}
http://www.ncbi.nlm.nih.gov/CCDS/CcdsBrowse.cgi?REQUEST=CCDS&GO=MainBrowse&DATA={name}

also for CCDS - VARVIEW, THE LSDB/CLINICAL SNP DISPLAY RESOURCE
see an example of VarView at:
http://www.ncbi.nlm.nih.gov/sites/varvu?gene=7249&rs=1748
NB: Get less information using dbSNP
http://www.ncbi.nlm.nih.gov/projects/SNP/snp_ref.cgi?searchType=adhoc_search&type=rs&rs=rs2186531


Gencode Auto, PSEUDO AND POLYA
/data/jbrowse/species/human/hg19/data/tracks/chr3/wgEncodeGencodePolyaV4/trackData.json
/data/jbrowse/species/human/hg19/data/tracks/chr3/wgEncodeGencodeAutoV4/trackData.json
/data/jbrowse/species/human/hg19/data/tracks/chr3/wgEncodeGencode2wayConsPseudoV4/trackData.json
info
http://www.gencodegenes.org/
####http://genome.crg.es/gencode/
link
http://www.ensembl.org/Homo_sapiens/Transcript/Summary?db=core;t={name}


EXONIPHY
info
http://compgen.bscb.cornell.edu/phast/help-pages/exoniphy.txt
link


GENEID
info:
http://genome.crg.es/software/geneid/
link (by chromosome ONLY, E.G., chr22_244.1)
http://genome.crg.es/genepredictions/P.troglodytes/golden_path_200311/geneid_v1.1/chr22.geneid


SGP GENES
info
http://genome.crg.es/software/sgp2/index.html


REFSEQ
/data/jbrowse/species/human/hg19/data/tracks/chr3/refGene/trackData.json
info
http://www.ncbi.nlm.nih.gov/RefSeq/
link
http://srs.ebi.ac.uk/srs7bin/cgi-bin/wgetz?-newId+-e+%5Brefseq-id:{name}


N-SCAN
/data/jbrowse/species/human/hg19/data/tracks/chr3/nscanGene/trackData.json
info
http://genome.csdb.cn/cgi-bin/hgTrackUi?hgsid={name}&c=chrX&g=nscan
???
http://genome.csdb.cn/cgi-bin/hgTrackUi?hgsid={name}&g=nscan

paper
http://www.ncbi.nlm.nih.gov/pubmed/18428682


VEGA
/data/jbrowse/species/human/hg19/data/tracks/chr3/vegaPseudoGene/trackData.json
/data/jbrowse/species/human/hg19/data/tracks/chr3/vegaGene/trackData.json
info
http://vega.sanger.ac.uk/index.html
link
http://vega.sanger.ac.uk/Homo_sapiens/Transcript/Transcript?t={name}


DGV (DATABASE OF GENOMIC VARIANTS)
/data/jbrowse/species/human/hg19/data/tracks/chr3/dgv/trackData.json
info
http://projects.tcag.ca/variation/
link
http://projects.tcag.ca/cgi-bin/variation/xview?source=hg18&view=variation&id=Variation_{name}


IKMC (INTERNATIONAL KNOCKOUT MICE COMMISSION)
/data/jbrowse/species/human/hg19/data/tracks/chr3/hgIkmc/trackData.json
info
http://www.sanger.ac.uk/mouseportal/
https://github.com/i-dcc/martsearch/wiki/using-the-ikmc-search-engine-in-your-application

link (XML: GO INFO ETC., MUST USE LAST PORTION OF ID)
2900026A02Rik_VG18308 
http://www.sanger.ac.uk/mouseportal/solr/select?q=}{name}
Tmem211_79758
http://www.sanger.ac.uk/mouseportal/solr/select?q=79758



    
</entry>
<entry [Thu 2011:12:01 03:24:13 EST] FIXED TRACKS NOT ADDING/REMOVING CORRECTLY>

IN Browser.createTrackList, INSTEAD OF track.key USED:

track.label FOR ADD

track.name FOR REMOVE 

    
</entry>
<entry [Thu 2011:12:01 02:07:49 EST] FIXED TRACKLIST NOT LOADING PROBLEM>


CHANGED LINE 658 IN View.uploadBrowser:

		trackList : trackList,
		tracks : trackList,


... AND this.tracks IS PREFERENTIALLY USED BY Browser.createTracklist TO SET THE TRACKSLIST AT LINE 495:

	if (params.tracks) {
		this.showTracks(params.tracks);
	} else if (oldTrackList) {
		this.showTracks(oldTrackList);
	} else if (params.defaultTracks) {
		this.showTracks(params.defaultTracks);
	}


    
</entry>
<entry [Thu 2011:12:01 00:07:07 EST] FIXED PREMATURE updateViewLocation AND updateViewTracklist FIRING BY Browser.js>
    
IMPLEMENTED this.loading FLAG, RESET TO FALSE AT END OF View.loadBrowser

    
</entry>
<entry [Wed 2011:11:30 23:39:15 EST] FIXED ERROR LOADING control1 CHR1 INSTEAD OF CHR22>

trackData.json HAD INCORRECT CHROMOSOME - CHR1 INSTEAD OF CHR22

em /agua/0.6/html/plugins/view/jbrowse//users/admin/Project1/View1/data/tracks/chr22/control1/trackData.json


{"headers":["start","end","strand"],"histogramMeta":[{"basesPerBin":"100","ar\
rayParams":{"length":2492404,"chunkSize":10000,"urlTemplate":"data/tracks/chr\
1/control1//hist-100-{chunk}.json"}},{"basesPerBin":"10000","arrayParams":{"l\
ength":24925,"chunkSize":10000,"urlTemplate":"data/tracks/chr1/control1//hist\
-10000-{chunk}.json"}},{"basesPerBin":"1000000","arrayParams":{"length":250,"\
chunkSize":10000,"urlTemplate":"data/tracks/chr1/control1//hist-1000000-{chun\



    
</entry>
<entry [Wed 2011:11:30 22:14:37 EST] FIXED MISSING lazy-c.json FILE IN Browser.js>

LINE 174:
    
	this.names = new LazyTrie(dataRoot + "/data/names/lazy-",
//	this.names = new LazyTrie(dataRoot + "/names/lazy-",
				  dataRoot + "data/names/root.json");

    
</entry>
<entry [Wed 2011:11:30 22:11:16 EST] FIXED MISSING ExpandoPane.css IN Browser.js>

CHANGED TO CURRENT VERSION OF DOJO ON LINE 44:

/* CHANGED */
	cssFiles : [ "dojo-1.6.1rc2/dojox/layout/resources/ExpandoPane.css" ],
	//cssFiles : [ "dojo-1.5.0/dojox/layout/resources/ExpandoPane.css" ],

    
</entry>
<entry [Mon 2011:06:27 03:11:27 EST] VERIFIED jbrowseFeatures.pl OUTPUT FILE AND trackData.json FOR EACH CHROMOSOME>

/agua/bin/jbrowse/jbrowseFeatures.pl --build hg19 --filename out.bam --filetype bam --inputdir /home/admin/agua/Project1/Workflow1 --key tophat-1 --label tophat-1 --project Project1 --species human --username syoung --workflow Workflow1

    
</entry>
<entry [Sat 2011:06:04 03:10:56 EST] FIXED addViewFeature>

echo '{"sourceproject":"Project1","sourceworkflow":"Workflow1","species":"human","build":"hg19","feature":"ntHumChimp","project":"Project1","view":"View1","username":"syoung","sessionId":"9999999999.9999.999","mode":"addViewFeature"}' | ./view.cgi


NB: FIX THIS BY ADDING "data/" TO url IN jbrowseFeatures.pl

cat /nethome/syoung/agua/Project1/Workflow1/jbrowse/ntHumChimp/data/trackInfo.js
trackInfo = 
[
   {
      "url" : "tracks/{refseq}/ntHumChimp/trackData.json",
      "type" : "FeatureTrack",
      "label" : "ntHumChimp",
      "key" : "ntHumChimp"
   }
]


</entry>
<entry [Thu 2011:05:26 12:35:52 EST] GENERATE TOPHAT-1 JBROWSE FEATURES USING jbrowseFeatures.pl>

submit2

WHICH RUNS:
export SGE_QMASTER_PORT=6444; export SGE_EXECD_PORT=6445; export SGE_ROOT=/var/lib/gridengine; export SGE_CELL=syoung-smallcluster; export USERNAME=syoung; export QUEUE=; /usr/bin/perl /agua/0.6/bin/apps/jbrowse/jbrowseFeatures.pl --build hg19 --filename out.bam --filetype bam --inputdir /nethome/syoung/agua/Project1/Workflow1 --key tophat-1 --label tophat-1 --project Project1 --species human --username syoung --workflow Workflow1 

CHECK OUTPUT:
cd  /nethome/syoung/agua/Project1/Workflow1/jbrowse
ll tophat-1/data/tracks/chr22/tophat-1/
    
</entry>
<entry [Thu 2011:05:26 02:39:08 EST] JBROWSE SEQUENCE DATA LOCATIONS>

ON TOSHIBA

1. ALL CHROMOSOME FEATURES MOVED  TO /data/jbrowse

cp -r /home/syoung/0.6-ok/html/plugins/view/jbrowse/species \
/data/jbrowse


2. USER ntHumChimp FOR ALL CHROMOSOMES MOVED TO syoung NETHOME

mkdir -p /nethome/syoung/agua/Project1/Workflow1/jbrowse/ntHumChimp
cp -r /home/syoung/nethome/Project1/Workflow1/jbrowse/ntHumChimp/data \
/nethome/syoung/agua/Project1/Workflow1/jbrowse/ntHumChimp/data


NB: SAVED COPIES ARE HERE:

/agua/0.6-82-6511e0f/html/plugins/view/jbrowse/species.tar.gz
/agua/0.6-82-6511e0f/html/plugins/view/jbrowse/users.tar.gz


UNZIP users COPY:

cp /agua/0.6-82-6511e0f/html/plugins/view/jbrowse/users.tar.gz \
/nethome/syoung/agua/Project1/Workflow9/jbrowse
cd /nethome/syoung/agua/Project1/Workflow9/jbrowse
    

ON HP

cd /agua/0.6-ok/html/plugins/view/jbrowse-old/species/human/hg19/data/tracks/chr1


cd /agua/0.6/html/plugins/view/jbrowse-old/species/human/hg19/data/tracks/chr1

    -rw-rw-r--  1 syoung syoung 9817670 2010-10-09 00:32 control1.tar.gz
    -rw-rw-r--  1 syoung syoung 8371863 2010-10-09 00:41 control2.tar.gz
    -rw-rw-r--  1 syoung syoung  244862 2010-10-08 23:03 test1.tar.gz
    -rw-rw-r--  1 syoung syoung  213714 2010-10-09 00:30 test2.tar.gz


COPIED TO CORRECT (Project1, Workflow9) DIRECTORY:

mkdir -p /nethome/syoung/agua/Project1/Workflow9/jbrowse

cp /agua/0.6/html/plugins/view/jbrowse-old/species/human/hg19/data/tracks/chr1/*gz \
/nethome/syoung/agua/Project1/Workflow9/jbrowse

cp 


ON 8e

/nethome/syoung/agua/snp454/Workflow1/jbrowse-old2/ntHumChimp/data/tracks/chr8/ntHumChimp/trackData.json


</entry>
<entry [Wed 2011:05:25 16:44:50 EST] FIXED PATHS FOR JBROWSE BY EDITING trackData.json>

/nethome/syoung/agua/Project1/Workflow1/jbrowse/ntHumChimp/data/tracks/chr1/ntHumChimp/trackData.json
ch
/agua/0.6/plugins/view/jbrowse/users/syoung/Project1/View1/data/tracks/chr1/ntHumChimp/trackData.json

CHANGED HISTOGRAM FILE PATH FROM THIS:	

hist-200000-{chunk}.json

TO THIS:

data/tracks/chr1/ntHumChimp/hist-200000-{chunk}.json


WHERE THIS IS WHAT IT LOOKED LIKE BEFORE:

{"histogramMeta":[{"basesPerBin":"200000","arrayParams":{"length":1272,"chunkSize":10000,"urlTemplate":"hist-200000-{chunk}.json"}}],"subfeatureClasses":null,"headers":["start","end","strand","id","name","type"],"lazyIndex":2,"featureCount":1293,"histStats":[{"bases":200000,"max":36,"mean":2.01572327044025},{"bases":500000,"max":49,"mean":3.53831041257367},{"bases":1000000,"max":61,"mean":6.06666666666667},{"bases":2000000,"max":78,"mean":11.09375},{"bases":5000000,"max":130,"mean":26.3333333333333},{"bases":10000000,"max":187,"mean":50.6923076923077}],"featureNCList":[[-1,254235635,{"chunk":0}]],"key":"ntHumChimp","className":"feature5","clientConfig":null,"arrowheadClass":null,"subfeatureHeaders":["start","end","strand","type"],"label":"ntHumChimp","type":"FeatureTrack","sublistIndex":6,"lazyfeatureUrlTemplate":"data/tracks/chr1/ntHumChimp/lazyfeatures-{chunk}.json"}
    
AND THIS IS IT AFTERWARDS:

{"histogramMeta":[{"basesPerBin":"200000","arrayParams":{"length":1272,"chunkSize":10000,"urlTemplate":"data/tracks/chr1/ntHumChimp/hist-200000-{chunk}.json"}}],"subfeatureClasses":null,"headers":["start","end","strand","id","name","type"],"lazyIndex":2,"featureCount":1293,"histStats":[{"bases":200000,"max":36,"mean":2.01572327044025},{"bases":500000,"max":49,"mean":3.53831041257367},{"bases":1000000,"max":61,"mean":6.06666666666667},{"bases":2000000,"max":78,"mean":11.09375},{"bases":5000000,"max":130,"mean":26.3333333333333},{"bases":10000000,"max":187,"mean":50.6923076923077}],"featureNCList":[[-1,254235635,{"chunk":0}]],"key":"ntHumChimp","className":"feature5","clientConfig":null,"arrowheadClass":null,"subfeatureHeaders":["start","end","strand","type"],"label":"ntHumChimp","type":"FeatureTrack","sublistIndex":6,"lazyfeatureUrlTemplate":"data/tracks/chr1/ntHumChimp/lazyfeatures-{chunk}.json"}

</entry>
<entry [Tue 2011:05:24 12:52:20 EST] USING jbrowseFeatures.pl>

CHANGED jbrowseFeatures.pl SO THAT IT USES bam-to-json.pl IF BAM FILE FORMAT

CHANGED THIS:

cd /nethome/syoung/agua/Project1/Workflow1/jbrowse/out;
/data/apps/jbrowse/1.2.6/bin/flatfile-to-json.pl  \
--bam /nethome/syoung/agua/Project1/Workflow1/chr22/out.bam  \
--tracklabel out  \
--key out  \
--autocomplete all  \
--getType 


TO THIS:

cd /nethome/syoung/agua/Project1/Workflow1/jbrowse/out;
/data/apps/jbrowse/1.2.6/bin/bam-to-json.pl  \
--bam /nethome/syoung/agua/Project1/Workflow1/chr22/out.bam  \
--tracklabel tophat-1 \
--key tophat-1


BUT GOT THIS ERROR:

Use of uninitialized value in subroutine entry at /data/apps/jbrowse/1.2.6/bin/../lib/JsonGenerator.pm line 377.
Use of uninitialized value in subroutine entry at /data/apps/jbrowse/1.2.6/bin/../lib/JsonGenerator.pm line 378.

THE OFFENDING LINES:

    my $max = max(@$arr);
    my $sum = sum(@$arr);


BUT IGNORED IT BECAUSE IT SEEMS TO HAVE GENERATED FILES OKAY:

cd /nethome/syoung/agua/Project1/Workflow1/jbrowse/out/data/tracks/chr22/tophat-1
    
    ...
    -rw-r--r-- 1 root root  49K 2011-05-24 12:55 lazyfeatures-98.json
    -rw-r--r-- 1 root root  49K 2011-05-24 12:55 lazyfeatures-99.json
    -rw-r--r-- 1 root root   46 2011-05-24 12:55 lazyfeatures-9.json
    -rw-r--r-- 1 root root 4.8K 2011-05-24 12:55 trackData.json


<!--
    
USAGE: /data/apps/jbrowse/1.2.6/bin/bam-to-json.pl --bam <bam file> 
		[--out <output directory] 
		[--tracklabel <track identifier>] 
		[--key <human-readable track name>] 
		[--cssClass <class>] 
		[--clientConfig <JSON client config>] 
		[--nclChunk <NCL chunk size in bytes>] 
		[--compress]

    --bam: bam file name
    --out: defaults to "data"
    --cssclass: defaults to "basic"
    --clientConfig: extra configuration for the client, in JSON syntax
        e.g. '{"featureCss": "background-color: #668; height: 8px;", "histScale": 5}'
    --nclChunk: size of the individual NCL chunks
    --compress: compress the output (requires some web server configuration)

-->

    
</entry>
<entry [Wed 2011:03:09 05:01:54 EST] EXTERNAL DATABASE LINKS>


CCDS
GOOD - 
VARVIEW: THE LSDB/CLINICAL SNP DISPLAY RESOURCE
see an example of VarView at: http://www.ncbi.nlm.nih.gov/sites/varvu?gene=7249&rs=1748


http://www.ncbi.nlm.nih.gov/sites/varvu?gene=7249&rs=rs8190206


less information here:
dbSNP
http://www.ncbi.nlm.nih.gov/projects/SNP/snp_ref.cgi?searchType=adhoc_search&type=rs&rs=rs2186531




NOTES
-----

dbSNP FTP SITE
http://www.ncbi.nlm.nih.gov/books/NBK3857/
ftp://ftp.ncbi.nih.gov/snp/

dbSNP-Q
https://cgsmd.isi.edu/dbsnpq/doc.php

SNAP
http://www.broadinstitute.org/mpg/snap/


dbSNP 132 RELEASE NOTES

http://www.ncbi.nlm.nih.gov/mailman/pipermail/dbsnp-announce/2010q4/000097.html

    ===============================================
    NOTES FOR HUMAN SNP IN BUILD 132
    ===============================================
    
    1) Build 132:Human include data from 1000 Genomes project pilot 1, 2, and 3 studies.
    
    All 1000 genomes submissions to dbSNP can be searched by batch or using Entrez search filters.
    
    Batch search:
    http://www.ncbi.nlm.nih.gov/SNP/snp_batchSearch.cgi?org=9606&type=SNP&condh=starts+with&handle=1000&lbid=&Search+Batch=Search+Batch
    
    Entrez Search:
    
                    http://www.ncbi.nlm.nih.gov/sites/entrez?Db=snp&Cmd=DetailsSearch&Term=%221000genomes%22[Filter]
    
                    Supported search filter terms:
                    "1000genomes"[Filter]
                    "1000genomes pilot1 snp"[Filter]
                    "1000genomes pilot2 snp"[Filter]
                    "1000genomes pilot3 snp"[Filter]
                    "1000genomes has frequency"[Filter]
    
                    Terms can be combined using boolean operators (AND, OR, and NOT) for searching.
    
                    "1000genomes pilot1 snp"[Filter] AND "1000genomes has frequency"[Filter]
    
    
    2) Build 132 HUMAN DATA CORRECTION:
    
    A clustering error was identified before the release where two identical SNPs at the same position was assigned two different rs numbers.
    The list of affected SNPs and the currently assigned rs numbers are here.
    ftp://ftp.ncbi.nih.gov/snp/release-notes/Build132/rs_mergedFromTo_inRefSeq44.list
    
    The data has been corrected for web search and for the database (bcp) files on the FTP site
    (ftp://ftp.ncbi.nih.gov/snp/organisms/human_9606/database/organism_data/) all other fTP file formats will be update within the next few days and a
    announcement will be sent when the update is complete.
    
    
    ============================================
    NEW FEATURES:
    ============================================
    1) Full Build 132 in vcf format are available on the ftp site (ftp://ftp.ncbi.nih.gov/snp/organisms/human_9606/VCF).
    Please see README file (ftp://ftp.ncbi.nih.gov/snp/organisms/human_9606/VCF/v4.0/README.txt) for details.
    
    
    2) Entrez Search Limits:
    
                    A) MAF filter by HapMap populations on limits page (http://www.ncbi.nlm.nih.gov/snp/limits
    
                    B) Validation by 1000 Genomes (http://www.ncbi.nlm.nih.gov/snp?Db=snp&Cmd=DetailsSearch&Term=%22by+1000g%22[Validation+Status]%20NOT%
    20mergedrs)
    
    3) Gene Report are available on the ftp site for genes with "LSDB/clinical significant" SNPs.
    ftp://ftp.ncbi.nih.gov/snp/organisms/human_9606/gene_report/
    
    The report can also be retrieve by clicking on the link at the top of the the Variation Viewer (http://www.ncbi.nlm.nih.gov/sites/varvu?
    gene=29071&rs=17261572).




============================================
LOCUS SPECIFIC DATABASE(LSDB)RESOURCES:
============================================


THE HUMAN VARIATION: SEARCH,ANNOTATE,SUBMIT SITE
(http://www.ncbi.nlm.nih.gov/SNP/tranSNP/tranSNP.cgi)
allows users to:
*Enter the HGVS description of a single variant and ascertain if the variant is already in  the database by determining if the entry matches an
existing rs number
*Contribute novel information, MIM numbers, PubMed uids, and free text to new and existing  variants
*Review their submission before making it available to users


THE HUMAN VARIATION: ANNOTATION AND SUBMIT BATCH DATA SITE
(http://www.ncbi.nlm.nih.gov/SNP/tranSNP/SNP/tranSNP/VarBatchSub.cgi)
allows users to: provide all the information that they can in the single submission form (see above), except they can do so for a large number (Batch)
of records.  In addition, this resource allows the user to provide identifiers for each variant;  URLs back to the originating LSDB database,both
globally and for each variant ID; and also allows the user to enter the number of independent observations of each variant.


VARVIEW: THE LSDB/CLINICAL SNP DISPLAY RESOURCE
see an example of VarView at: http://www.ncbi.nlm.nih.gov/sites/varvu?gene=7249&rs=1748

The Variation Viewer, or VarView, facilitates a user's access to detailed information about variants of possible clinical significance. A link to the
Variation Viewer is provided whenever the existence of a variant of clinical significance is detected for a gene during a dbSNP search.

VarView allows the user to navigate to:
*Information about all data submitters for a variant (submission details tab)
*Links to one or more LSDB as appropriate (submission details tab)
*Links to PubMed, OMIM, Gene
*Displays of the variant on the genome

The VarView display is filtered by default to limit the display of variants for a gene to those that were submitted from an LSDB, from OMIM, or
associated with a citation.  All variants can, however, be displayed by altering the filter choice.

Please contact snp-admin at ncbi.nlm.nih.gov if you have any question or to report a problem.

dbSNP Development Team
October 9, 2010
National Center for Biotechnology Information (NCBI),
National Library of Medicine, National Institutes of Health, Bethesda, MD, USA.


</entry>
<entry [Wed 2011:03:09 04:51:54 EST] GENERATE JBROWSE FEATURES ON PEGASUS>
    
cd /nethome/syoung/base/pipeline/jbrowse/ucsc/human/hg19

    ...
    19/gtf/chr20/wgRna.gtf
    Util::FileTools::columnSplit    outfile: /nethome/syoung/base/pipeline/jbrowse/ucsc/human/hg19/gtf/chr21/wgRna.gtf
    Util::FileTools::columnSplit    outfile: /nethome/syoung/base/pipeline/jbrowse/ucsc/human/hg19/gtf/chr22/wgRna.gtf
    
    Run time: 00:20:27
    Completed /nethome/syoung/0.5/bin/apps/utils/columnSplit.pl
    6:13PM, 1 March 2011
    ****************************************
    
</entry>
<entry [Sun 2011:03:06 04:20:41 EST] GENERATED CHIMP JBROWSE FEATURES TO TEST Agua::View::addViewFeature AND Agua::View::removeViewFeature>

INPUT DIR:
/nethome/syoung/agua/Project1/Workflow1
    
1. UNZIP AND SPLIT GTF FILES BY CHROMOSOME COLUMN INTO PER-CHROMOSOME FILES

/home/syoung/0.6/bin/apps/utils/columnSplit.pl \
--inputdir /nethome/syoung/agua/Project1/Workflow1/gtf \
--column 1 

2. CONVERT GTF TO GFF FILES

/home/syoung/0.6/bin/apps/jbrowse/gtfToGff.pl \
--refseqfile /data/jbrowse/ucsc/human/hg19/refSeqs.js \
--inputdir /nethome/syoung/agua/Project1/Workflow1/gtf/chr1 \
--outputdir /nethome/syoung/agua/Project1/Workflow1/gff/chr1

USE LOOP

/home/syoung/0.6/bin/apps/logic/loop.pl \
--replicates 1-22,X,Y \
--loop serial \
--executable /home/syoung/0.6/bin/apps/jbrowse/gtfToGff.pl \
--refseqfile /data/jbrowse/ucsc/human/hg19/refSeqs.js \
--inputdir /nethome/syoung/agua/Project1/Workflow1/gtf/chr%REPLICATE% \
--outputdir /nethome/syoung/agua/Project1/Workflow1/gff/chr%REPLICATE% \
&> /nethome/syoung/agua/Project1/Workflow1/loop-gtftogff.out


3. GENERATE JBROWSE FEATURES

/home/syoung/0.6/bin/apps/jbrowse/generateFeatures.pl \
--refseqfile /data/jbrowse/ucsc/human/hg19/refSeqs.js \
--inputdir /nethome/syoung/agua/Project1/Workflow1/gff \
--filetype gff \
--species human \
--build hg19 \
--configfile /data/jbrowse/ucsc/human/hg19/jbrowse.json \
--username syoung \
--project Project1 \
--workflow Workflow1

generateFeatures.pl    Run time: 00:05:01
generateFeatures.pl    Completed /home/syoung/0.6/bin/apps/jbrowse/generateFeatures.pl
generateFeatures.pl    11-03-06 21:25:28
generateFeatures.pl    ****************************************


CREATED JBROWSE FILES DIR:

/nethome/syoung/agua/Project1/Workflow1/jbrowse/ntHumChimp



4. GENERATE names/root.json FILE IN VIEW DIR

/data/apps/jbrowse/1.2.6/bin/generate-names.pl -v --dir /var/www/html/agua/0.6/plugins/view/jbrowse/users/syoung/Project1/View1/data
    
    OK


</entry>

