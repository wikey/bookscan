#!/bin/sh 
# BindIt script, version 0.2 
# by Ian Sullivan 
# Licensed CC0 (https://creativecommons.org/publicdomain/zero/1.0/legalcode) 
#
# A utility script for taking scanned or photographed images from
# books and turning them into both pdf and djvu files.
#
# This script is designed to run in a scantailor output directory
# containing all relevant .tif page images and these metadata files:
#
#       1. metadata             (metadata file for djvu)
#	2. metadata-pdf         (metadata for pdf)
#	3. bookmarks            (bookmarks for djvu)
#	4. bookmarks-pdf        (bookmarks for pdf)
#	5. cover_front.jpg      (front cover for djvu)
#	6. [Bookname]-0000.tif  (front cover for pdf)
#
# With all those files present it will shuttle the relevant files
# around, run the OCR and binding operations for pdf and djvu, clean up
# the temporary files, and time each long step to a file named
# "stats.txt".
#
# This script depends on the following programs being installed on
# your machine:
#
# 	1. tesseract-ocr
#	2. parallel
#	3. djvubind
#	4. pdfbeads
#	5. jbig2enc 
#

echo "Creating stats file"
touch stats.txt
echo "OCRing your tifs"
echo "tesseract" >> stats.txt
time ls *.tif | /usr/bin/time --output=stats.txt -a parallel "tesseract {} {.} hocr"
echo "Renaming hocr files to html"
for i in *.hocr;do mv $i ${i%.hocr}.html;done
echo "Building PDF version"
echo "pdfbeads" >> stats.txt
/usr/bin/time --output=stats.txt -a pdfbeads -M metadata-pdf -C bookmarks-pdf -p `ls *.tif | wc | awk {'print $4" "$1'}` > `ls *0000.tif | awk -F "." '{print $1}'`.pdf
echo "moving PDF cover out of directory"
mv *0000.tif ../
mv *9999.tif ../
echo "cleaning up pdf temporary files"
mkdir ../pdfscraps--delete
mv *.black.jbig2 ../pdfscraps--delete/
mv *.sym ../pdfscraps--delete/
mv *.black.tiff ../pdfscraps--delete/
mv *.bg.jpg ../pdfscraps--delete/
mkdir jbig2
mv *.jbig2 jbig2/
mkdir hocr
mv *.html hocr/
echo "Building DJVU version"
echo "djvubind" >> stats.txt
/usr/bin/time --output=stats.txt -a djvubind
echo "Moving final files to main directory"
cp ../*0000.tif .
cp ../*9999.tif .
mv stats.txt ../
mv *.pdf ../
mv *.djvu ../
echo "All done"
