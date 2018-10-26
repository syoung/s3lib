{
   "owner" : "anonymous",
   "location" : "perl /nethome/syoung/0.5/bin/apps/snp/unbin.pl",
   "executor" : "",
   "name" : "unbinsav",
   "submit" : null,
   "description" : "Join binned .sav files into a single .sav file for each cumulative iteration",
   "parameters" : [
      {
         "value" : "500000",
         "discretion" : "",
         "description" : "",
         "params" : "",
         "ordinal" : 1,
         "argument" : "--binlevel",
         "format" : "",
         "paramfile" : "",
         "category" : "",
         "type" : "",
         "param" : "binlevel",
         "paramFunction" : ""
      },
      {
         "value" : "sav",
         "discretion" : "",
         "description" : "",
         "argument" : "--suffix",
         "ordinal" : 2,
         "params" : "",
         "format" : "",
         "paramfile" : "",
         "category" : "",
         "type" : "",
         "param" : "suffix",
         "paramFunction" : ""
      },
      {
         "value" : "hit.bam",
         "discretion" : "",
         "description" : "",
         "argument" : "--filename",
         "ordinal" : 3,
         "params" : "",
         "format" : "",
         "paramfile" : "",
         "category" : "",
         "type" : "",
         "param" : "filename",
         "paramFunction" : ""
      },
      {
         "value" : "/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/cumulative",
         "discretion" : "",
         "description" : "",
         "argument" : "--outputdir",
         "ordinal" : 4,
         "params" : "",
         "format" : "",
         "paramfile" : "",
         "category" : "",
         "type" : "",
         "param" : "outputdir",
         "paramFunction" : ""
      },
      {
         "value" : "/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/1,/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/2,/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/3,/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/4,/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/5,/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/6,/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/7,/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/8,/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/9,/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/10,/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/11,/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/12,/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/13,/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/14,/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/15,/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/16,/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/17,/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/18,/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/19,/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/20,/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/21,/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/22,/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/23,/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/24,/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/25,/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/26,/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/27,/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/28,/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/29,/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/30,/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/31,/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/32,/scratch/syoung/base/pipeline/SRA/NA18507/SRP000239/sampled/200bp/chr22/eland/33",
         "discretion" : "",
         "description" : "",
         "argument" : "--inputdirs",
         "ordinal" : 5,
         "params" : "",
         "format" : "",
         "paramfile" : "",
         "category" : "",
         "type" : "",
         "param" : "inputdirs",
         "paramFunction" : ""
      },
      {
         "value" : "48",
         "discretion" : "",
         "description" : "",
         "argument" : "--walltime",
         "ordinal" : 6,
         "params" : "",
         "format" : "",
         "paramfile" : "",
         "category" : "",
         "type" : "",
         "param" : "walltime",
         "paramFunction" : ""
      },
      {
         "value" : "LSF",
         "discretion" : "",
         "description" : "",
         "argument" : "--cluster",
         "ordinal" : 7,
         "params" : "",
         "format" : "",
         "paramfile" : "",
         "category" : "",
         "type" : "",
         "param" : "cluster",
         "paramFunction" : ""
      },
      {
         "value" : "small",
         "discretion" : "",
         "description" : "",
         "argument" : "--queue",
         "ordinal" : 8,
         "params" : "",
         "format" : "",
         "paramfile" : "",
         "category" : "",
         "type" : "",
         "param" : "queue",
         "paramFunction" : ""
      },
      {
         "value" : "1",
         "discretion" : "",
         "description" : "",
         "argument" : "--cpus",
         "ordinal" : 9,
         "params" : "",
         "format" : "",
         "paramfile" : "",
         "category" : "",
         "type" : "",
         "param" : "cpus",
         "paramFunction" : ""
      },
      {
         "value" : "1000",
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
      }
   ],
   "ordinal" : null,
   "notes" : "",
   "type" : null
}