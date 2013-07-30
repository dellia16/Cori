#!/usr/bin/perl
use DBI;
use strict;
use CGI qw(:standard -debug);
use CGI::Carp qw(fatalsToBrowser);

my $dbh;
my $stmt;
my $result;

#create database;
$dbh = DBI->connect( "DBI:mysql:", "root", "" ) or die("Couldn't connect to database: " . DBI->errstr);
$dbh->do("create database Updater");

#connect to database;
$dbh = DBI->connect( "DBI:mysql:episode", "root", "" ) or die("Couldn't connect to database: " . DBI->errstr);

#create tables;
$stmt = <<"CREATE_TABLE";
CREATE TABLE episode (
    id INTEGER AUTO_INCREMENT,
    serial_name VARCHAR(60),
    serial_link VARCHAR(255),
    PRIMARY KEY ( id )
)
CREATE_TABLE

$result = $dbh->do( $stmt ) or die("Cannot create table: " . $dbh->errstr);


#selecting the 3 tv series

$stmt = "INSERT INTO episode ( serial_name, serial_link) VALUES ('The Big Bang Theory', '')";
$stmt = $dbh->do( $stmt );
$stmt = "INSERT INTO episode ( serial_name, serial_link) VALUES ('Suits', '')";
$stmt = $dbh->do( $stmt );
$stmt = "INSERT INTO episode ( serial_name, serial_link) VALUES ('Modern Family', '')";
$stmt = $dbh->do( $stmt );
$dbh -> disconnect();

