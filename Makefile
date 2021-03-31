# Variables
CONTAINER = vuejs

# Règles
all: help

help:
	@echo ""
	@echo "    [GESTION DES CONTENEURS]"
	@echo "        build     :    Construit l'image docker node:vuejs"
	@echo ""
	@echo "        install   :    Installe les dépendences du projet via npm"
	@echo ""
	@echo "        prepare   :    Construit l'image docker node:vuejs et installe les dépendences du projet via npm"
	@echo ""
	@echo "        start     :    Démarre les conteneurs avec docker-compose"
	@echo ""
	@echo "        stop      :    Arrête les conteneurs avec docker-compose"
	@echo ""
	@echo "        restart   :    Redémarre les conteneurs avec docker-compose"
	@echo ""
	@echo "        logs      :    Lit en continu les logs du conteneur spécifié"
	@echo "                         Uilisation : make logs => logs du conteneur vuejs"
	@echo "                                      make logs CONTAINER=jenkins => logs du conteneur jenkins"
	@echo ""
	@echo "        bash      :    Exécute une ligne de commande bash intéractive dans le conteneur spécifié"
	@echo "                         Uilisation : make bash => bash dans le conteneur vuejs"
	@echo "                                      make bash CONTAINER=jenkins => bash dans le conteneur jenkins"
	@echo ""
	@echo "    [PROJET]"
	@echo "        jest      :    Exécute les tests et génère la couverture de code"
	@echo ""
	@echo "    [CONTENEURS DISPONIBLES]"
	@echo "        - vuejs   :    Serveur Nodejs pour l'application Vue.js"
	@echo "        - jenkins :    Service Jenkins"
	@echo "        - scm     :    Service SCM Manager"
	@echo ""

build:
	docker image build --no-cache --file vue.Dockerfile --tag node:vuejs ./

install:
	docker run --rm --volume "$PWD/:/app/" node:vuejs npm install

prepare: build install

start:
	docker-compose up --detach

stop:
	docker-compose down

restart: stop start

logs:
	docker logs --follow $(CONTAINER)

bash:
	docker exec --interactive --tty $(CONTAINER) bash

jest:
	docker exec vuejs jest --coverage --reporters=default --reporters=jest-junit
