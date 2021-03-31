# Variables
JEST_DIR = build/coverage/jest

# Règles

all: help

help:
	@echo ""
	@echo "    [GESTION DES CONTENEURS]"
	@echo "        build   :    Construit l'image docker node:vuejs"
	@echo ""
	@echo "        install :    Installe les dépendences du projet via npm"
	@echo ""
	@echo "        prepare :    Construit l'image docker node:vuejs et installe les dépendences du projet via npm"
	@echo ""
	@echo "        start   :    Démarre les conteneurs avec docker-compose"
	@echo ""
	@echo "        stop    :    Arrête les conteneurs avec docker-compose"
	@echo ""
	@echo "        restart :    Redémarre les conteneurs avec docker-compose"
	@echo ""
	@echo "    [Projet]"
	@echo "        jest    :    Exécute les tests et génère la couvertur de code"
	@echo ""


build:
	docker image build --no-cache --file vue.Dockerfile --tag node:vuejs

install:
	docker run --rm --volume "$PWD/:/app/" node:vuejs npm install

prepare: build install

start:
	docker-compose up --detach

stop:
	docker-compose down

restart: stop start

jest:
	docker exec vue_raspberry jest --coverage --coverageDirectory=${JEST_DIR}
