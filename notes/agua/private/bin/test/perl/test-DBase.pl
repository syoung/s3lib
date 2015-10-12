#!/usr/bin/perl -w
use strict;

use lib "../lib";

use DBaseFactory;
use Data::Dumper;

#### CREATE DB OBJECT USING DBASE FACTORY
my $dbobject = DBaseFactory->new( "SQLite", { 'DBFILE' => "data.dbl" } );
print "Dbobject\n";
print Dumper $dbobject;

#### GET DATABASE HANDLE FROM DB OBJECT
my $dbh = $dbobject->dbh();
print "DBH:\n";
print Dumper $dbh;

#### CREATE PROJECTS TABLE
$dbobject->create_table("projects", "sql/projects.sql");

### LOAD DATA INTO TABLE
$dbobject->load("projects", "sql/projects.bsv");

#### GET FIELDS IN projects TABLE
#my $fields = $dbobject->fields("projects");
#print "Fields:\n";
#print Dumper $fields;

## GET ALL RECORDS IN PROJECTS TABLE
my $query;
$query = qq{SELECT * FROM projects WHERE owner = 'syoung'};
my $hasharray = $dbobject->queryhasharray($query);
print "Queryhasharray:\n";
print Dumper $hasharray;

$query = qq{SELECT * FROM projects WHERE owner = 'syoung' AND location = 'syoung/Project1'};
my $hash = $dbobject->queryhash($query);
print "Queryhash:\n";
print Dumper $hash;

$query = qq{SELECT * FROM projects WHERE owner = 'syoung' AND location = 'syoung/Project1'};
my $array = $dbobject->queryarray($query);
print "Array:\n";
print Dumper $array;


##### RETRIEVE PROJECT NAMES FOR USER ADMIN
#my $query = qq{SELECT project FROM projects WHERE owner='admin'};
#$dbobject->queryarray($query);



#my $dbobject_stamp = DBaseFactory->instantiate("Stamp", "Good-bye\n");
#$dbobject_stamp->greet();

