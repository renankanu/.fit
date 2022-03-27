db_migration: up_mysql_db
	@echo "Running db:migrate"
	@docker run --rm --network="kn-fit-network" -v $(PWD)/migrations:/flyway/sql boxfuse/flyway -url=jdbc:mysql://db -schemas=kn_fit_database -user=root -password=root migrate
	@echo "Done"

up_mysql_db:
	@echo "Running db:up_mysql"
	@cd ~/.fit && docker-compose up -d
	@echo "mysql docker is up"