DC=docker compose --file docker-compose.yml
CONTAINER=dockphp
DETAILS_FILE=details.txt

.PHONY: up down sh logs setup generate-details

up:
	$(DC) up -d --build

setup: up

down:
	$(DC) down

sh:
	$(DC) exec $(CONTAINER) sh

logs:
	$(DC) logs -f --tail=10

generate-details:
	@echo "Generating $(DETAILS_FILE)...\n"
	@echo "PHP Version:" > $(DETAILS_FILE)
	$(DC) exec $(CONTAINER) php -v >> $(DETAILS_FILE)
	@echo "\nInstalled Extensions:" >> $(DETAILS_FILE)
	$(DC) exec $(CONTAINER) php -m >> $(DETAILS_FILE)
	@echo "\nphp.ini Location:" >> $(DETAILS_FILE)
	$(DC) exec $(CONTAINER) php --ini | grep "Loaded Configuration File" >> $(DETAILS_FILE)
	@echo "\nExtracted php.ini Settings:" >> $(DETAILS_FILE)
	@echo "- date.timezone:" >> $(DETAILS_FILE)
	$(DC) exec $(CONTAINER) php -r "echo ini_get('date.timezone');" >> $(DETAILS_FILE)
	@echo "\n- memory_limit:" >> $(DETAILS_FILE)
	$(DC) exec $(CONTAINER) php -r "echo ini_get('memory_limit');" >> $(DETAILS_FILE)
	@echo "\n$(DETAILS_FILE) has been generated successfully."
