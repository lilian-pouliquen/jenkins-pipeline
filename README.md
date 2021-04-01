# app-vue

## Sommaire
- [1. Introduction](#1-introduction)
- [2. Prérequis](#2-prrequis)
- [3. Installation du projet](#3-installation-du-projet)
- [4. Structure du projet](#4-structure-du-projet)
- [5. Auteur](#5-auteur)

## 1. Introduction

app-vue est un petit projet Vue.js associé à de l'intégration continue. Cela me permet de mettre en pratique différentes connaissances :

- Le développement en Vue.js
- Les tests unitaires en Vue.js à l'aide de Jest
- L'intégration continue à l'aide de pipelines avec Jenkins

## 2. Prérequis

Les paquets suivants sont nécessaires au fonctionnement du projet :

- [Docker](https://docs.docker.com/get-docker/)
- [docker-compose](https://docs.docker.com/compose/install/)
- Make

## 3. Installation du projet

1. Ouvrir une ligne de commande bash à la racine du projet
2. Entrer les commandes suivantes
    1. `$ make prepare`
    2. `$ make start`
3. Initialiser Jenkins et SCM manager.
4. Les plugins Jenkins nécessaires sont les suivants :
    - Clover
    - Docker
    - Docker API
    - Docker Pipeline
    - Docker Slave
    - HTML Publisher
    - Warnings Next Generation
    - xUnit
5. Initialiser le dépôt SCM Manager et y versionner le code
6. Créer l'authentification de Jenkins pour se connecter à SCM Manager
7. Modifier le Jenkinsfile afin de faire concorder la connexion à SCM Manager
8. Pousser le Jenkinsfile sur le dépôt SCM Manager
9. Créer le pipeline en important le Jenkinsfile depuis SCM
10. Lancer un build

## 4. Structure du projet

```text
app-vue
+-- Public                => fichiers public de l'application
+-- specs                 => scripts de test
+-- src                   => code source de l'application
|
+-- .dockerignore         => liste des éléments à ignorer par docker
+-- .gitignore            => liste des éléments à ignore par git
+-- babel.config.js       => configuration de Babel
+-- jest.config.js        => configuration de Jest
+-- package.json          => configuration npm
+-- package-lock.json     => liste des paquets installés
+-- docker-compose.yml    => fichier de composition Docker
+-- vue.Dockerfile        => fichier de construction de l'image node:vuejs
+-- Makefile              => règles make utilisé pour la gestion des conteneurs du projet
+-- jenkins.Makefile      => règles make utilisé par Jenkins
+-- Jenkinsfile           => pipeline exécuté par Jenkins
+-- README.md             => documentation du projet
```

## 5. Auteur
- Lilian POULIQUEN : [@lilian-pouliquen - github](https://github.com/lilian-pouliquen)