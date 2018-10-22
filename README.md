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

## Installation
Sur MacOS, installer conda (Anaconda) pour éviter les casses-têtes avec Homebrew et pyenv.
installer keras et jupyter.

Prévoir de l'espace sur votre disque car les datasets sont volumineux et les scripts ne sont pas optimisés.

### Récupération des données
Lancer le script shell get-meteo.sh :
`source get-meteo.sh`

### Analyse et apprentissage du modèle
Puis lancer jupyter
`jupyter notebook`
puis chargez le fichier 'meteo-idiote.ipynb'
changer la température et l'heure dans l'avant dernier bloc

Quand vos paramètres sont ajustés vous pouvez l'exporter pour l'exploiter dans tensorflowjs.
`tensorflowjs_converter --input_format keras model.h5 ../3-web/tfjsmodel`

### Utilisation du modèle via une application de prédiction
Copier le contenu du répertoire 3-web sur un site web et puis c'est tout.
Le modèle est dans tfjsmodel récupéré par la conversion précédente.

## Références
sources utilisées
* https://codepen.io/karlgroves/pen/riFyn?editors=1100
* https://thekevinscott.com/tensorflowjs-hello-world/ 
aller voir https://codepen.io/Silisav/pen/pybKXV

