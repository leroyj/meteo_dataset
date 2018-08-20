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
#:%s/;20[[:digit:]][[:digit:]]0[123].*$/winter/g
#winter 
sed -i .bkp1 -E 's/;20[[:digit:]][[:digit:]]12[23][[:digit:]].*$/;winter/' meteo-bigdata-shrinked-switched-clean-withheader.csv
sed -i .bkp2 -E 's/;20[[:digit:]][[:digit:]]0[12].*$/;winter/' meteo-bigdata-shrinked-switched-clean-withheader.csv 
sed -i .bkp3 -E 's/;20[[:digit:]][[:digit:]]03[01][[:digit:]].*$/;winter/' meteo-bigdata-shrinked-switched-clean-withheader.csv 
#spring
sed -i .bkp4 -E 's/;20[[:digit:]][[:digit:]]03[23][[:digit:]].*$/;spring/' meteo-bigdata-shrinked-switched-clean-withheader.csv 
sed -i .bkp5 -E 's/;20[[:digit:]][[:digit:]]0[45].*$/;spring/' meteo-bigdata-shrinked-switched-clean-withheader.csv 
sed -i .bkp6 -E 's/;20[[:digit:]][[:digit:]]06[01][[:digit:]].*$/;spring/' meteo-bigdata-shrinked-switched-clean-withheader.csv
#summer 
sed -i .bkp7 -E 's/;20[[:digit:]][[:digit:]]06[23][[:digit:]].*$/;summer/' meteo-bigdata-shrinked-switched-clean-withheader.csv
sed -i .bkp8 -E 's/;20[[:digit:]][[:digit:]]0[78].*$/;summer/' meteo-bigdata-shrinked-switched-clean-withheader.csv 
sed -i .bkp9 -E 's/;20[[:digit:]][[:digit:]]09[01][[:digit:]].*$/;summer/' meteo-bigdata-shrinked-switched-clean-withheader.csv 
#autumn
sed -i .bkpa -E 's/;20[[:digit:]][[:digit:]]09[23][[:digit:]].*$/;autumn/' meteo-bigdata-shrinked-switched-clean-withheader.csv 
sed -i .bkpb -E 's/;20[[:digit:]][[:digit:]]1[01].*$/;autumn/' meteo-bigdata-shrinked-switched-clean-withheader.csv 
sed -i .bkpc -E 's/;20[[:digit:]][[:digit:]]12[01][[:digit:]].*$/;autumn/' meteo-bigdata-shrinked-switched-clean-withheader.csv
