# pdfbeads

`pdfbeads` is a command line tool to convert a directory of images into a highly compressed PDF file. Ideally, the images you use will be output from Scantailor. If not, you will lose the majority of the benefit of using pdfbeads and your final pdf will be much larger.

Under the hood pdfbeads is performing a number of different steps when building your PDF.

First it examines each page image to see what `Mode` it is in and then chooses the appropriate compression tool for that mode. More detail on page modes is available in the "[Bitonal conversion](https://github.com/wikey/bookscan/blob/master/documentation/post-processing.md#bitonal-conversion)" section of the Scantailor [post-processing](https://github.com/wikey/bookscan/blob/master/documentation/post-processing.md) page.

Second, if you have the optional `jbig2enc` package installed, which you should, pdfbeads processes each image to look for instances of each different letter shape so that it can further compress your final book by replace some or all of each instance of a letter in the book with a single picture of that letter from the book. This stage accounts for much of how pdfbeads is able to achieve such tiny file sizes for PDF files but it can introduce errors to the final document by replacing similar characters, like lower case "r" and "i", with a single character. I have found pdfbeads to be very good at avoiding problems so my customary `bindit.sh` book authoring script has pdfbeads set for maximum compression. If you wish to change this value, you can either remove the section of the script between the `-p` and the `>` to use the default value or you can remove jbig2enc entirely.

Finally, pdfbeads takes all of the processed images, the information it has about their content, any OCR files that correspond to the page images, and any bookmark or metadata files you have told it about (using the `-M` for metadata and `-C` for bookmarks options *all taken care of if you are using the `bindit.sh` script), and it stitches them together into a single pdf file.

The simplest call to pdfbeads looks like this:

`pdfbeads > BookName.pdf`

A more complicated one, using metadata and bookmark files will look like this:

`pdfbeads -M metadata-pdf -C bookmarks-pdf > BookName.pdf`

You get maximum compression by telling pdfbeads to use a single dictionary of images for the whole book but you have to tell it how many pages there are manually. Look at the number of tif images you have (including the 0000 named cover image file!) and use that after the -p flag below.

~~~
pdfbeads -C bookmarks-pdf -M metadata-pdf -p <number of tif files> > BookName.pdf
~~~

### Covers

Since pdfbeads seems to have no special support for cover files, the cover needs to be a tif file with the same naming scheme as the rest of the pages in order to be included. Something like BookName-0000.tif or similar works best for me. Technically, it does not matter that your tif file follows the same scheme as the rest of your book pages, so long as it sorts before them so that pdfbeads pulls it in as the first tif in the directory. I like keeping the naming scheme consistent but you could go with 000-cover.tif instead if you prefer.

*Note* both djvubind and pdfbeads treat the cover as a numbered page so you need to account for that when counting the page numbers in your bookmark file or everything will be off by one.

### Bookmarks and Metadata

The Bookmark and Metadata formats for pdfbeads are slightly different than those used by djvubind. pdfbeads wants bookmarks in this format:

    ~~~
    "Cover" 1
    "Title" 4
    ~~~

You can do some additional tricks here, like having nested levels and deciding which of them should be open or closed by default. To nest some items simply indent them with space or tab characters. To determine which of these nested levels are open/expanded by default, use a + character after the page number of any you want to be open like this: 
    ~~~
    "Part One" 1 +
      "Chapter 1" 4
    ~~~

Formal documentation for this is available here: http://www.rubydoc.info/gems/pdfbeads/1.0.3/PDFBeads/PDFBuilder/PDFTOC

pdfbeads wants the metadata file to be in this format:

    ~~~
    Author: "Very Important Person"
    Title: "Equally Important Book"
    ~~~

Note that if you have multiple authors, the best way to add them is with "Name One & Name Two & Name etc" since that will be appropriately parsed by Calibre.

Formal documentation for this is not available but a post in diybookscanner's forum pointed me in the right direction:
http://www.diybookscanner.org/forum/viewtopic.php?f=3&t=1253&p=11972&hilit=pdfbeads+metadata#p11972

(I was not able to get the multiple values to work either by listing Author multiple times or by adding multiple quoted strings in the same author field. Looking at the results in Okular it looks like pdfbeads strips the initial and final quote marks from the string. 
