lims


<entry [Mon 2013:05:06 16:53:10 EST] PASSING PARAMETERS>

PASSING PARAMETERS
https://documentationgls.atlassian.net/wiki/display/DOC/Passing+parameters

EPP PARAMETERS
http://developer.genologics.com/display/EPP/Parameters



    
</entry>
<entry [Mon 2013:05:06 16:50:45 EST] NON-PRODUCTION SERVER>

http://developer.genologics.com/display/TOP/Useful+tools+to+have+when+using+this+site

Importance of a dedicated scripting server
GenoLogics provides at least two servers for API users: the production server and one or more non-production servers for developing and testing. Two servers are always recommended so developers can design, build, test and upgrade efficiently. The non-production system licenses serve the following purposes:

To provide a sandbox in which to experiment with the API and the system configuration.
To provide a verification platform for upgrading scripts, software components, and overall system integration before deploying to production.
The Cookbook script examples do not explain how to configure the servers for process configuration. Server installation and server-side configuration instructions are covered during implementation, as part of the installation and training services.

	Examples written for learning the API on non-production servers
The non-production server license and the Cookbook examples are not for production use. It is not practical to permanently integrate actual instruments to this server, but it does provide a great way to learn to script. The typical installation includes the Clarity LIMS software, the External Program Plugin (EPP), and Groovy. The non-production scripting sandbox server provides you with a safe place to learn the API, using the Cookbook example scripts as a guide.
    
</entry>
<entry [Mon 2013:05:06 16:49:22 EST] GENOLOGICS API RESOURCES>

http://genologics.com/support/api-community

https://developer.genologics.com/display/Blog/Welcome+to+developer.genologics.com



From: Ajay, Subramanian 
Sent: Tuesday, March 05, 2013 10:04 AM
To: Young, Stuart
Cc: Cruz, Pedro
Subject: CLIA Clarity LIMS and SaffronDB integration

Hi Stuart, 

I spoke to Pedro about getting your help with communication/integration between SaffronDB and the new CLIA Clarity LIMS (GenoLogics). In brief, the objective is to be able to enable (via REST APIs) two-way information exchange of:
-	Lane/Run statuses
-	Requeues

I forwarded you a training session that has been scheduled for Thursday where more details will be presented by the vendor.

Here are some examples and resources if you’d like to look through before the session:

http://genologics.com/support/api-community

https://developer.genologics.com/display/Blog/Welcome+to+developer.genologics.com

Best,
Shankar


Subramanian Shankar Ajay, Ph.D
Bioinformatics Scientist 2, Sequencing Services Production
Illumina, Inc.
Work: 858.736.3787
Email: sajay@illumina.com


    
</entry>
<entry [Mon 2013:05:06 16:43:37 EST] TEST SCRIPTS>


http://developer.genologics.com/display/TOP/Useful+tools+to+have+when+using+this+site

Script deployment
GenoLogics recommends placing scripts in sub-directories starting from a common root, namely /opt/gls/clarity/customextensions/. This makes moving scripts between development, test, and production systems much easier and less error-prone. This directory is assumed by the backup and restore process.

Use a directory structure beneath this root to expand your deployed scripts over time. This customextensions folder is reserved exclusively for your custom scripts.

At GenoLogics, we call this practice 'deploying on the rails'. The directories below illustrate how this method is used to deploy multiple instrument integrations:

/opt/gls/clarity/extensions/
/opt/gls/clarity/extensions/Illumina/HiSeq/v1.1
/opt/gls/clarity/extensions/ABI/SOLiD/v1.0
/opt/gls/clarity/customextensions/'YourRootDirectory'
- root dir for all EPP Scripts
- Integration from GenoLogics, do not modify
- Another integration for GenoLogics
- Scripts created by you
Putting all your scripts into a common root directory also allows multiple teams to work on your implementation independently - for example, when GenoLogics is providing custom integrations and you are scripting at the same time. The backup and restore process will allow you to transfer all files in the root directory between systems. It's important, therefore, that you do not place server-specific settings, such as IP addresses or login details, in these directories.


Groovy
The Cookbook how-to examples and the non-production server use scripts written in Groovy, a Java based scripting language.

You can use other languages with the API; however, we used Groovy because it is easy to understand. Groovy scripts look a lot like pseudo-code. In addition, Groovy is particularly suited to real scripting because it handles and manipulates the major inputs, outputs, and interfaces within Clarity LIMS well.

    
</entry>
<entry [Mon 2013:05:06 15:18:12 EST] EPP SCRIPTS>

https://developer.genologics.com/display/TOP/How+EPP+interacts+with+Users,+Clarity+LIMS+and+REST

How to configure scripts that are called by EPP
Scripts or third-party programs are called using the operating system command line, and must therefore:

be callable on the command line - and preferably, can read and respond to command-line parameters.
be accessed by the user account running the EPP program, with appropriate permissions and disk locations.
exit with appropriate exit codes, otherwise EPP may record the script completed with an error.


CALCULATE AVERAGE EXAMPLE SCRIPT
http://developer.genologics.com/display/CBOOK1/Performing+post-process+calculations+with+analyte+UDFs


// Cookbook Example Script for Clarity LIMS
import GLSRestApiUtils

/**
 * Description:
 *
 * This example shows how to use analyte UDFs to perform a calculation after the process has been run.
 */

className = getClass().simpleName
def cli = new CliBuilder(usage: "groovy ${getClass().simpleName}.groovy -h HOSTNAME -u USERNAME -p PASSWORD -pr PROCESSURI")
cli.h(argName:'hostname',    longOpt:'hostname',   required:true, args:1, 'Server Ip and Port (Required)')
cli.u(argName:'username',    longOpt:'username',   required:true, args:1, 'LIMS username (Required)')
cli.p(argName:'password',    longOpt:'password',   required:true, args:1, 'LIMS password (Required)')
cli.pr(argName:'processURI', longOpt:'processURI', required:true, args:1, 'Process REST representation URI (Required)')

def opt = cli.parse(args)
if (!opt) {
    System.exit(-1)
}

hostname = opt.h
username = opt.u
password = opt.p
processURI = opt.pr

// Retrieve the process
process = GLSRestApiUtils.httpGET(processURI, username, password)

// For each input-output-map
process.'input-output-map'.each {
    // For PerInput outputs
    if (it.'output'[0].@'output-generation-type' == 'PerInput') {
        // Retrieve the artifacts
        outputArtifactURI = it.'output'[0].@uri
        outputArtifactURI = GLSRestApiUtils.stripQuery(outputArtifactURI)
        inputArtifactURI = it.'input'[0].@uri
        inputArtifactURI = GLSRestApiUtils.stripQuery(inputArtifactURI)
        inputArtifact = GLSRestApiUtils.httpGET(inputArtifactURI, username, password)
        outputArtifact = GLSRestApiUtils.httpGET(outputArtifactURI, username, password)

        // Store the UDF values required for the calculation
        concentration = inputArtifact.'udf:field'.find { 'Concentration' == it.@name }.value()[0].toDouble()
        size = inputArtifact.'udf:field'.find { 'Size (bp)' == it.@name }.value()[0].toDouble()

        // Perform the calculation and store its result in the required UDF and update it in the API
        result = (1522.9972586 * (concentration / size))
        outputArtifact = GLSRestApiUtils.setUdfValue(outputArtifact, 'Conc. nM', result)
        GLSRestApiUtils.httpPUT(outputArtifact, outputArtifact.@uri, username, password)
    }
}
println "Calculation Complete."


HOW TO GET REPLICATES?





</entry>
<entry [Mon 2013:05:06 11:52:36 EST] API ACCESS>

POSTMAN

http://ussd-prd-lnla03.illumina.com:8080/api/v2/samples/ADM1A1

LOGIN
syoung1
syoung1


EXAMPLE API OUTPUT


http://ussd-prd-lnla03.illumina.com:8080/api/v2/samples/YOU129A3

<!--
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<smp:sample 
    xmlns:udf="http://genologics.com/ri/userdefined" 
    xmlns:ri="http://genologics.com/ri" 
    xmlns:file="http://genologics.com/ri/file" 
    xmlns:smp="http://genologics.com/ri/sample" uri="http://ussd-prd-lnla03.illumina.com:8080/api/v2/samples/YOU129A3" limsid="YOU129A3">
    <name>SY_PG6425215</name>
    <date-received>2013-05-06</date-received>
    <project limsid="YOU129" uri="http://ussd-prd-lnla03.illumina.com:8080/api/v2/projects/YOU129"/>
    <submitter uri="http://ussd-prd-lnla03.illumina.com:8080/api/v2/researchers/12">
        <first-name>Stuart</first-name>
        <last-name>Young</last-name>
    </submitter>
    <artifact limsid="YOU129A3PA1" uri="http://ussd-prd-lnla03.illumina.com:8080/api/v2/artifacts/YOU129A3PA1?state=1552"/>
    <udf:field type="String" name="Sequencing Method">Paired End Read</udf:field>
    <udf:field type="String" name="Sequencing Coverage">200 Gb</udf:field>
    <udf:field type="String" name="Sample Type">Genomic DNA</udf:field>
    <udf:field type="String" name="Reference Genome">Human</udf:field>
    <udf:field type="String" name="Application">Whole genome sequencing</udf:field>
    <udf:field type="String" name="Read Length">2x100 bp</udf:field>
    <udf:field type="String" name="Sample Buffer Vol. (uL)">TE</udf:field>
    <udf:field type="Numeric" name="Sample Conc.">207.91</udf:field>
    <udf:field type="String" name="Units">ng/ul</udf:field>
    <udf:field type="Numeric" name="Volume (uL)">20</udf:field>
</smp:sample>
-->

http://ussd-prd-lnla03.illumina.com:8080/api/v2/files/ADM1-40-1

<!--
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<file:file 
    xmlns:file="http://genologics.com/ri/file" uri="http://ussd-prd-lnla03.illumina.com:8080/api/v2/files/ADM1-40-1" limsid="ADM1-40-1">
    <attached-to>http://ussd-prd-lnla03.illumina.com:8080/api/v2/projects/ADM1</attached-to>
    <content-location>sftp://ussd-prd-lnla03.illumina.com/home/glsftp/ADM1/ADM1-40-1.xlsx</content-location>
    <original-location>Clarity LIMS Example Sample Sheet.xlsx</original-location>
    <is-published>true</is-published>
</file:file>
-->


EXAMPLE EXTERNAL SCRIPT

Operations Interface --> Config --> Processes --> Process Types --> Bioanalyzer Tagmentation QC (Nextera DNA) 4.0 --> Command Line Call

Parse Bioanalyzer XML and Assign QC flags based upon criteria above

bash -c "/usr/bin/java -jar /opt/gls/clarity/extensions/ngs-common/v4/EPP/ngs-extensions.jar -i {processURI:v2:http} -u {username} -p {password} script:parseBioAnalyzer -inputFile {compoundOutputFileLuid0} -log {compoundOutputFileLuid3} -configFile '/opt/gls/clarity/extensions/conf/bioanalyzer/defaultBioAnalyzerDNAConfig.groovy' script:assignQC -log {compoundOutputFileLuid4} -qcResult {compoundOutputFileLuid5}"



AGGREGATE QC SCRIPT OUTPUTS

Aggregate QC Flags and Copy Fields

bash -c "/usr/bin/java -jar /opt/gls/clarity/extensions/ngs-common/v4/EPP/ngs-extensions.jar -i {processURI:v2:http} -u {username} -p {password} script:setUDF -f 'Progress' -t '//input/@uri->//sample/@uri' -v 'Initial sample QC complete' script:aggregateQC -c 'true' -a 'true' -log {compoundOutputFileLuid0} -aggregatelog {compoundOutputFileLuid1} -copylog {compoundOutputFileLuid2}"



AVERAGE DNA CONCENTRATION INPUTS

bash -c "/usr/bin/java -jar /opt/gls/clarity/extensions/ngs-common/v4/EPP/ngs-extensions.jar -i {processURI:v2:http} -u {username} -p {password} script:setUDF -f 'Progress' -t '//input/@uri->//sample/@uri' -v 'Initial sample QC complete' script:aggregateQC -c 'true' -a 'true' -log {compoundOutputFileLuid0} -aggregatelog {compoundOutputFileLuid1} -copylog {compoundOutputFileLuid2}"



</entry>