
#### UPLOAD FILES

use strict;
use Confluence;
 
my $url = "http://localhost:8080/rpc/xmlrpc";
my ($user, $pass, $spaceKey, $directory) = @ARGV;
 
die "Usage is $0 <user> <password> <spacekey> <directoryname>\n"
unless ($spaceKey and -d $directory);
 
my $wiki = new Confluence($url, $user, $pass);
 
opendir DIR, $directory or die "Unable to access directory $directory";
chdir $directory or die "Unable to chdir to $directory";
 
while (my $filename = readdir DIR) {
next unless -f $filename;
my $title = $filename;
$title =~ s/\.\w\w\w$//; # remove filename extension (.xxx)
# read in the file
open FILE, "<$filename" or die "Unable to open file $filename";
my $content = join "", <FILE>;
# create the page object
my $newPage = {
space => $spaceKey,
title => $title,
content => $content
};
print "loading $title\n";
$wiki->updatePage($newPage);

}
 
$wiki->logout();


#### UPLOAD USERS
##
##use strict;
##use Confluence;
## 
##my $url = "http://localhost:8080/rpc/xmlrpc";
##my $adminuser = "****";
##my $adminpass = "****";
##my $wiki = new Confluence($url, $adminuser, $adminpass);
##Confluence::setRaiseError(0);
##Confluence::setPrintError(1);
## 
##while (<>) {
##chomp;
##my ($username, $password, $email, $fullname, $groupname) = split /,/;
##my $user = {name => $username, fullname => $fullname, email => $email};
##print "adding $username\n";
##$wiki->addUser($user, $password);
##$wiki->addUserToGroup($username, $groupname);
##}
## 
##$wiki->logout();



#### DETERMINE GROUP MEMBERSHIP
#
#use strict;
#use Confluence;
# 
#my $url = "http://localhost:8080/rpc/xmlrpc";
#my $adminuser = "*****";
#my $adminpass = "*****";
# 
#my $wiki = new Confluence($url, $adminuser, $adminpass);
#my $users = $wiki->getActiveUsers('true');
#foreach my $user (@$users) {
#my $groups = $wiki->getUserGroups($user);
#foreach my $group (@$groups) {
#print "$user is a member of $group\n";
#};
#}
#$wiki->logout();