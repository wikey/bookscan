# Introduction 

Why digitize your books?
- Share public domain books. See: [Project Gutenberg](http://www.gutenberg.org/wiki/Main_Page)
- Portability (keep all your books on your phone or laptop.)
- Accessibility (after OCRing, books become accessible for text to speech and other accessibility tools)
- Preserve books that are disintegrating because of acid paper or other difficulties.

The basic steps of book digitizing are: scanning the pages, processing the page images, author the images into a book file. 

### Why free software?

I think it important to share technology, to learn tools that you can give to anyone without asking someone else's permission, to be able to run events like [this](http://dhweek.nycdh.org/event/book-digitization-and-post-processing/). This is the difference between knowing how to cook and knowing how to order at a restaurant. You do not need to become a professional chef to make delicious food, even basic skills will make you significantly more capable and independent. Those are the kind of skills you learn with free software, the ones that stay with you and expand your horizons. 

What we will learn:

pdftk - all purpose PDF manipulation tool

ImageMagic - all purpose image conversion/processing tool

[Scantailor](https://github.com/wikey/bookscan/blob/master/documentation/post-processing.md) - post processing tool for scanned page images

[pdfbeads](https://github.com/wikey/bookscan/blob/master/documentation/pdfbeads.md) - PDF authoring tool optimized for books

*command line*: we will also be getting a very brief introduction to the command line as part of learning these tools.

### Working environment

Before you get too far into book scanning it is important to pay a little attention to your computer working environment.  Keeping everything in standardized places and with standardized names as much as possible will be a big help to your sanity down the road. This kind of regularity let's you easily automate processing steps and lets you quickly re-process a book when you discover any errors later on. For example, if you realize months after scanning a book that you cropped too much off of one page and cannot read an important paragraph, an organized working environment will make it easy for you to find that page, fix the problem, and quickly re-author the book file without needing to touch the rest of the pages. If you cannot find where the files for that book are, or if you got rid of the Scantailor project file, you may have to re-scan or re-process the whole book to fix an error. Trust me when I say that avoiding doing that is worth plenty of effort in organizing your work environment ahead of time.

What does a good working environment look like? 

  * Standard location where you keep your book scans
  * Standard naming convention for all the folders and page images.
  * Copies of all intermediate files.
  * Process for backing up everything, preferably to another computer. 
  * (Optional) Scripts for automatically processing files.

### Sanity saving tips

Keep backups! This is *vital* with destructive scanning where you may no longer have access to the original pages when you discover errors in the image processing but it is important regardless of how you scan your books.

Check every page at least once when processing a book just to make sure you have them all and that you have not cut off or failed to properly light any important parts of the page. After your first couple of books, you should be able to do this by quickly paging through all the images. I check once right after scanning and once at the end of processing.

[Continue to Scanning](https://github.com/wikey/bookscan/blob/master/documentation/scanning.md)
