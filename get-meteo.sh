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
