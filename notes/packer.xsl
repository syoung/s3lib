packer

<entry [Wed 2013:12:04 06:00:51 EST] INSTALL packer>

http://www.packer.io/intro


1. DOWNLOAD
http://www.packer.io/downloads.html

mkdir -p /home/syoung/software/packer
cd /home/syoung/software/packer
wget https://dl.bintray.com/mitchellh/packer/0.4.0_linux_amd64.zip


2. UNZIP TO /usr/local/packer

mkdir -p /usr/local/bin/packer
mv packer* /usr/local/bin/packer

3. ADD TO PATH

export PATH=/usr/local/bin/packer:$PATH


4. VERIFY INSTALLATION

packer

<!--
	usage: packer [--version] [--help] <command> [<args>]
	
	Available commands are:
		build       build image(s) from template
		fix         fixes templates from old versions of packer
		inspect     see components of a template
		validate    check that a template is valid
	
	Globally recognized options:
		-machine-readable    Machine-readable output format.

-->


NOTES
-----

ALTERNATE OSX INSTALLATION: USING Homebrew

ADD the binary tap:

brew tap homebrew/binary
brew install packer

	
</entry>
