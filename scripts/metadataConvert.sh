#!/bin/sh
# metadateConvert script, version 0.2 
# by Ian Sullivan 
# Licensed CC0 (https://creativecommons.org/publicdomain/zero/1.0/legalcode) 
#
# A utility script for converting metadata and bookmark files from djvubind 
# format to pdfbead format. This script only handles the simple forms of 
# bookmark files and does *not* currently support nested bookmarks.
#
# This script is designed to run in a directory with the following files:
#       1. metadata             (metadata file in djvuformat)
#       3. bookmarks            (bookmarks in djvubind format)
#
# The "metadata" file is expected to have contents of this format:
#
# author "Author Name"
# title "Book Title"
# year "Year of Publication"
#
# The "bookmark" file is expected to have contents of this format:
#
# (bookmarks
# ("Cover" "#1" )
# ("Title" "#" )
# ("Chapter 1" "#" )
# ("Chapter 2" "#" )
# ("Chapter 3" "#" )
# )
#

# Removes the extra spaces, parantheses, and quotation marks from the
# djvu formatted file

sed \
-e 's| (||'         \
-e 's|" "#|" |'      \
-e 's|" )||'        \
-e 's|)||'          \
-e 's|(bookmarks||' \
bookmarks  > bookmarks-pdf

# Removes the opening "(bookmarks" line and trailing newline as per:
# https://unix.stackexchange.com/questions/96226/delete-first-line-of-a-file

echo "$(sed '1d' bookmarks-pdf)" > bookmarks-pdf

# Changes case for metadata fields and drops "year" field since
# pdfbeads does not support it

sed \
-e 's|author|Author:|'   \
-e 's|title|Title:|'     \
-e 's|year.*||'          \
metadata > metadata-pdf

