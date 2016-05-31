#!/usr/bin/perl

# This perl script was written by Jesse Hurlbut ©2016 jessehurlbut@gmail.com
#
# This script will convert URLs of images clipped from Gallica before 
# October 2015 to new-style URLs
# 
# The input file containing all of the old URLs should be in text format and can 
# contain any other data. There is no special formatting necessary except that URLs
# should not be broken across separate lines. The input file
# should be in the same subdirectory location as the perl script.
#
# Name the input file 'old-Gallica' (or replace the $filename where indicated below
# with the name of your input file). Execute the perl script. A new file will be created
# named 'new-Gallica' with all the new URLs. 
#
# To verify that no old URLs remain, search for the string "l=" in the output file.
# None of the new URLs should include that string.
#
# Standard disclaimer: use this software at your own risk. No guarantees or promises. 
#

use strict;
use warnings;

my $filename = 'old-Gallica'; # Replace old-Gallica with the name of your file
my $bakfile = 'new-Gallica'; # this is where results will be
my $seven;
my $eight;
open(my $fh, '<', $filename) or die "Could not open file '$filename' $!";
open(my $bfh, '>>', $bakfile) or die "Could not open file '$bakfile' $!";

while (my $row = <$fh>) {
  chomp $row;
    # look for l=7
    if ($row =~ m/src=("|'')(http:\/\/gallica\.bnf\.fr\/)proxy\?method=R&amp;ark=(b\w+)\.(f\d+)&amp;l=7&amp;r=(\d+),(\d+),(\d+),(\d+)("|'')/g) {
        $row =~ s/src=("|'')(http:\/\/gallica\.bnf\.fr\/)proxy\?method=R&amp;ark=(b\w+)\.(f\d+)&amp;l=7&amp;r=(\d+),(\d+),(\d+),(\d+)("|'')/src="$2iiif\/ark:\/12148\/$3\/$4\/$6,$5,$8,$7\/$8,$7\/0\/native.jpg"/g;
    }
    # look for l=6
    if ($row =~ m/src=("|'')(http:\/\/gallica\.bnf\.fr\/)proxy\?method=R&amp;ark=(b\w+)\.(f\d+)&amp;l=6&amp;r=(\d+),(\d+),(\d+),(\d+)("|'')/g) {
        $row =~ s/src=("|'')(http:\/\/gallica\.bnf\.fr\/)proxy\?method=R&amp;ark=(b\w+)\.(f\d+)&amp;l=6&amp;r=(\d+),(\d+),(\d+),(\d+)("|'')/src="$2iiif\/ark:\/12148\/$3\/$4\/$6,$5,$8,$7\/$8,$7\/0\/native.jpg"/g;
    }
    # look for l=5
    if ($row =~ m/src=("|'')(http:\/\/gallica\.bnf\.fr\/)proxy\?method=R&amp;ark=(b\w+)\.(f\d+)&amp;l=5&amp;r=(\d+),(\d+),(\d+),(\d+)("|'')/g) {
        $seven = $7 * 2;
        $eight = $8 * 2;
        $row =~ s/src=("|'')(http:\/\/gallica\.bnf\.fr\/)proxy\?method=R&amp;ark=(b\w+)\.(f\d+)&amp;l=5&amp;r=(\d+),(\d+),(\d+),(\d+)("|'')/src="$2iiif\/ark:\/12148\/$3\/$4\/$6,$5,$eight,$seven\/$8,$7\/0\/native.jpg"/g;
    }
    # look for l=4
    if ($row =~ m/src=("|'')(http:\/\/gallica\.bnf\.fr\/)proxy\?method=R&amp;ark=(b\w+)\.(f\d+)&amp;l=4&amp;r=(\d+),(\d+),(\d+),(\d+)("|'')/g) {
        $seven = $7 * 4;
        $eight = $8 * 4;
        $row =~ s/src=("|'')(http:\/\/gallica\.bnf\.fr\/)proxy\?method=R&amp;ark=(b\w+)\.(f\d+)&amp;l=4&amp;r=(\d+),(\d+),(\d+),(\d+)("|'')/src="$2iiif\/ark:\/12148\/$3\/$4\/$6,$5,$eight,$seven\/$8,$7\/0\/native.jpg"/g;
    }
    # look for l=3    
    if ($row =~ m/src=("|'')(http:\/\/gallica\.bnf\.fr\/)proxy\?method=R&amp;ark=(b\w+)\.(f\d+)&amp;l=3&amp;r=(\d+),(\d+),(\d+),(\d+)("|'')/g) {
        $seven = $7 * 8;
        $eight = $8 * 8;
        $row =~ s/src=("|'')(http:\/\/gallica\.bnf\.fr\/)proxy\?method=R&amp;ark=(b\w+)\.(f\d+)&amp;l=3&amp;r=(\d+),(\d+),(\d+),(\d+)("|'')/src="$2iiif\/ark:\/12148\/$3\/$4\/$6,$5,$eight,$seven\/$8,$7\/0\/native.jpg"/g;
    }
    print $bfh "$row\n";
}

close $fh;
close $bfh;
print "done\n";
