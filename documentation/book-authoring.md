[Return to Post-processing](./post-processing.md)

# Book file authoring

Why author? No requirement, you can read books as directories of images files if you want. Authoring gives you better tool support (gallery apps are generally less useful for reading than document readers), the ability to add a text layer, metadata, and to compress everything.

Bitonal conversion got us huge savings in image compression but there are actually special methods for compressing books that we will use to get the kind of tiny files from the introduction.

So, how would you compress a book? You create a [concordance](https://en.wikipedia.org/wiki/Concordance_%28publishing%29) for letterforms, a big index off every time each letter shape is used in the book and then, when you are compressing the whole document, you only need to include one copy of each actual letter image plus a long list of places that image should appear in the final version. Being able to store hundreds of identical copies rather than separate images for each one makes for huge file size savings. The more exhaustive the concordance, the better the compression but also the higher the potential for error if the tool you use mistakes certain letters for each other. Generally you can adjust how aggressive each tool is in trying to find matching shapes. Look for instructions on the page for each tool. I go for maximal compression and have selected tools to reduce the likelihood of error. The potential for introduced error in you final document is one more reason to keep the source(!) and intermediate files. 

If you would rather have pixel perfect accuracy than portable file sizes, you can turn off this compression. You can even keep all your images in greyscale/color. See the [Internet Archive's djvus](https://archive.org/details/naturalhistory00seaguoft) as examples. 

### Authoring formats: pdf vs. djvu

When authoring book files you have two primary formats to choose from: pdf and djvu. Both allow for the same sort of features. Both let you create a multi-page document with an embedded searchable and selectable text layer. The differences tend to boil down to what tools you want to use to create and read the files. 

* PDFs generally have the best tool chain support but may make bigger files. pdfbeads is the tool we will use to create pdfs from Scantailor output.

* Djvu files are generally less memory intensive to read and often come in as smaller files but there are fewer tools that support reading them. For example, have you heard of djvu files before? djvubind is the main tool we will use to make djvu files.

Both pdfbeads and djvubind can use the same free OCR engines: tesseract or cuneiform. Both can also include bookmarks for different chapters and metadata to indicate title, author, and other general information about a book.  The format for these bookmark and metadata files are a little bit different from each other but it is possible to write one file for each and just convert the second copy. Look for the `bookmetaconvert.sh` script in the scripts folder for a working example script.

*[Continue to documentation for pdfbeads](./pdfbeads.md)*
