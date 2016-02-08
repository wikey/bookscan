*[Return to Introduction](https://github.com/wikey/bookscan/blob/master/documentation/README.md)*

# Scanning (getting the page images)

While there are a number of different ways you can go about capturing images of your book pages, the characteristics of a good page image are the same regardless of how you capture it. Ideal page images are:

 * completely flat with no warping at the spine
 * in an uncompressed image format (TIFF or RAW)
 * evenly lit across the page with enough light to preserve color accuracy
 * at a high enough resolution for [Optical Character Recognition](https://en.wikipedia.org/wiki/Optical_character_recognition) (OCR) *See `How big should you scan?` secion below* 

Different scanning methods have their own pros and cons when it comes to producing these ideal page images. The three main methods are: destructive scanning (physically removing pages from their binding), flatbed scanning (pressing a book against a copier), and camera-based scanning (using a camera mount to flatten pages while taking pictures of them). Which method you use will depend on various factors including time, money, available equipment, durability or rarity of the source material, and others. Let's look at each in turn.


### Destructive (USB scanner)

Destructive scanning involves removing the pages from their binding, generally by cutting the binding off or, *carefully*, ripping pages out individually. Once pages are removed from the binding they can be fed through a USB or standalone sheet-fed scanner. This method produces the most ideal page images.
        Pros: Lighting is perfect, pages are flat, faster than flatbed (~1000-1200 pages/hour), general purpose scanner you can use for other tasks, pages are recyclable, you no longer have books afterwards.
       Cons: You no longer have book afterwards, you need to remove spine (rip, cut, pay someone else), you may need to flip through sheets to verify separation or risk page tearing while scanning. 

### Flatbed

Flatbed scanning generally involves pressing an open book against a flatbed scanner to copy a two page spread. Some specialty book flatbed scanners exist that allow for flat single page scans, not that these are generally more expensive and at least twice as slow as the following estimates. 
        Pros: Widely available, does not destroy book.
        Cons: Cumbersome and slower than other means of scanning (~500-600 pages/hour), page images are severely warped at binding,  damages spine.

### Camera mount-based scanning

([bookliberator](http://bookliberator.com/),[diybookscanner](http://diybookscanner.org/), et al).

   Camera based scanning involves taking pictures of individual book pages using standard digital cameras. This is generally accomplished through use of special camera mounts that flatten the pages opposite from the camera to eliminate page curvature. A handful of versions are available commercially but most are do it yourself projects of varying complexity.
       Pros: Easy on books, faster than flatbed (~900-1200 pages/hour), page images have little or no warping at the spine. Cool.
       Cons: More DIY effort required, custom equipment to build/buy, have to control lighting, may require more effort to operate, may only produce compressed jpg images.

If this is your first time scanning a book I suggest using the whatever equipment you can find already available to you. The more you scan books, the better you will understand the considerations that are most important to you and be able to decide what more specialized tools will work best in your situation.

However you capture page images, do yourself a favor and **keep your unprocessed image files** in whatever format you get them from your scanner or camera. While your ideal images will not use a compressed image format like jpg, once you have the files you can absolutely add them to a zip or other compressed archive. I keep all my image archives in  [7zip](https://en.wikipedia.org/wiki/7-Zip) format, which is a free general compression tool available for all major operating systems. *Note* that image files which are inherently compressed like jpg, generally do not compress very well inside archives, even using 7zip.

### How big should you scan?
300 DPI for text, 600 for images. If you are using cameras for scanning, the DPI will depend on how many Mega Pixels (MP) your camera's sensor can capture and how far away your camera is from the page being photographed. You can take a look at this [MP to DPI conversion chart](http://unlikelymoose.com/more/cameras/megapixel_converter.html) for details or keep in mind that a 12MP camera can capture a roughly 14"x10" area at the 300 DPI you want for text. That should be enough for most text-based books to photograph at a distance of 1' or 2'. 


### A word on destructive scanning

At the beginning, many new book scanners are horrified at the idea of destructive scanning as even a potential option. This is quite understandable since most people who are willing to invest the time to scan a book have a healthy respect and appreciation for books. Many people keep to that respect for the physical object of the book in all cases or work with particularly rare or sentimentally valuable materials where the objects themselves deserve preservation. 

Personally, while I enjoy the physical act of reading paper, most of my books were of interest to me only for their content and I had no interest in storing and caring for cases of paper in order to have that content available to read. Eventually I came to realize that the majority of books I wanted to physically preserve were old paperbacks printed on paper with a high enough acid content that they were literally disintegrating while sitting on the shelf.

You may or may not come to agree with me that destructive scanning can be a form of preservation. Regardless, whether you seek to preserve the physical objects of books or only the content they contain, know that both are common goals in the book digitization community and both positions are welcome.


* always keep your raws!
* compress for archiving (7zip)
qq size range for compressed file size.

*[Continue to Post-processing](https://github.com/wikey/bookscan/blob/master/documentation/post-processing.md)*
