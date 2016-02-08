# Introduction 

Why digitize your books?
- Public domain [Project Gutenberg](http://www.gutenberg.org/wiki/Main_Page)
- Portability (keep all your books on your phone or laptop.)
- Accessibility (after OCRing, books become accessible for text to speech and other accessibility tools)
- Preserve books that are disintegrating because of acid paper or other difficulties.

The basic steps of book digitizing are: scan pages, process the page images, author the images into a book file. 

### Why free software?

I think it important to share technology, to learn tools that you can give to someone else without asking someone else's permission, to be able to run events like this. This is the difference between knowing how to cook and knowing how to order at a restaurant. You do not need to become a professional chef to make delicious food, even basic skills will make you significantly more capable and independent. Those are the kind of skills you learn with free software, the ones that stay with you and expand your horizons. 

What we will learn:

pdftk - all purpose PDF manipulation tool

ImageMagic - all purpose image convention/processing tool

Scantailor - post processing tool for scanned page images

pdfbeads - PDF authoring tool optimized for books

*command line*: we will also be getting a very brief introduction to the command line as part of learning these tools.

### Working environment

Important to keep everything standardized as much as possible for your own sanity. Regularity let's you easily automate processing steps and lets you quickly re-process a book when you discover any errors later on. Ex. Of single chapter page miss-aligned and what fixing that looks like with or without intermediary files. 

Keep backups! Vital to backup with destructive scanning. Check every page at least once. I check once at the beginning, once at the end.

What does a good working environment look like? 

  * Standard naming convention for all the folders and page images.
  * Copies of all intermediate files.
  * Process for backing up everything, preferably to another computer. 
  * (Optional) Scripts for automatically processing files.

### Scanning (getting the page images)

While there are a number of different ways you can go about capturing images of your book pages, the characteristics of a good page image are the same regardless of how you capture it. Ideal page images are:

 * completely flat with no warping at the spine
 * in an uncompressed image format (TIFF or RAW)
 * evenly lit across the page with enough light to preserve color accuracy
 * at a high enough resolution for [Optical Character Recognition](https://en.wikipedia.org/wiki/Optical_character_recognition) (OCR) *See `How big should you scan?` secion below* 

Different scanning methods have their own pros and cons when it comes to producing these ideal page images. The three main methods are: destructive scanning (physically removing pages from their binding), flatbed scanning (pressing a book against a copier), and camera-based scanning (using a camera mount to flatten pages while taking pictures of them). Which method you use will depend on various factors including time, money, available equipment, durability or rarity of the source material, and others. Let's look at each in turn.


a) Destructive (USB scanner)
   Destructive scanning involves removing the pages from their binding, generally by cutting the binding off or, *carefully*, ripping pages out individually. Once pages are removed from the binding they can be fed through a USB or standalone sheet-fed scanner. This method produces the most ideal page images.
        Pros: Lighting is perfect, pages are flat, faster than flatbed (~1000-1200 pages/hour), general purpose scanner you can use for other tasks, pages are recyclable, you no longer have books afterwards.
       Cons: You no longer have book afterwards, you need to remove spine (rip, cut, pay someone else), you may need to flip through sheets to verify separation or risk page tearing while scanning. 

b) Flatbed
   Flatbed scanning generally involves pressing an open book against a flatbed scanner to copy a two page spread. Some specialty book flatbed scanners exist that allow for flat single page scans, not that these are generally more expensive and at least twice as slow as the following estimates. 
        Pros: Widely available, does not destroy book.
        Cons: Cumbersome and slower than other means of scanning (~500-600 pages/hour), page images are severely warped at binding,  damages spine.

c) Camera mount-based scanning ([bookliberator](http://bookliberator.com/), [diybookscanner](http://diybookscanner.org/), et al).
   Camera based scanning involves taking pictures of individual book pages using standard digital cameras. This is generally accomplished through use of special camera mounts that flatten the pages opposite from the camera to eliminate page curvature. A handful of versions are available commercially but most are do it yourself projects of varying complexity.
       Pros: Easy on books, faster than flatbed (~900-1200 pages/hour), page images have little or no warping at the spine. Cool.
       Cons: More DIY effort required, custom equipment to build/buy, have to control lighting, may require more effort to operate, may only produce compressed jpg images.

If this is your first time scanning a book I suggest using the whatever equipment you can find already available to you. The more you scan books, the better you will understand the considerations that are most important to you and be able to decide what more specialized tools will work best in your situation.

However you capture page images, do yourself a favor and **keep your unprocessed image files** in whatever format you get them from your scanner or camera. While your ideal images will not use a compressed image format like jpg, once you have the files you can absolutely add them to a zip or other compressed archive. I keep all my image archives in  [7zip](https://en.wikipedia.org/wiki/7-Zip) format, which is a free general compression tool available for all major operating systems. *Note* that image files which are inherently compressed like jpg, generally do not compress very well inside archives, even using 7zip.

##### How big should you scan?
300 DPI for text, 600 for images. If you are using cameras for scanning, the DPI will depend on how many Mega Pixels (MP) your camera's sensor can capture and how far away your camera is from the page being photographed. You can take a look at this [MP to DPI conversion chart](http://unlikelymoose.com/more/cameras/megapixel_converter.html) for details or keep in mind that a 12MP camera can capture a roughly 14"x10" area at the 300 DPI you want for text. That should be enough for most text-based books to photograph at a distance of 1' or 2'. 


##### A word on destructive scanning

At the beginning, many new book scanners are horrified at the idea of destructive scanning as even a potential option. This is quite understandable since most people who are willing to invest the time to scan a book have a healthy respect and appreciation for books. Many people keep to that respect for the physical object of the book in all cases or work with particularly rare or sentimentally valuable materials where the objects themselves deserve preservation. 

Personally, while I enjoy the physical act of reading paper, most of my books were of interest to me only for their content and I had no interest in storing and caring for cases of paper in order to have that content available to read. Eventually I came to realize that the majority of books I wanted to physically preserve were old paperbacks printed on paper with a high enough acid content that they were literally disintegrating while sitting on the shelf.

You may or may not come to agree with me that destructive scanning can be a form of preservation. Regardless, whether you seek to preserve the physical objects of books or only the content they contain, know that both are common goals in the book digitization community and both positions are welcome.


* always keep your raws!
* compress for archiving (7zip)
qq size range for compressed file size.



### Image processing (Scantailor)

[Scantailor](http://scantailor.org/) describes itself as an:

 > interactive post-processing tool for scanned pages. It performs operations such as page splitting, deskewing, adding/removing borders, and others. You give it raw scans, and you get pages ready to be printed or assembled into a PDF or DJVU file. 

Scantailor's goal is to clean and optimize your page images for OCR and for inclusion in a multi-page pdf or djvu book. Scantailor has automated and semi-automated capabilities to crop your page images, select just the portions of the page with content on them, rotate, deskew, dewarp, and otherwise cleanup common page troubles. Scantailor lets you select just the information from your page scans that you want to keep and trow away the rest. Most of these capabilities work best on pages with only text on them but Scantailor also lets you draw boxes around pictures in your book to preserve all the scan detail in those areas.

The [Scantailor documentation](https://github.com/scantailor/scantailor/wiki) does a good job of explaining the project, including a [Video Tutorial](http://vimeo.com/12524529). The 30 second summary is that you load page images into Scantailor, use each of the different processing tools one by one in order, and then output cleaned and much smaller tiff images for each page. Multiple tools exist to take these Scantailor-processed images, automatically run them through OCR to generate text, and then bind up that text layer and the image files into a single pdf or djvu file with searchable and selectable text.

Two techniques account for just how much smaller and cleaner Scantailor gets your page images: content selecting and bitonal conversion. It is important to understand what is going on with these techniques in order to avoid surprises down the line.

##### Content selection

Content selection is the simplest way to reduce the size of your page images. Images taken with a camera will generally include significant areas around the book that are unnecessary in your final page image. Scantailor will try and automatically select and remove most of this during the `Split Page` step early on. After selecting the page borders Scantailor goes even further in the `Select Content` step and attempts to automatically select only the portions of each page that contain text and images.

The basic idea is that everything else on a page can be discarded and replaced with pure white later on because any non-text or images of the page will only confuse OCR and take up more space in the final file than pure white pixels will. Effectively Scantailor is taking these content areas and then putting them on new blank pages for you. You select the size of those new pages and the position of the content boxes on those new pages in the next step `Margins`.

##### Bitonal conversion

After you have run through the `Content Selection` and `Margins` steps on all your pages, the `Output` stage offers the second large cleanup/compression step, and it is a big one. For each page image you are allowed to choose a "Mode" on the left hand side of the screen. If you have ever done some image editing, you can understand these modes as roughly equivalent to colorspaces.

The default mode, "Black and White" takes all the pixels in your image and converts them either to pure white or pure black. This is equivalent to the image processing step known as "thresholding". The result is that text borders are made very sharp, uneven lightning effects are generally removed, and the file size is hugely decreased. Images made of only pure white and black, called bitonal images, can be represented using much less information than ones with complex colors and shades but many kinds of detail can be effected.

This step is where the biggest tradeoffs are going to come for your images. If images are too poorly lit or there are too many marks on a page, you may lose definition on some of the page writing. Generally, the better your scans, the less you will lose during this stage. If things get particularly bad, you may need to re-scan some of your pages or you may need to switch to a different page mode and make due with larger file size results.  

`Color / Grayscale` mode will preserve all of the details in your original page images. While this means that you can preserve every detail, it also means that you will preserve every defect. All that extra information will make your final files larger and much less clear. Ideally you would only do this for individual pages with illustrations or other fine detail.

`Mixed` mode allows you to get the best of both worlds. You can mark certain portions of the page as picture areas. Scantailor will apply the `Color / Greyscale` mode to just those areas and the `Black and White` mode to rest of the page. If you have a book with pictures in it, this is the mode to use.

**Important**: Always keep your scantailor project file! I encourage you to save all of your intermediate files too, like the scantailor output files, but if you save nothing else, your raw page scans and your scantailor file are enough to regenerate everything else so save them and back them up.

Once you have finished processing all your scan images with scantailor you are ready to author your scantailor output into a single pdf or djvu file. 

### Book file authoring

Why author? No requirement, you can read books as directories of images files if you want. Authoring gives you better tool support (gallery apps are generally less useful for reading than document readers), the ability to add a text layer, metadata, and to compress everything.

Bitonal conversion got us huge savings in image compression but there are actually special methods for compressing books that we will use to get the kind of tiny files from the introduction.

So, how would you compress a book? You create a [concordance](https://en.wikipedia.org/wiki/Concordance_%28publishing%29) for letterforms, a big index off every time each letter shape is used in the book and then, when you are compressing the whole document, you only need to include one copy of each actual letter image plus a long list of places that image should appear in the final version. Being able to store hundreds of identical copies rather than separate images for each one makes for huge file size savings. The more exhaustive the concordance, the better the compression but also the higher the potential for error if the tool you use mistakes certain letters for each other. Generally you can adjust how aggressive each tool is in trying to find matching shapes. Look for instructions on the page for each tool. I go for maximal compression and have selected tools to reduce the likelihood of error. The potential for introduced error in you final document is one more reason to keep the source(!) and intermediate files. 

If you would rather have pixel perfect accuracy than portable file sizes, you can turn off this compression. You can even keep all your images in greyscale/color. See the [Internet Archive's djvus](https://archive.org/details/naturalhistory00seaguoft) as examples. 

##### Authoring formats: pdf vs. djvu

When authoring book files you have two primary formats to choose from: pdf and djvu. Both allow for the same sort of features. Both let you create a multi-page document with an embedded searchable and selectable text layer. The differences tend to boil down to what tools you want to use to create and read the files. 

* PDFs generally have the best tool chain support but may make bigger files. pdfbeads is the tool we will use to create pdfs from Scantailor output.

* Djvu files are generally less memory intensive to read and often come in as smaller files but there are fewer tools that support reading them. For example, have you heard of djvu files before? djvubind is the main tool we will use to make djvu files.

Both pdfbeads and djvubind can use the same free OCR engines: tesseract or cuneiform. Both can also include bookmarks for different chapters and metadata to indicate title, author, and other general information about a book.  The format for these bookmark and metadata files are a little bit different from each other but it is possible to write one file for each and just convert the second copy. Look for the `bookmetaconvert.sh` script in the scripts folder for a working example script.

[qq] Example of metadata and bookmarks files.

### Linux utilities

In addition to the direct book scanning and authoring tools, there are a handful of general linux utilities that make working with image and pdf files much easier. These include: 

   a) pdftk
   b) ImageMagick
   c) 7zip

All of these tools are command line ones that are particularly useful for scripts and other kinds of bulk processing. Take a look at the files for each tool for details. 

##### What is the command line?

The command line is a text based interface to your computer that let's you interact with and control your computer by typing rather than clicking your mouse? By allowing you to control your computer with text the command line makes many powerful operations easy. You can save complex commands and reuse them later on, you can connect multiple programs together, and you can run the same command on multiple files in a row. The `scripts` folder has examples of all three of those uses. 

