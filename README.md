# GallicaURLconversion
Images clipped from Gallica (gallica.bnf.fr) before October 2015 are no longer valid. This script converts the old urls to new ones that should work.

This perl script was written by Jesse Hurlbut ©2016 jessehurlbut@gmail.com

This script will convert URLs of images clipped from Gallica before 
October 2015 to new-style URLs

The input file containing all of the old URLs should be in text format and can 
contain any other data. There is no special formatting necessary except that URLs
should not be broken across separate lines. The input file
should be in the same subdirectory location as the perl script.

Name the input file 'old-Gallica' (or replace the $filename where indicated below
with the name of your input file). Execute the perl script. A new file will be created
named 'new-Gallica' with all the new URLs. 

To verify that no old URLs remain, search for the string "l=" in the output file.
None of the new URLs should include that string.

Standard disclaimer: use this software at your own risk. No guarantees or promises. 
