#!/usr/bin/env perl
use warnings;
use strict;

# Command Line Argument Setup #
use Getopt::Long;
#use Date::Calc qw(:all);
if (@ARGV != 0)
{
    print "\nERROR: No inputs required.\n";
    die;
}

# Open working directory
opendir(DIR,"./");
my @files = sort readdir(DIR);
closedir(DIR);

foreach(@files)
{
	print STDOUT "$_\n"
}