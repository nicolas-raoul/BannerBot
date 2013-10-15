#!/bin/bash
# First download dump and adapt below

<enwikivoyage-20131001-pages-articles.xml tr "\n" " " | sed "s/<\/page>/\n/g" | grep -v "<title>Template:" | grep -v "<title>File:" | grep -v "<title>Wikivoyage:" | grep -v "<title>Category:" | grep -v "<title>MediaWiki:" | grep -v "{{disamb}}" | grep -v "redirect title" | grep pagebanner | grep -v "{{pagebanner}}" | grep -v "{{pagebanner }}" > articles-with-banners.txt

cat articles-with-banners.txt | grep -v "{{pagebanner[^}]*[Dd]efault[^}]*}}" | grep -v "{{pagebanner[^}]*TT Banner[^}]*}}" | grep -v "{{pagebanner[^}]*[Gg]eneric[^}]*}}" | grep -v "{{pagebanner[^}]*Itinerary banner[^}]*}}" | grep -v "{{pagebanner[^}]*Welcome banner[^}]*}}" | grep -v "{{pagebanner[^}]*Disambiguation banner[^}]*}}" > articles-with-original-banners.txt

cat articles-with-original-banners.txt | sed -e "s/.*<title>//" | sed -e "s/<\/title>.*{{[Pp]agebanner[ ]*|[ ]*/;/" | sed -e "s/|.*//" | sed -e "s/}}.*//" > original-banners.csv

cat original-banners.csv | grep -e jpg -e jpeg -e png > original-banners-filtered.csv
