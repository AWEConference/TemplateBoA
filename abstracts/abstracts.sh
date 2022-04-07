#!/bin/bash
#
# This script uses qpdf to cut the PDF into the individual abstracts
#
# Agressively compress the PDF (image quality really bad)
# gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/screen -dNOPAUSE -dQUIET -dBATCH -sOutputFile=book-online.pdf book.pdf
#
# Less agressively compress (image quality acceptable for screen use)
# gs -q -dNOPAUSE -dBATCH -dSAFER -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook -dEmbedAllFonts=true -dSubsetFonts=true -dAutoRotatePages=/None -dColorImageDownsampleType=/Bicubic -dColorImageResolution=150 -dGrayImageDownsampleType=/Bicubic -dGrayImageResolution=150 -dMonoImageDownsampleType=/Bicubic -dMonoImageResolution=150 -sOutputFile=book-online.pdf book.pdf

cut () {
    gs -quiet -q -dBATCH -dNOPAUSE -sDEVICE=pdfwrite -dPDFSETTINGS=/prepress -dFirstPage=$1 -dLastPage=$2 -sOutputFile=$3 ../book-online.pdf
}

cutloop () {
   let "p1=p2"
   p2=p1
   for i in $(eval echo "{$1..$2}")
   do
   let "p1 = p2 + 1"
   let "p2 = p1 + ${pages[i]} - 1"
   echo $p1 , $p2 , ${name[i]}
   cut $p1 $p2 ${name[i]}
   done
}

# Frontmatter
cut   1   2 coverfront.pdf
cut   3   4 titlepage.pdf
cut   5   6 schedule.pdf
cut   7   9 welcome.pdf
cut  10  13 sponsors-committees.pdf
p2=13

gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=frontmatter.pdf titlepage.pdf schedule.pdf sponsors-committees.pdf

# Plenary talks
pages[1]=8;  awec[1]=59;  name[1]="ch01_awec${awec[1]}_Sieberling.pdf"          # Ampyx
pages[2]=14; awec[2]=81;  name[2]="ch02_awec${awec[2]}_McLeod.pdf"              # Makani
pages[3]=1;  awec[3]=84;  name[3]="ch03_awec${awec[3]}_Philibert.pdf"           # IEA
pages[4]=1;  awec[4]=83;  name[4]="ch04_awec${awec[4]}_Fagiano.pdf"             # Polimi
cutloop 1 4

# Blyth Tuesday morning
pages[5]=6;  awec[5]=48;  name[5]="ch05_awec${awec[5]}_Breuer.pdf"              # Kitepower
pages[6]=1;  awec[6]=03;  name[6]="ch06_awec${awec[6]}_Carnel.pdf"              # Kitemill
pages[7]=1;  awec[7]=42;  name[7]="ch07_awec${awec[7]}_Kruijff.pdf"             # Ampyx
pages[8]=2;  awec[8]=60;  name[8]="ch08_awec${awec[8]}_Stough.pdf"              # Windlift
cutloop 5 8

# Wilson Tuesday morning
pages[9]=1;   awec[9]=72;   name[9]="ch09_awec${awec[9]}_Ahbe.pdf"              # ETHZ
pages[10]=1;  awec[10]=14;  name[10]="ch10_awec${awec[10]}_Fujii.pdf"           # TMIT
pages[11]=4;  awec[11]=76;  name[11]="ch11_awec${awec[11]}_Oficiadegui.pdf"     # Acciona
pages[12]=3;  awec[12]=21;  name[12]="ch12_awec${awec[12]}_Quack.pdf"           # Skysails
cutloop 9 12

# Cayley Tuesday morning
pages[13]=3;  awec[13]=75;  name[13]="ch13_awec${awec[13]}_Weber.pdf"           # NREL
pages[14]=2;  awec[14]=18;  name[14]="ch14_awec${awec[14]}_Read.pdf"            # Windswept
pages[15]=2;  awec[15]=77;  name[15]="ch15_awec${awec[15]}_Petrick.pdf"         # AWEurope
cutloop 13 15

# Plenary OEM 1 Panel
pages[16]=8;  awec[16]=08;  name[16]="ch16_awec${awec[16]}_Peschel.pdf"         # Kitepower
pages[17]=1;  awec[17]=55;  name[17]="ch17_awec${awec[17]}_Harklau.pdf"         # Kitemill
cutloop 16 17

# Poster 1
pages[18]=1;  awec[18]=65;  name[18]="ch18_awec${awec[18]}_Itakura.pdf"         # Toyota
pages[19]=2;  awec[19]=64;  name[19]="ch19_awec${awec[19]}_Fechner.pdf"         # Aenarete
pages[20]=2;  awec[20]=51;  name[20]="ch20_awec${awec[20]}_Rementeria.pdf"      # Cranfield
pages[21]=1;  awec[21]=25;  name[21]="ch21_awec${awec[21]}_LePense.pdf"         # KPS
pages[22]=3;  awec[22]=29;  name[22]="ch22_awec${awec[22]}_Morvan.pdf"          # ENSTA Bretagne
pages[23]=1;  awec[23]=71;  name[23]="ch23_awec${awec[23]}_Listov.pdf"          # EPFL
pages[24]=1;  awec[24]=05;  name[24]="ch24_awec${awec[24]}_Salari.pdf"          # Uni Limerick
pages[25]=1;  awec[25]=01;  name[25]="ch25_awec${awec[25]}_Dumon.pdf"           # Gipsa Lab
pages[26]=1;  awec[26]=12;  name[26]="ch26_awec${awec[26]}_Tveide.pdf"          # Kitemill
pages[27]=1;  awec[27]=13;  name[27]="ch27_awec${awec[27]}_Okubo.pdf"           # Kanagawa Inst. Techn.
pages[28]=1;  awec[28]=46;  name[28]="ch28_awec${awec[28]}_Leuthold.pdf"        # Uni Freiburg
pages[29]=1;  awec[29]=67;  name[29]="ch29_awec${awec[29]}_Mortimer.pdf"        # Wood
pages[30]=1;  awec[30]=53;  name[30]="ch30_awec${awec[30]}_Fernandes.pdf"       # Uni Porto
pages[31]=4;  awec[31]=73;  name[31]="ch31_awec${awec[31]}_Bosman.pdf"          # DSM
pages[32]=1;  awec[32]=39;  name[32]="ch32_awec${awec[32]}_DeSchutter.pdf"      # Uni Freiburg
cutloop 18 32

# Blyth Tuesday afternoon
pages[33]=1;  awec[33]=43;  name[33]="ch33_awec${awec[33]}_Schelbergen.pdf"     # TU Delft
pages[34]=1;  awec[34]=17;  name[34]="ch34_awec${awec[34]}_Bechtle.pdf"         # Uni Bonn
pages[35]=1;  awec[35]=47;  name[35]="ch35_awec${awec[35]}_Sommerfeld.pdf"      # Uni Victoria
cutloop 33 35

# Wilson Tuesday afternoon
pages[36]=1;  awec[36]=37;  name[36]="ch36_awec${awec[36]}_Haas.pdf"            # KU Leuven
pages[37]=1;  awec[37]=33;  name[37]="ch37_awec${awec[37]}_Brodrick.pdf"        # KPS
pages[38]=1;  awec[38]=31;  name[38]="ch38_awec${awec[38]}_Bonnin.pdf"          # Ampyx Power
cutloop 36 38

# Airspace & Regulation panel
pages[39]=1;  awec[39]=78;  name[39]="ch39_awec${awec[39]}_Petrick.pdf"         # AWEurope
cutloop 39 39

# Plenary OEM 2 Panel
pages[40]=3;  awec[40]=79;  name[40]="ch40_awec${awec[40]}_Bormann.pdf"         # Enerkite
pages[41]=5;  awec[41]=16;  name[41]="ch41_awec${awec[41]}_Luchsinger.pdf"      # Luchsinger
cutloop 40 41

# Poster 2
pages[42]=2;  awec[42]=62;  name[42]="ch42_awec${awec[42]}_Perlberger.pdf"      # Brainwhere
pages[43]=1;  awec[43]=80;  name[43]="ch43_awec${awec[43]}_Zywietz.pdf"         # Enerwhere
pages[44]=1;  awec[44]=06;  name[44]="ch44_awec${awec[44]}_Endo.pdf"            # Niihama-Kosen
pages[45]=1;  awec[45]=20;  name[45]="ch45_awec${awec[45]}_Oland.pdf"           # Kitemill
pages[46]=1;  awec[46]=82;  name[46]="ch46_awec${awec[46]}_Nam.pdf"             # Toyota Research Inst.
pages[47]=2;  awec[47]=07;  name[47]="ch47_awec${awec[47]}_Narikawa.pdf"        # University of Fukui
cutloop 42 47

# Blyth Wednesday
pages[48]=2;  awec[48]=56;  name[48]="ch48_awec${awec[48]}_Cobb.pdf"            # NC State University
pages[49]=1;  awec[49]=11;  name[49]="ch49_awec${awec[49]}_Malz.pdf"            # Chalmers
pages[50]=1;  awec[50]=52;  name[50]="ch50_awec${awec[50]}_Trevisi.pdf"         # DTU
pages[51]=1;  awec[51]=35;  name[51]="ch51_awec${awec[51]}_Aull.pdf"            # Windlift
pages[52]=1;  awec[52]=69;  name[52]="ch52_awec${awec[52]}_Vallejo.pdf"         # Naturalpower
pages[53]=1;  awec[53]=45;  name[53]="ch53_awec${awec[53]}_Rapp.pdf"            # TU Delft
pages[54]=1;  awec[54]=38;  name[54]="ch54_awec${awec[54]}_Houle.pdf"           # Twingtec
pages[55]=1;  awec[55]=15;  name[55]="ch55_awec${awec[55]}_Rickner.pdf"         # Makani
pages[56]=1;  awec[56]=04;  name[56]="ch56_awec${awec[56]}_Kheiri.pdf"          # Concordia Uni
pages[57]=2;  awec[57]=26;  name[57]="ch57_awec${awec[57]}_Fasel.pdf"           # ETHZ
pages[58]=1;  awec[58]=44;  name[58]="ch58_awec${awec[58]}_Candade.pdf"         # Enerkite
pages[59]=3;  awec[59]=36;  name[59]="ch59_awec${awec[59]}_Thedens.pdf"         # Skysails
cutloop 48 59

# Wilson Wednesday
pages[60]=1;  awec[60]=22;  name[60]="ch60_awec${awec[60]}_Rueger.pdf"          # Uni Bonn
pages[61]=1;  awec[61]=24;  name[61]="ch61_awec${awec[61]}_Sanchez.pdf"         # UC3 Madrid
pages[62]=1;  awec[62]=09;  name[62]="ch62_awec${awec[62]}_Dief.pdf"            # Kyushu Uni
pages[63]=3;  awec[63]=32;  name[63]="ch63_awec${awec[63]}_Battig.pdf"          # ETHZ
pages[64]=4;  awec[64]=66;  name[64]="ch64_awec${awec[64]}_Fagiano.pdf"         # Polimi
pages[65]=1;  awec[65]=02;  name[65]="ch65_awec${awec[65]}_Schanen.pdf"         # Gipsa Lab
pages[66]=1;  awec[66]=19;  name[66]="ch66_awec${awec[66]}_Oland.pdf"           # Kitemill
pages[67]=2;  awec[67]=41;  name[67]="ch67_awec${awec[67]}_Williams.pdf"        # Ampyx
pages[68]=2;  awec[68]=28;  name[68]="ch68_awec${awec[68]}_Beaupoil.pdf"        # someAWE
pages[69]=4;  awec[69]=50;  name[69]="ch69_awec${awec[69]}_Bauer.pdf"           # kiteKraft
pages[70]=1;  awec[70]=54;  name[70]="ch70_awec${awec[70]}_DeSchutter.pdf"      # Uni Freiburg
pages[71]=1;  awec[71]=40;  name[71]="ch71_awec${awec[71]}_Williams.pdf"        # Ampyx
cutloop 60 71

# Caley Wednesday
pages[72]=1;  awec[72]=70;  name[72]="ch72_awec${awec[72]}_Gunn.pdf"            # RWE Renewables
pages[73]=1;  awec[73]=74;  name[73]="ch73_awec${awec[73]}_Frost.pdf"           # BVG Associates
pages[74]=1;  awec[74]=58;  name[74]="ch74_awec${awec[74]}_Bourgault.pdf"       # New Leaf Management
pages[75]=1;  awec[75]=61;  name[75]="ch75_awec${awec[75]}_Folkersma.pdf"       # TU Delft
pages[76]=2;  awec[76]=34;  name[76]="ch76_awec${awec[76]}_Tulloch.pdf"         # Uni Strathclyde
pages[77]=1;  awec[77]=57;  name[77]="ch77_awec${awec[77]}_Gaunaa.pdf"          # DTU
cutloop 72 77

# Backmatter
pages[78]=2;  name[78]="authorindex.pdf"
pages[79]=1;  name[79]="photocredits.pdf"
pages[80]=1;  name[80]="archive.pdf"
pages[81]=2;  name[81]="coverback.pdf"
cutloop 78 81

gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -sOutputFile=backmatter.pdf authorindex.pdf photocredits.pdf archive.pdf
