#!usr/local/bin/zsh

##########
#Phase 1 : récupérer les fichiers depuis Meteo France entre 2008 et 2018
##########
for ((annee = 2008; annee < 2018; annee++)) ; 
do 
	for mois in $(seq -w 01 12) ;
	do
		wget -nc -P dataset "https://donneespubliques.meteofrance.fr/donnees_libres/Txt/Synop/Archive/synop.${annee}${(l(2)(0))mois}.csv.gz" ; 
	done 
done
