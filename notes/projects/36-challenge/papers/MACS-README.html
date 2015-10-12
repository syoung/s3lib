<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
  <title>MACS - README (for version 1.3.3)</title>
  <link rel="alternate" type="application/rss+xml" title="RSS" href="http://liulab.dfci.harvard.edu/~taoliu/blog/index.rss" />
  <link rel="author" href="http://liulab.dfci.harvard.edu/~taoliu/web/AboutMe.html" />
  <link rel="home" href="http://liulab.dfci.harvard.edu/~taoliu/web/WelcomePage.html" />
  <link rel="stylesheet" type="text/css" charset="utf-8" media="all" href="/MACS/css/common.css" />
<link rel="stylesheet" type="text/css" charset="utf-8" media="screen" href="/MACS/css/screen.css" />
<link rel="stylesheet" type="text/css" charset="utf-8" media="print" href="/MACS/css/print.css" />
  <meta name="description" content="MACS website by Tao Liu" />
  <meta name="keywords" content="chip-seq, chip-chip, solexa, solid,
								 biology, computer" />
  <meta name="generator" content="Muse" />
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>

<body>

<div class="menu">
  <div class="menuitem">
    <a title="README" href="/MACS/00README.html">Readme</a>
  </div>
  <div class="menuitem">
    <a title="Installation" href="/MACS/INSTALL.html">Install</a>
  </div>
  <div class="menuitem">
    <a title="Download" href="/MACS/Download.html">Download</a>
  </div>
  <div class="menuitem">
    <a title="Contribution" href="/MACS/Contributions.html">Contributions</a>
  </div>
  <div class="menuitem">
    <a title="Frequently Asked Questions" href="/MACS/FAQ.html">FAQ</a>
  </div>
  <div class="menuitem">
    <a title="Changelog" href="/MACS/ChangeLog.html">ChangeLog</a>
  </div>
  <div class="menuitem">
    <a title="TODO" href="/MACS/Todo.html">TODOs</a>
  </div>
</div><!-- menu ends here -->

<h1 id="top">
<a href="index.html"
style="text-decoration: none;">
<img src="/MACS/pic/MACS_logo.png"
alt="MACS logo" />
</a>
README (for version 1.3.3)
</h1>

<!-- Page published by Emacs Muse begins here -->

<h2>Introduction</h2>

<p class="first">With the improvement of sequencing techniques, chromatin
immunoprecipitation followed by high throughput sequencing (ChIP-Seq)
is getting popular to study genome-wide protein-DNA interactions. To
address the lack of powerful ChIP-Seq analysis method, we present a
novel algorithm, named Model-based Analysis of ChIP-Seq (<a href="index.html">MACS</a>), for
identifying transcript factor binding sites. <a href="index.html">MACS</a> captures the
influence of genome complexity to evaluate the significance of
enriched ChIP regions, and <a href="index.html">MACS</a> improves the spatial resolution of
binding sites through combining the information of both sequencing tag
position and orientation. <a href="index.html">MACS</a> can be easily used for ChIP-Seq data
alone, or with control sample with the increase of specificity.</p>


<h2>Install</h2>

<p class="first">Please check the file 'INSTALL' in the distribution.</p>


<h2>Usage</h2>

<pre class="example">
Usage: macs &lt;-t tfile&gt; [options]

MACS -- Model-based Analysis for ChIP-Sequencing

Options:
  --version             show program's version number and exit
  -h, --help            show this help message and exit.
  -t TFILE, --treatment=TFILE
                        ChIP-seq treatment files. REQUIRED
  -c CFILE, --control=CFILE
                        Control files.
  --name=NAME           Experiment name, which will be used to generate output
                        file names. DEFAULT: &quot;NA&quot;
  --format=FORMAT       Format of tag file, &quot;ELAND&quot; or &quot;BED&quot;. DEFAULT: &quot;BED&quot;
  --gsize=GSIZE         Genome size, default:2.7e+9
  --tsize=TSIZE         Tag size. DEFAULT: 25
  --bw=BW               Band width. This value is used while building the
                        shifting model. If --nomodel is set, 2 time of this
                        value will be used as a scanwindow width. DEFAULT: 300
  --pvalue=PVALUE       Pvalue cutoff for peak detection. DEFAULT: 1e-5
  --mfold=MFOLD         Select the regions with MFOLD high-confidence
                        enrichment ratio against background to build model.
                        DEFAULT:32
  --wig                 Whether or not to save shifted raw tag count at every
                        bp into a wiggle file. WARNING: this process is
                        time/space consuming!!
  --space=SPACE         The resoluation for saving wiggle files, by default,
                        MACS will save the raw tag count every 10 bps. Usable
                        only with '--wig' option.
  --verbose=VERBOSE     Set verbose level. 0: only show critical message, 1:
                        show additional warning message, 2: show process
                        information, 3: show debug messages. DEFAULT:2
  --nolambda            Whether or not to use the local lambda. If True, MACS
                        will use lambda_background as local_lambda
  --lambdaset=LAMBDASET
                        Three levels of nearby region in basepairs to
                        calculate dynamic lambda, DEFAULT: &quot;1000,5000,10000&quot;
  --nomodel             Whether or not to build the shifting model. If True,
                        MACS will not build model. by default it means
                        shifting size = 100, try to set shiftsize to change
                        it. DEFAULT: False
  --shiftsize=SHIFTSIZE
                        The arbitrary shift size in bp. Available only when
                        nomodel is true. DEFAULT: 100
  --diag                Whether or not to produce a diagnosis report. It's up
                        to 9X time consuming. Please check 00README file for
                        detail. DEFAULT: False

</pre>
<h3>Parameters:</h3>

<h4>-t/&mdash;treatment FILENAME</h4>

<p class="first">This is the only REQUIRED parameter for <a href="index.html">MACS</a>.</p>

<p>ChIP-seq treatment data file can be in either BED format (refer to:
<a href="http://genome.ucsc.edu/FAQ/FAQformat#format1">http://genome.ucsc.edu/FAQ/FAQformat#format1</a>) or ELAND output format.</p>

<p>In an ELAND output file, each line MUST represents only ONE tag, with fields of:</p>

<ol>
<li>Sequence name (derived from file name and line number if format is not Fasta)</li>
<li>Sequence</li>
<li>Type of match:
NM - no match found.
QC - no matching done: QC failure (too many Ns basically).
RM - no matching done: repeat masked (may be seen if repeatFile.txt was specified).
U0 - Best match found was a unique exact match.
U1 - Best match found was a unique 1-error match.
U2 - Best match found was a unique 2-error match.
R0 - Multiple exact matches found.
R1 - Multiple 1-error matches found, no exact matches.
R2 - Multiple 2-error matches found, no exact or 1-error matches.</li>
<li>Number of exact matches found.</li>
<li>Number of 1-error matches found.</li>
<li>Number of 2-error matches found.
Rest of fields are only seen if a unique best match was found (i.e. the match code in field 3 begins with &quot;U&quot;).</li>
<li>Genome file in which match was found.</li>
<li>Position of match (bases in file are numbered starting at 1).</li>
<li>Direction of match (F=forward strand, R=reverse).</li>
<li>How N characters in read were interpreted: (&quot;.&quot;=not applicable, &quot;D&quot;=deletion, &quot;I&quot;=insertion).
Rest of fields are only seen in the case of a unique inexact match (i.e. the match code was U1 or U2).</li>
<li>Position and type of first substitution error (e.g. 12A: base 12 was A, not whatever is was in read).</li>
<li>Position and type of first substitution error, as above.</li>
</ol>

<p>Notes:</p>

<p>1) For BED format, the 6th column of strand information is required by
<a href="index.html">MACS</a>. And please pay attention that the coordinates in BED format is
zero-based and half-open
(<a href="http://genome.ucsc.edu/FAQ/FAQtracks#tracks1">http://genome.ucsc.edu/FAQ/FAQtracks#tracks1</a>).</p>

<p>2) For ELAND format, only matches with match type U0, U1 or U2 is
accepted by <a href="index.html">MACS</a>, i.e. only the unique match for a sequence with less
than 3 errors is involed in calculation. If multiple hits of a single
tag are included in your raw ELAND file, please remove the redundancy
to keep the best hit for that sequencing tag.</p>

<p>3) For the experiment with several replicates, it is recommended to
concatenate several ChIP-seq treatment files into a single file. To do
this, under Unix/Mac or Cygwin (for windows OS), type:</p>

<p><code>$ cat replicate1.bed replicate2.bed replicate3.bed &gt; all_replicates.bed</code></p>


<h4>-c/&mdash;control</h4>

<p class="first">The control or mock data file in either BED format or ELAND output
format. Please follow the same direction as for -t/&mdash;treatment.</p>


<h4>&mdash;name</h4>

<p class="first">The name string of the experiment. <a href="index.html">MACS</a> will use this string NAME to
create output files like 'NAME_peaks.xls', 'NAME_negative_peaks.xls',
'NAME_peaks.bed' ,'NAME_model.r' and so on. So please avoid any
confliction between these filenames and your existing files.</p>


<h4>&mdash;gsize</h4>

<p class="first">PLEASE assign this parameter to fit your needs!</p>

<p>It's the mappable genome size or effective genome size which is
defined as the genome size which can be sequenced. Because of the
repetitive features on the chromsomes, the actual mappable genome size
will be smaller than the original size. The default 2.7Gb is
recommended for UCSC human hg18 assembly.</p>


<h4>&mdash;tsize</h4>

<p class="first">The size of sequencing tags. Default is 25 nt.</p>


<h4>&mdash;bw</h4>

<p class="first">The band width which is used to scan the genome for model
building. You can set this parameter as the half of sonication
fragment size expected from wet experiment.</p>

<p>Another effect for this parameter is, when you set the '&mdash;nomodel'
argument to bypass the model building procedure, that 2*bw will be
used as a scan window width.</p>


<h4>&mdash;pvalue</h4>

<p class="first">The pvalue cutoff.</p>


<h4>&mdash;mfold</h4>

<p class="first">This parameter is used to select the regions with MFOLD fold tag
enrichment against background to build model. Default is 32. Higher
the MFOLD, less the number of candidate regions. If you see an ERROR or
CRITICAL message from <a href="index.html">MACS</a>, it is recommended to lower this parameter.</p>


<h4>&mdash;verbose</h4>

<p class="first">If you don't want to see any message during the running of <a href="index.html">MACS</a>, set
it to 0. But the CRITICAL messages will never be hidden. If you want
to see rich information like how many peaks are called for every
chromosome, you can set it to 3 or larger than 3.</p>



<h3>&mdash;wig</h3>

<p class="first">If this flag is on, <a href="index.html">MACS</a> will store the number of shifted tags in
wiggle format for every chromosomes. The gzipped wiggle files will be
stored in subdirectories named EXPERIMENT_NAME+'_<a href="index.html">MACS</a>_wiggle/treat'
for treatment data and EXPERIMENT_NAME+'_<a href="index.html">MACS</a>_wiggle/control' for
control data.</p>


<h3>&mdash;nolambda</h3>

<p class="first">With this flag on, <a href="index.html">MACS</a> will use the background lambda as local lambda.</p>


<h3>&mdash;lambdaset</h3>

<p class="first">This parameter controls which three levels of regions will be checked
around the peak region to calculate the maximum lambda as local
lambda. By default, <a href="index.html">MACS</a> considers 1000bp, 5000bp and 10000bp regions
around.</p>

<p>The parameter is a string value like '1000,5000,10000'.</p>


<h3>&mdash;nomodel</h3>

<p class="first">While on, <a href="index.html">MACS</a> will bypass building the shifting model.</p>


<h3>&mdash;shiftsize</h3>

<p class="first">While '&mdash;nomodel' is set, <a href="index.html">MACS</a> uses this parameter to shift tags to
their midpoint. For example, if the size of binding region for your
transcription factor is 200 bp, and you want to bypass the model
building by <a href="index.html">MACS</a>, this parameter can be set as 100.</p>


<h3>&mdash;diag</h3>

<p class="first">A diagnosis report can be generated through this option. This report
can help you get an assumption about the sequencing saturation. This
funtion is only in beta stage.</p>



<h2>Output files</h2>

<ol>
<li>NAME_peaks.xls is a tabular file which contains information about
called peaks. You can open it in excel and sort/filter using excel
functions. Information include: chromosome name, start position of
peak, end position of peak, length of peak region, peak summit
position related to the start position of peak region, number of tags
in peak region, -10*log10(pvalue) for the peak region (e.g. pvalue
=1e-10, then this value should be 100), fold enrichment for this region
against random Poisson distribution with local lambda, FDR in
percentage. Coordinates in XLS is 1-based which is different with BED
format.</li>

<li>NAME_peaks.bed is BED format file which contains the peak
locations. You can load it to UCSC genome browser or Affymetrix IGB
software.</li>

<li>NAME_negative_peaks.xls is a tabular file which contains
information about negative peaks. Negative peaks are called by
swapping the ChIP-seq and control channel.</li>

<li>NAME_model.r is an R script which you can use to produce a PDF
image about the model based on your data. Load it to R by:</li>
</ol>

<p><code>$ R --vanilla &lt; NAME_model.r</code></p>

<p>Then a pdf file NAME_model.pdf will be generated in your current
directory. Note, R is required to draw this figure.</p>

<ol>
<li>NAME_treat/control_afterfiting.wig.gz files in NAME_<a href="index.html">MACS</a>_wiggle
directory are wiggle format files which can be imported to UCSC
genome browser/GMOD/Affy IGB.</li>

<li>NAME_diag.xls is the diagnosis report. First column is for various
fold_enrichment ranges; the second column is number of peaks for that fc
range; after 3rd columns are the percentage of peaks covered after
sampling 90%, 80%, 70% ... and 20% of the total tags.</li>
</ol>


<h2>FAQs</h2>

<p class="first">NA now.</p>


<!-- Page published by Emacs Muse ends here -->
    <div class="navfoot">
      <hr />
      <table width="100%" border="0" summary="Footer navigation">
        <col width="90%" /><col width="5%" /><col width="5%" />
        <tr>
          <td align="left">
            [ <a href="index.html">MACS</a>| <a href="http://liulab.dfci.harvard.edu/"> Liu Lab</a> ]
          </td>
          <td>
            <a href="http://validator.w3.org/check?uri=referer"
               style="text-decoration: none;">
              <img src="http://www.w3.org/Icons/valid-xhtml10"
                   alt="Valid XHTML 1.0!" height="31" width="88" />
            </a>
          </td>
          <td>
            <a href="http://jigsaw.w3.org/css-validator/check/referer"
               style="text-decoration: none;">
              <img style="border:0;width:88px;height:31px"
                   src="http://jigsaw.w3.org/css-validator/images/vcss"
                   alt="Valid CSS!" />
            </a>
          </td>
        </tr>
      </table>
      <table width="100%">
        <tr>
          <td align="left">
	    <a href="http://www.gnu.org/software/emacs/emacs.html"
               style="text-decoration: none;">
            <img alt="Emacs logo"
                 src="/~taoliu/pic/gnu_emacs_icon_grey.png" />
            </a>
	    <a href="http://www.mwolson.org/projects/EmacsMuse.html" style="text-decoration: none;">
              <img alt="Emacs Muse"
            src="/~taoliu/pic/muse-made-with.png" />
            </a>
          </td>
	  <td align="left">
	    <a href="http://www.catb.org/hacker-emblem/">
	      <img src="http://www.catb.org/hacker-emblem/glider-small.png"
	      alt="hacker emblem" /></a>
	    <a  href="http://www.openoffice.org">
	      <img src="http://marketing.openoffice.org/art/galleries/marketing/web_buttons/nicu/110x32_3_get.png"
	      alt=" Use OpenOffice.org" title="UseOpenOffice.org"/> </a>
	  </td>
          <td align="right">
            <span class="footdate">
            Updated December  3, 2008
            </span>
          </td>
        </tr>
      </table>
    </div>
  </body>
</html>
