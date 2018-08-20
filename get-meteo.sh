#!usr/local/bin/zsh

for ((annee = 2008; annee < 2018; annee++)) ; 
do 
	for mois in $(seq -w 01 12) ;
	do
		wget -P dataset "https://donneespubliques.meteofrance.fr/donnees_libres/Txt/Synop/Archive/synop.${annee}${(l(2)(0))mois}.csv.gz" ; 
	done 
done
cd dataset
gunzip *
cat synop.20* > meteo-bigdata.csv
rm -f synop.20*
cat meteo-bigdata.csv|cut -d ';' -f 8,2 > meteo-bigdata-shrinked.csv
awk  -F";" '{print $2 ";" $1}' meteo-bigdata-shrinked.csv > meteo-bigdata-shrinked-switched.csv
head -1 meteo-bigdata-shrinked-switched.csv > header.csv
grep -v 't;date' meteo-bigdata-shrinked-switched.csv > meteo-bigdata-shrinked-switched-clean.csv
cat header.csv meteo-bigdata-shrinked-switched-clean.csv > meteo-bigdata-shrinked-switched-clean-withheader.csv

