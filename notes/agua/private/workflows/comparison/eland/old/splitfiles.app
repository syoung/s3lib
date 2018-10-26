{
   "owner" : "anonymous",
   "location" : "/nethome/syoung/0.5/bin/apps/logic/loop.pl",
   "executor" : "",
   "name" : "splitfiles",
   "submit" : null,
   "description" : "Split input files into subfiles and print list of subfiles to file splitfile.txt in target directory",
   "parameters" : [
      {
         "value" : "1-33",
         "discretion" : "",
         "description" : "",
         "params" : "",
         "ordinal" : 1,
         "argument" : "--replicates",
         "format" : "",
         "paramfile" : "",
         "category" : "",
         "type" : "",
         "param" : "replicates",
         "paramFunction" : ""
      },
      {
         "value" : "distributed",
         "discretion" : "",
         "description" : "",
         "argument" : "--loop",
         "ordinal" : 2,
         "params" : "",
         "format" : "",
         "paramfile" : "",
         "category" : "",
         "type" : "",
         "param" : "loop",
         "paramFunction" : ""
      },
      {
         "value" : "eland-splitfiles",
         "discretion" : "",
         "description" : "",
         "argument" : "--looplabel",
         "ordinal" : 3,
         "params" : "",
         "format" : "",
         "paramfile" : "",
         "category" : "",
         "type" : "",
         "param" : "looplabel",
         "paramFunction" : ""
      },
      {
         "value" : "/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland",
         "discretion" : "",
         "description" : "",
         "argument" : "--outdir",
         "ordinal" : 4,
         "params" : "",
         "format" : "",
         "paramfile" : "",
         "category" : "",
         "type" : "",
         "param" : "outdir",
         "paramFunction" : ""
      },
      {
         "value" : "/nethome/syoung/0.5/bin/apps/aligners/splitFiles.pl",
         "discretion" : "",
         "description" : "",
         "argument" : "--executable",
         "ordinal" : 5,
         "params" : "",
         "format" : "",
         "paramfile" : "",
         "category" : "",
         "type" : "",
         "param" : "executable",
         "paramFunction" : ""
      },
      {
         "value" : "/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-%REPLICATE%.reads_1.sequence.txt",
         "discretion" : "",
         "description" : "",
         "argument" : "--inputfiles",
         "ordinal" : 6,
         "params" : "",
         "format" : "",
         "paramfile" : "",
         "category" : "",
         "type" : "",
         "param" : "inputfiles",
         "paramFunction" : ""
      },
      {
         "value" : "/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/100M/simpleheader/yoruba1-%REPLICATE%.reads_2.sequence.txt",
         "discretion" : "",
         "description" : "",
         "argument" : "--matefiles",
         "ordinal" : 7,
         "params" : "",
         "format" : "",
         "paramfile" : "",
         "category" : "",
         "type" : "",
         "param" : "matefiles",
         "paramFunction" : ""
      },
      {
         "value" : "/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/%REPLICATE%",
         "discretion" : "",
         "description" : "",
         "argument" : "--outputdir",
         "ordinal" : 8,
         "params" : "",
         "format" : "",
         "paramfile" : "",
         "category" : "",
         "type" : "",
         "param" : "outputdir",
         "paramFunction" : ""
      },
      {
         "value" : "eland-%REPLICATE%",
         "discretion" : "",
         "description" : "",
         "argument" : "--label",
         "ordinal" : 9,
         "params" : "",
         "format" : "",
         "paramfile" : "",
         "category" : "",
         "type" : "",
         "param" : "label",
         "paramFunction" : ""
      },
      {
         "value" : "2000",
         "discretion" : "",
         "description" : "",
         "argument" : "--maxjobs",
         "ordinal" : 10,
         "params" : "",
         "format" : "",
         "paramfile" : "",
         "category" : "",
         "type" : "",
         "param" : "maxjobs",
         "paramFunction" : ""
      },
      {
         "value" : "24",
         "discretion" : "",
         "description" : "",
         "argument" : "--walltime",
         "ordinal" : 11,
         "params" : "",
         "format" : "",
         "paramfile" : "",
         "category" : "",
         "type" : "",
         "param" : "walltime",
         "paramFunction" : ""
      },
      {
         "value" : "small",
         "discretion" : "",
         "description" : "",
         "argument" : "--queue",
         "ordinal" : 12,
         "params" : "",
         "format" : "",
         "paramfile" : "",
         "category" : "",
         "type" : "",
         "param" : "queue",
         "paramFunction" : ""
      },
      {
         "value" : "LSF",
         "discretion" : "",
         "description" : "",
         "argument" : "--cluster",
         "ordinal" : 13,
         "params" : "",
         "format" : "",
         "paramfile" : "",
         "category" : "",
         "type" : "",
         "param" : "cluster",
         "paramFunction" : ""
      },
      {
         "value" : "1",
         "discretion" : "",
         "description" : "",
         "argument" : "--cpus",
         "ordinal" : 14,
         "params" : "",
         "format" : "",
         "paramfile" : "",
         "category" : "",
         "type" : "",
         "param" : "cpus",
         "paramFunction" : ""
      },
      {
         "value" : "250000",
         "discretion" : "",
         "description" : "",
         "argument" : "--reads",
         "ordinal" : 15,
         "params" : "",
         "format" : "",
         "paramfile" : "",
         "category" : "",
         "type" : "",
         "param" : "reads",
         "paramFunction" : ""
      },
      {
         "value" : "/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/stdout/%REPLICATE%/splitfiles.out",
         "discretion" : "",
         "description" : "",
         "argument" : "--stdout",
         "ordinal" : 16,
         "params" : "",
         "format" : "",
         "paramfile" : "",
         "category" : "",
         "type" : "",
         "param" : "stdout",
         "paramFunction" : ""
      },
      {
         "value" : "/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/loop-splitfiles.out",
         "discretion" : "",
         "description" : "",
         "argument" : "--loopout",
         "ordinal" : 17,
         "params" : "",
         "format" : "",
         "paramfile" : "",
         "category" : "",
         "type" : "",
         "param" : "loopout",
         "paramFunction" : ""
      }
   ],
   "ordinal" : null,
   "notes" : "",
   "type" : null
}