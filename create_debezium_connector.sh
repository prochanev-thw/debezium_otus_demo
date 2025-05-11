curl -X POST http://localhost:8083/connectors \
  -H "Content-Type: application/json" \
  -d '{
    "name": "debezium-postgres-connector",
    "config": {
      "connector.class": "io.debezium.connector.postgresql.PostgresConnector",
      "database.hostname": "postgresql",
      "database.port": "5432",
      "database.user": "user",
      "database.password": "user",
      "database.dbname": "postgres",
      "database.server.name": "postgres",
      "table.include.list": "public.*",
      "plugin.name": "pgoutput",
      "slot.name": "debezium_slot",
      "topic.prefix": "dbzm__",
      "publication.name": "debezium_pub",
      "snapshot.mode": "never"
    }
  }'
