galaxy

<entry [Sat 2012:07:21 16:07:34 EST] TAVERNA TO GALAXY >


https://trac.nbic.nl/elabfactory/wiki/eGalaxy#InstallationandRequirements

Enacting Taverna workflows through Galaxy


Introduction

The diversity and availability of bioinformatics tools have increased in recent years. Some tools deal with the same problem using a different approach, others provide different access mechanisms to the same resources while others provide aggregation mechanisms to make use of a number of tools in a uniform way. For the latter, software pipelining systems, are becoming the norm in bioinformatics. Widely used examples of such systems are Galaxy, a web-portal and framework, and Taverna, a workflow management system. The goal of both of these systems is to provide a platform that bioinformaticians and biologists can use to describe their experiments in a number of well described processing steps, i.e. workflows.

However, the approach used is different. In Galaxy the focus is on an intuitive and easy to use user interface, a web-based portal, to aggregate several bioinformatics tools and expose them in a uniform way. Taverna is a workflow management system that allows for the orchestration of a wide range of services. It provides good extensibility points to add new functionality using a plug-in framework. It offers a powerful and flexible workflow language that allows for the description of complex workflows that include repetitions, conditionals and other well understood programming language constructs.

Both of the above mentioned systems provide a wide range of functionality out of the box. There is some overlap but the real added value would be if we could combine that functionality and try to get the best of both systems. This work aims to bridge the two by allowing the more expressive but complex Taverna workflows to execute via the simple and intuitive interface that Galaxy offers. To this end we built a Galaxy tool generator that given a Taverna workflow description and a Taverna Server it constructs a Galaxy tool to enable the enactment of that workflow via Galaxy.

The generator provides a command-line interface (workflow_to_galaxy.rb) that can create a Galaxy tool from either a t2flow workflow file or via a URL of a workflow as exposed by the myExperiment workflow repository (www.myexperiment.org). For convenience the generator is also available in myExperiment, and it will generate the Galaxy tool behind the scenes. The bioinformatician will just browse the myExperiment repository to identify Taverna workflows that are of interest to him/her and he will be able to download them as Galaxy tools which can then be installed into a Galaxy server in the usual way.

There are plans to further automate this procedure by accessing the myExperiment site as a Galaxy external interface, which will dynamically add the workflows as new tools in Galaxy.

References

Galaxy: a comprehensive approach for supporting accessible, reproducible, and transparent computational research in the life sciences. Jeremy Goecks, Anton Nekrutenko, James Taylor, The Galaxy Team. Genome Biology, Vol. 11, No. 8., 2010 
Taverna: a tool for building and running workflows of services. Duncan Hull, Katy Wolstencroft, Robert Stevens, Carole Goble, Mathew R. Pocock, Peter Li, Tom Oinn. Nucleic acids research, Vol. 34, Web Server issue, pp. W729-W732, 2006 
 http://www.taverna.org.uk/documentation/taverna-2-x/server 
myExperiment: a repository and social network for the sharing of bioinformatics workflows. Nucleic acids research, Vol. 38 (suppl 2): W677-W682, 2010. 
 http://www.myexperiment.org
Publications

K. Karasavvas, K. Wolstencroft, E. Mina, D. Cruickshank, A. Williams, D. De Roure, C. Goble and M. Roos. Opening new gateways to workflows for life scientists. To appear in 4th International Workshop on Science Gateways for Life Sciences, Amsterdam, The Netherlands, May 23-25, 2012.
Dissemination

Presented at NBIC Bio Assist Meeting, 18 March 2010
Presented at International Symposium on Integrative Bioinformatics 2011, 21-23 March 2010
Poster at NBIC Conference 2011, 19-20 April 2010
Presented at Galaxy Community Conference 2011, 25-26 May 2010
Presented at BOSC 2011, 15-16 July 2011
Presented at ISMB 2011 technology track, 17-19 July 2011
 Course on Next Generation Sequencing with Galaxy and Taverna, 17 January 2012
Installation and Requirements

The tool is implemented in Ruby, so a Ruby development environment needs to be available. Native packages of libxml, libopenssl and zlib may be required. Please use your favorite package manager to install them (an apt-get example is given). Note that some of the following native packages might already be installed in your system. For Debian-based systems, use this command:

$ sudo apt-get install ruby rubygems gcc build-essential libxml-ruby libopenssl-ruby libxml2-dev ruby1.8-dev libzip-ruby1.8

To install the workflow-to-galaxy generator you only need the following command:

$ sudo gem install workflow-to-galaxy t2-server

Testing

Test that it is correctly installed by typing:

$ workflow_to_galaxy.rb

Note that in some systems the executable will not be automatically in the path. Run:

$ gem environment

and add the value of EXECUTABLE DIRECTORY to your PATH.

Contact

Kostas Karasavvas -- kostas (dot) karasavvas (at) nbic (dot) nl
Marco Roos -- m (dot) roos1 (at) uva (dot) nl


</entry>