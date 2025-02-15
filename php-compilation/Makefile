# Variables
DC=docker compose --file docker-compose.yml
CONTAINER=my-php-compilation
PHP_VERSION=php-8.4.0RC3

.PHONY: up down sh logs compile check-pdo-sqlite-version stop clean

# Build and bring up the container
up:
	$(DC) up -d --build

# Bring down the container
down:
	$(DC) down

# Access the container's shell
sh:
	$(DC) exec -it $(CONTAINER) bash

# Compile PHP inside the container
compile:
	$(DC) exec $(CONTAINER) bash -c "cd /php/php-src && ./buildconf --force && ./configure --enable-debug && make -j\$$(nproc)"

# Check the version of the pdo_sqlite extension
check-pdo-sqlite-version:
	$(DC) exec $(CONTAINER) bash -c "/php/php-src/sapi/cli/php -i | grep -i sqlite"


# Tail logs
logs:
	$(DC) logs -f --tail=10

# Stop the container
stop:
	$(DC) stop

# Clean up containers and images
clean:
	$(DC) down --rmi all
