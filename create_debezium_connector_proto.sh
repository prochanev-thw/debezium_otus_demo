curl -X POST http://localhost:8083/connectors \
  -H "Content-Type: application/json" \
  -d '{
    "name": "debezium-postgres-connector-proto",
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
      "slot.name": "debezium_slot_proto",
      "topic.prefix": "dbzm__",
      "publication.name": "debezium_pub",
      "snapshot.mode": "never",

      "value.converter": "io.confluent.connect.protobuf.ProtobufConverter",
      "value.converter.schema.registry.url": "http://localhost:8081",

      "transforms": "route",
      "transforms.route.type": "org.apache.kafka.connect.transforms.RegexRouter",
      "transforms.route.regex": "(.*)",
      "transforms.route.replacement": "$1_proto"
    }
  }'
