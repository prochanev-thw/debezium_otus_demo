restart_kafka_connect_debezium:
	docker-compose down -v
	docker-compose -f docker-compose.yml stop
	docker-compose -f docker-compose.yml build
	docker-compose -f docker-compose.yml up -d

#
#restart_kafka_connect_debezium:
#	docker compose restart kafka-connect
#
#restart_kafka_connect_debezium:
#	docker compose restart prometheus
