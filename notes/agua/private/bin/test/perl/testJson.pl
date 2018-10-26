#!/usr/bin/perl -w

use strict;

use JSON;

my $file = "/var/www/html/agua/plugins/view/jbrowse/users/testuser/Project1/View1/data/tracks/../trackInfo.js";
my $assignation = "trackInfo = ";
my $toWrite = 
[
    {
      'sourceType' => 'dynamic',
      'url' => 'data/tracks/{refseq}/control1/trackData.json',
      'type' => 'FeatureTrack',
      'label' => 'control1',
      'key' => 'control1'
    },
    {
      'urlInfo' => 'http://genomewiki.ucsc.edu/index.php/Known_genes_III',
      'url' => 'data/tracks/{refseq}/knownGene/trackData.json',
      'label' => 'knownGene',
      'type' => 'FeatureTrack',
      'key' => 'UCSC Genes'
    },
    {
      'urlInfo' => 'http://www.h-invitational.jp/',
      'url' => 'data/tracks/{refseq}/hinv70NonCoding/trackData.json',
      'type' => 'FeatureTrack',
      'label' => 'hinv70NonCoding',
      'key' => 'H-Inv non-coding'
    },
    {
      'urlInfo' => 'http://www.h-invitational.jp/',
      'url' => 'data/tracks/{refseq}/hinv70PseudoGene/trackData.json',
      'type' => 'FeatureTrack',
      'label' => 'hinv70PseudoGene',
      'key' => 'H-Inv pseudo-genes'
    },
    {
      'urlInfo' => 'http://www.sanger.ac.uk/mouseportal/',
      'url' => 'data/tracks/{refseq}/hgIkmc/trackData.json',
      'label' => 'hgIkmc',
      'type' => 'FeatureTrack',
      'key' => 'IKMC Genes Mapped'
    },
    {
      'urlInfo' => 'http://projects.tcag.ca/variation/',
      'url' => 'data/tracks/{refseq}/dgv/trackData.json',
      'type' => 'FeatureTrack',
      'label' => 'dgv',
      'key' => 'DGV Struct Var'
    },
    {
      'urlInfo' => 'http://vega.sanger.ac.uk/index.html',
      'url' => 'data/tracks/{refseq}/vegaGene/trackData.json',
      'type' => 'FeatureTrack',
      'label' => 'vegaGene',
      'key' => 'Vega Protein Genes'
    },
    {
      'urlInfo' => 'http://genome.crg.es/gencode/',
      'url' => 'data/tracks/{refseq}/wgEncodeGencodeAutoV4/trackData.json',
      'label' => 'wgEncodeGencodeAutoV4',
      'type' => 'FeatureTrack',
      'key' => 'Gencode Auto'
    },
    {
      'urlInfo' => 'http://vega.sanger.ac.uk/index.html',
      'url' => 'data/tracks/{refseq}/vegaPseudoGene/trackData.json',
      'type' => 'FeatureTrack',
      'label' => 'vegaPseudoGene',
      'key' => 'Vega Pseudogenes'
    },
    {
      'urlInfo' => 'http://genome.crg.es/gencode/',
      'url' => 'data/tracks/{refseq}/wgEncodeGencodePolyaV4/trackData.json',
      'label' => 'wgEncodeGencodePolyaV4',
      'type' => 'FeatureTrack',
      'key' => 'Gencode PolyA'
    },
    {
      'urlInfo' => 'http://genome.crg.es/gencode/',
      'url' => 'data/tracks/{refseq}/wgEncodeGencode2wayConsPseudoV4/trackData.json',
      'type' => 'FeatureTrack',
      'label' => 'wgEncodeGencode2wayConsPseudoV4',
      'key' => 'Gencode Pseudo'
    },
    {
      'urlInfo' => 'http://www.ncbi.nlm.nih.gov/CCDS/CcdsBrowse.cgi',
      'url' => 'data/tracks/{refseq}/ccdsGene/trackData.json',
      'type' => 'FeatureTrack',
      'label' => 'ccdsGene',
      'key' => 'CCDS'
    },
    {
      'urlInfo' => 'http://www.ncbi.nlm.nih.gov/RefSeq/',
      'url' => 'data/tracks/{refseq}/refGene/trackData.json',
      'label' => 'refGene',
      'type' => 'FeatureTrack',
      'key' => 'RefSeq Genes'
    },
    {
      'urlInfo' => 'http://www.ncbi.nlm.nih.gov/pubmed/18428682',
      'url' => 'data/tracks/{refseq}/nscanGene/trackData.json',
      'type' => 'FeatureTrack',
      'label' => 'nscanGene',
      'key' => 'N-SCAN'
    },
    {
      'urlInfo' => 'http://genome.crg.es/software/sgp2/index.html',
      'url' => 'data/tracks/{refseq}/sgpGene/trackData.json',
      'label' => 'sgpGene',
      'type' => 'FeatureTrack',
      'key' => 'SGP Genes'
    },
    {
      'urlInfo' => 'http://genome.crg.es/software/geneid/',
      'url' => 'data/tracks/{refseq}/geneid/trackData.json',
      'type' => 'FeatureTrack',
      'label' => 'geneid',
      'key' => 'Geneid Genes'
    },
    {
      'urlInfo' => 'http://compgen.bscb.cornell.edu/phast/help-pages/exoniphy.txt',
      'url' => 'data/tracks/{refseq}/exoniphy/trackData.json',
      'label' => 'exoniphy',
      'type' => 'FeatureTrack',
      'key' => 'Exoniphy'
    }
]; 

my $jsonparser = new JSON;

my $json = $jsonparser->pretty->encode($toWrite);
