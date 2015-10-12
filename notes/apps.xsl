apps

<entry [Wed 2011:11:30 17:46:11 EST] >


# FIX DOS LINE ENDINGS
alias fle="perl -pi -e 's/\r//g' "
alias fle2="perl -pi -e 's/\r/\n/g' "


alias tools='cd ~/base/perlapps/tools'                         # GO TO TOOLS DIRECTORY

# TOOLS
alias getblast='~/base/bin/utils/get_blast_records.pl'    # GET BLAST RECORD FROM FILE
alias getfasta='~/base/bin/utils/get_fasta_records.pl'    # GET FASTA RECORD FROM FILE
alias chopfile='perl ~/base/bin/utils/chopfile.pl '       # CREATE SUBFILE FROM FILE
alias template='cp ~/base/perl_apps/template/template.pl ./'   # CREATE TEMPLATE BASIC PERL APP IN pwd
alias word='perl ~/base/bin/utils/find_line.pl'           # FIND LINE IN TEXT
alias tools='cd ~/base/bin/utils'                         # DISPLAY TOOL LIST
alias replace_string='perl ~/base/plapps/replace_string/replace_string.pl'  # REPLACE STRING IN FILE 
alias lines='perl ~/base/bin/utils/lines.pl'              # COUNT LINES IN FILE
alias files='perl ~/base/bin/utils/count_files.pl'        # COUNT FILES IN DIRECTORY
alias records='perl ~/base/bin/utils/records.pl'          # COUNT FASTA RECORDS IN FILE
alias lcg='perl ~/base/bin/utils/locate_grep.pl'          # locate USING OPTIONAL grep
#alias splitfasta='perl ~/base/bin/utils/splitfasta.pl'         # SPLIT FASTA FILE INTO SMALLER FILES
#alias randsplitfasta='perl ~/base/bin/utils/randsplitfasta.pl' # SPLIT FASTA FILE INTO SMALLER FILES
alias creamfile='perl ~/base/bin/utils/creamfile.pl'      # TRIM FIRST LINES FROM FILE
alias cleanfasta='perl ~/base/bin/utils/cleanfasta.pl'    # CLEAN " #..."  LINES FROM FILE
alias length='perl ~/base/bin/utils/filelength.pl'        # GET LENGTH OF SEQUENCE IN FILE (FASTA OR JUST SEQUENCE)

    
    
</entry>

