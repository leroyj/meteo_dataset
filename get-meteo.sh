#!usr/local/bin/zsh

##########
#Phase 1 : récupérer les fichiers depuis Meteo France entre 2008 et 2018
##########
for ((annee = 2008; annee < 2018; annee++)) ; 
do 
	for mois in $(seq -w 01 12) ;
	do
		wget -P dataset "https://donneespubliques.meteofrance.fr/donnees_libres/Txt/Synop/Archive/synop.${annee}${(l(2)(0))mois}.csv.gz" ; 
	done 
done
cd dataset
# les décompresser, les concatener et les supprimer
gunzip *
cat synop.20* > meteo-bigdata.csv
#rm -f synop.20*


##########
#Phase 2 : ne conserver que les stations autours de Paris
##########
#ABBEVILLE	07005
#ROUEN-BOOS	07037
#ALENCON	07139
#ORLY	07149
#TOURS	07240
#REIMS-PRUNAY	07072

#sed -i .bkp0 -E 's/^(^07005)|^(^14001)/ d' meteo-bigdata.csv
grep -E '^07005|^07037|^07139|^07149|^07240|^07072' meteo-bigdata.csv > meteo-bigdata.csv

##########
#Phase 3 : ne conserver que les colonnes 2 (Date) et 8 temperature et les inverser
##########
cat meteo-bigdata.csv|cut -d ';' -f 8,2 > meteo-bigdata-shrinked.csv
awk  -F";" '{print $2 ";" $1}' meteo-bigdata-shrinked.csv > meteo-bigdata-shrinked-switched.csv

##########
#Phase 4 : purger les titres de la concatenation des fichiers
##########
#head -1 meteo-bigdata-shrinked-switched.csv > header.csv
grep -v 't;date' meteo-bigdata-shrinked-switched.csv > meteo-bigdata-shrinked-switched-clean.csv
cat ../header.csv meteo-bigdata-shrinked-switched-clean.csv > meteo-bigdata-shrinked-switched-clean-withheader.csv

##########
#Phase 5 : remplacer les dates par les saisons
##########
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

##### : remplacer les saisons par une valeur numérique
sed -E 's/winter/0./' meteo-bigdata-shrinked-switched-clean-withheader.csv >iadata.csv
sed -i -E 's/spring/1./' iadata.csv
sed -i -E 's/summer/2./' iadata.csv
sed -i -E 's/autumn/3./' iadata.csv
### supprimer les mq
#clean mq data
sed -i -E '/^mq;/ d' iadata.csv
mv iadata.csv ..
cd ..

#########
# phase 6 : lancement de la reconnaissance
#########
python3 ai1.py
