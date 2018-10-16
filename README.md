# meteo_dataset
## Introduction
C'est un peu mon ML100
Comment utiliser l'exemple le plus idiot permet tout de même d'apprendre les réseaux de neurones. 

### Quel est le principe et pourquoi c'est idiot ?
Le principe est de déduire la saison en indiquant la température.
C'est évident, la techno/solution est mal adaptée, le degré d'incertitude est énorme.
L'efficacité sera proche de l'aléatoire.
Bref, c'est inutile!

### Pourquoi c'est tout de même intéressant ?
Pour apprendre
* Trouver les données (datasets)
* Sélectionner les bonnes données (ajouter les heures de mesures pour améliorer le modèle en prenant en compte l'ampliture diurne)) 
* Nettoyer les données et les préparer (data cleaning et data prep)
* Préparation de l'environnement (Environment setup, Python virtualenv/pyenv/conda headache) et ainsi apprendre et raffraîchir ses connaissances 
* caler les données (NORMALISER)
* Construire le modèle (Keras model)
* Le sauvegarder et le réutiliser
* avoir un jeu de test
* prédire
* embarquer le modèle dans une page web (Tensorflow.js)


TODO : 
* compléter les analyses de données
* faire une repréentation en 3D avec matplotlib
* mélanger les données
* /!\ jouer avec les fonctions d'objectif (perte) 
* Une application PWA 
* Utiliser les services en ligne GCP ou AWS Lambda
* S'attaquer à vrai problème utile

## Installation
Prévoir de l'espace sur votre disque car les datasets sont volumineux et les scripts ne sont pas optimisés.
Sur MacOS, installer conda (Anaconda) pour éviter les casses-têtes avec Homebrew et pyenv.
installer keras et jupyter.

Lancer le script shell get-meteo.sh :
`source get-meteo.sh`
puis lancer jupyter
`jupyter notebook`
puis chargez le fichier 'meteo-idiote.ipynb'
changer la température et l'heure 
`
Temperature=10.
Heure=30000.
`
enfin lancez tous le notebook.
