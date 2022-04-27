.PHONY: help db_migration up_mysql_db

help: ## This help dialog.
	@IFS=$$'\n' ; \
	help_lines=(`fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//'`); \
	for help_line in $${help_lines[@]}; do \
		IFS=$$'#' ; \
		help_split=($$help_line) ; \
		help_command=`echo $${help_split[0]} | sed -e 's/^ *//' -e 's/ *$$//'` ; \
		help_info=`echo $${help_split[2]} | sed -e 's/^ *//' -e 's/ *$$//'` ; \
		printf "%-30s %s\n" $$help_command $$help_info ; \
	done

db_migration: up_mysql_db ## This is the db migration task.
	@echo "⊢ Running db:migrate ⊣"
	@docker run --rm --network="kn-fit-network" -v $(PWD)/migrations:/flyway/sql boxfuse/flyway -url=jdbc:mysql://db?useSSL=false -schemas=kn_fit_database -user=root -password=root migrate
	@echo "Done"

up_mysql_db: ## This is the db up task.
	@echo "⊢ Running db:up_mysql ⊣"
	@cd ~/.fit && docker-compose up -d
	@echo "mysql docker is up"