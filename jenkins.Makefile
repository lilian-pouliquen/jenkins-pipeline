# Variables
JEST_DIR = build/coverage/jest

# Règles
all: clean test

clean:
	@rm -rf build/logs
	@rm -rf build/coverage
	@mkdir -p build/logs
	@mkdir -p build/coverage

test:
	jest --coverage --coverageDirectory=${JEST_DIR}