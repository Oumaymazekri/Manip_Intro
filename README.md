README - Déploiement d’un CV One Page

- 📌 Introduction

Ce document décrit étape par étape le processus de création, conteneurisation et déploiement d’un CV One Page utilisant HTML5/CSS3, GitHub Pages, Docker, Docker Compose et Kubernetes via K3s. Il est destiné à servir de guide complet pour reproduire le projet sur votre propre environnement.

🧩 Partie 1 : Déploiement local et GitHub

Étape 1 : Création du CV HTML/CSS

Créez un fichier `index.html` contenant les informations de votre CV (profil, compétences, expériences, etc.) et un fichier `style.css` pour le design. Testez localement dans votre navigateur.

Étape 2 : Initialisation du dépôt Git

Commandes :

git init

git add .

git commit -m "Version 1"

Étape 3 : Création de la branche dev

Commande :

git checkout -b dev

Étape 4 : Déploiement sur GitHub Pages

Commandes :

git remote add origin https://github.com/USERNAME/USERNAME.github.io.git

git push -u origin main

git push -u origin dev

Étape 5 : Documentation dans README.md

Ajoutez les étapes et captures dans le fichier README.md.

Étape 6 : Création du Dockerfile

Contenu du fichier :

FROM nginx:alpine

COPY . /usr/share/nginx/html

Étape 7 : Construction de l’image Docker

Commande :

docker build -t moncv:v1 .

Étape 8 : Tag et push vers Docker Hub

Commandes :

docker login

docker tag moncv:v1 DockerHubUsername/cv:v1

docker push DockerHubUsername/cv:v1

![Image poussée sur Docker Hub!!](image-1.png)

Étape 9 : Création du fichier docker-compose.yml

Contenu :

version: '3'

services:

cv:

image: DockerHubUsername/cv:v1

ports:

- "8005:80"

[Fichier docker-compose.yml !](image-2.png)

Étape 10 : Déploiement local avec Docker Compose

Commande :

docker-compose up -d

Étape 11 : Test dans le navigateur

Accédez à : http://localhost:8005

 ![CV affiché dans le navigateur !](image-3.png)

## ☁️ Partie 2 : Déploiement sur K3s

Étape 1 : Création de 3 VM Ubuntu Server 24.04

Utilisez Hyper-V pour créer 1 master et 2 workers.



Étape 2 : Installation de K3s

Sur le master :

curl -sfL https://get.k3s.io | sh -

!

Sur les workers :

curl -sfL https://get.k3s.io | K3S_URL=https://IP_MASTER:6443 K3S_TOKEN=TOKEN sh -



Étape 3 : Configuration de kubectl

Commande :

scp user@master:/etc/rancher/k3s/k3s.yaml ~/.kube/config



Étape 4 : Création des fichiers cv-deployment.yaml et cv-service.yaml



Étape 5 : Déploiement sur K3s

Commandes :

kubectl apply -f cv-deployment.yaml

kubectl apply -f cv-service.yaml



Étape 6 : Test dans le navigateur

Accédez à : http://IP_WORKER:8006

