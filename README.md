# AWEC 20xx Book of Abstracts and Program
Latex sources of the book of abstracts and program of the nth international Airborne Wind Energy Conference (AWEC 20xx) to be held in City dd-dd mm yyyy.

## Important points

* LFS content needs to be pushed with this command `git lfs push origin master --all`to the remote repository.
* Recursive search with omission of submissions folder via `grep -r --exclude-dir=submissions --include=*.{tex,bib} xyz .`
* Fullpage photo material must have an aspect ratio of **216 X 154** to account for the **3 mm** bleed margin which is cut away for printing in A5 (210 mm X 148 mm) format. For the online version of the book we crop this bleed margin digitally.
* We can not have more than **11 theme sections** (excluding the standard sections) in the book. In the Latex code these are denoted as sessions, however, they do not have to be the sessions that we use in the conference. **Is this still up to date?**

## Submitted material
The raw material provided by abstract authors, either standalone Latex sources or MS Word or OpenOffice files, is collected in directory `submissions/`. This material is stored as [LFS content](https://bitbucket.org/rschmehl/awec2019boa/admin/lfs/file-management/). It is not under version control using [git Large File Storage (LFS)](https://confluence.atlassian.com/bitbucketserver/working-with-git-lfs-files-970595880.html).

In addition to the abstracts we also collect separate photo material. This material is deposited in the subfolder `photopages/`. Because this is often coming from institutions with multiple abstracts we collect it in subfolders indicating the origin of the material.

## Book content

The book is composed of a cover page, front matter (program/table of content, welcome note, etc), abstracts, separate photo pages and back matter (index, photo credits, etc).

### Front matter

The editorial preface is placed in folder AWEC00 and is derived from the abstract format. Other front matter, such as welcome notes etc, may be included in folder `AWECyy` where yy starts at 0A.

### Abstracts

Each abstract is located in a folder `AWECxx` where xx is starting at 01. The contributed abstracts are grouped by different themes which are color coded and also specified in the table of contents of the book. Aside of the entry in table of contents the themes are not listed, i.e. there are no extra pages introducing the themes.

#### Speaker photo

Use square format and maximize face area, such as done here:

![Firstname lastname](README/firstname_lastname.jpg?raw=true)

The photo is included with a width of 3 cm, which for 600 dpi requires an image size of **700 x 700 px**.

#### Speaker position and affiliation

Mention the professional position of the speaker and the company or university.

#### Speaker address

#### Speaker contact data

Professional email and website.

#### Speaker logo

Only the logos associated with the speaker should be included. Logos should be included in vector quality.

#### Abstract titles

#### Author, co-authors and affiliations

When listing the names of authors and co-authors we use the `\index{}` command to specify the names for the index, using a lastname, firstname order. This index is auto-generated. We append a `|textbf` to the entry of the presenting author to typeset this page number in the index in bold.

#### Abstract columns

Images that are included inline should have a horizontal resolution of **1535 px** to meet the 600 dpi requirement for printing. For simplicity this book of abstracts uses a hand-coded short bibliography per abstract rather than a central bib file.

#### Check list

* Set the label in line 1, e.g. `\label{awec:75-weber}` for reference by the index. The label is composed of abstract ID and the last name of the presenting author.
* About 10 lines down is the label for the presenter photo, e.g. `\label{photo:jweber}`. This label is composed of the first initial and the last name of the author. Not sure whether we actually use these labels anywhere...
* The `\index{Weber, Jochem|textbf}` command for the authors below the specification of the title is used for buidling the index. The presenting author has a `|textbf` appended to render the page number in bold font. Co-authors that are not presenting are indexed without the `|textbf` attribute, e.g. `\index{Schmehl, Roland}`.
* Email addresses and URLs should be hyperlinked by using the `\href{}{}` command. For example `\href{mailto:jochem.weber@nrel.gov}{jochem.weber@nrel.gov}` and `\href{http://www.nrel.gov}{www.nrel.gov}`.
* Check if title of abstract matches with the title in the conference program, which is programmed in folder `schedule`. The titles in the program are leading (except for abbreviations, that should be spelled out on the abstract page). Note that the titles are only listed in the separate program, not in the book-integrated program/table of contents.

### Separate image material (photo pages)

The full page photos and the embedding Latex source files are in folder `photopages/`. The embedding Latex source files are using the institution name and a number xx, starting at 01. The photos themselves are in the subfolder `figures` and embedded in Latex files.

#### Format

The aspect ratio 216 x 154 at highest resolution should be used. This aspect ratio is required for the page format A5 landscape (210 mm x 148 mm) and 3 mm bleed margin to allow printing and cutting to A5 landscape format (for the online version of the book, the bleed margin is cut away digitally). Photos should be in A5 landscape format plus 3 mm external bleed margin, which leads to a size of 216 mm X 154 mm. To meet a resolution of 600 dpi the images should be **5102 x 3638 px**, for 300 dpi (the minimum) the size should be 2551 x 1819 px.

#### Caption
The caption is positioned differently for printed and online version of the book. This is done with the Latex command `\photocaption` which takes 7 arguments (see comments in the Latex source code for more details about positioning of captions and font color). To underlay a gray transparent box the caption texts can be enclosed in a `\colorbox{lightgray}{caption text}`. This box is suitable only for captions that fit a single line. To underlay a gray transparent box for multiline captions the command `\captionbox{70mm}{white}{black}{0.5}{caption text}` can be used.

#### credits

To add photo credits in the back matter of the book each photo page defines a label `\label{photo:xxxx}`, where xxxx is replaced by the identifier of the photo.

## Producing the booklet

### Producing the PDF for online use

The online version is different from the print version in the following aspects.

* The circumferential bleed margin of 3 mm is cut off "digitally" by including `\setlength{\bleed}{0mm}` in file `book.tex`
* The figure captions are all right-aligned,
* The front and back covers are added as separate documents, coverfront.pdf and coverback.pdf, in directory cover. Because the document size is set to A5 landscape make sure to explicitly **add a bleed margin of 3 mm** when exporting the PDFs from Inkscape! The same holds for derived files, like cover_white.pdf in directory `preface/figures`
* The archive format PDF/A is used by including `\usepackage[a-1b]{pdfx}` in file `settings.tex`

### Producing the PDF for printing

* The circumferential bleed margin of 3 mm is retained by including `\setlength{\bleed}{3mm}` in file `book.tex`. The print shop cuts the margin off "physically" after printing and binding,
* The figure captions are left-aligned for left left pages and right-aligned for right pages,
* The cover pages are provided to the print shop as a separate PDF spanning the back cover, back of the book and front cover. The back of the book needs to be calculated from a formula based on the number of pages. The current value is for the AWEC 2015 book of abstract and might need to be adjusted.
* No need for archive format PDF/A
* hyperlinks should be printed in black (set option hidelinks=true for package hyperref)

## Final quality check

The following checks should be done to generate a consistent layout

* Titles use capitalization of first letters
* Job titles use capitalization of first letters
* No extra space below bottom logo
* No space between footnote index and affiliation, find it with  `grep -r --include=*.tex "1$ " .`
* Are all photos dated? Get date by `exiftool -time:all file.jpg`
* References consistently implemented?
* Replace HWN500 by "Airborne Wind Europe"

Use recursive command `grep -r --include=*.tex xyz .` to search for `xyz`

## Producing the separate conference program
Use pdflatex on file programme.tex to generate the conference programme (file programme.pdf).
