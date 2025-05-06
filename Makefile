# Variables
DOCKER_COMPOSE = docker compose
# Variables for images
FRONTEND_IMAGE=my-frontend-test
BACKEND_IMAGE=my-backend-test

# Default target: all
all: install test build run

# Installation
install:
	# Install dependencies (Docker, Maven, JDK)
	sudo apt-get update
	sudo apt-get install -y default-jdk maven ca-certificates curl
	# Install Docker
	sudo install -m 0755 -d /etc/apt/keyrings
	sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
	sudo chmod a+r /etc/apt/keyrings/docker.asc
	echo \
	  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
	  $$(. /etc/os-release && echo "$${UBUNTU_CODENAME:-$$VERSION_CODENAME}") stable" | \
	  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
	sudo apt-get update
	sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Test for installed dependencies
test--packages:
	@echo "Testing Dependencies..."
	@command -v docker > /dev/null && echo "Docker is installed" || echo "Docker is missing"
	@command -v mvn > /dev/null && echo "Maven is installed" || echo "Maven is missing"
	@command -v java > /dev/null && echo "Java is installed" || echo "Java is missing"
	@command -v npm > /dev/null && echo "npm is installed" || echo "npm is missing"

# Build and run the frontend
test--frontend:
	@echo "Building and running frontend..."
	docker build -t $(FRONTEND_IMAGE) -f frontend/Dockerfile . --debug
	docker run -p 3000:3000 $(FRONTEND_IMAGE) /bin/bash

# Build and run the backend
test--backend:
	@echo "Building and running backend..."
	docker build -t $(BACKEND_IMAGE) -f backend/Dockerfile . --debug
	docker run -p 8080:8080 $(BACKEND_IMAGE) /bin/bash

# Build
build:
	$(DOCKER_COMPOSE) build

# Run
run:
	$(DOCKER_COMPOSE) up

# Run W/o Cache
run--no-cache:
	$(DOCKER_COMPOSE) build --no-cache
	$(DOCKER_COMPOSE) up

# Clean
clean:
	$(DOCKER_COMPOSE) down
