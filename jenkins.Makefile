# Règles
all: install clean test

install:
	npm install

clean:
	@rm -rf build/logs
	@rm -rf build/coverage
	@mkdir -p build/logs
	@mkdir -p build/coverage

test:
	jest --coverage --reporters=default --reporters=jest-junit