#!/bin/bash

kubectl exec -it pod/reader -n=ch-importer -- clickhouse-mysql --src-server-id=200 \
  --src-host=35.192.162.222 \
  --src-port=3306 \
  --src-schemas=tymeapp_tymeshift \
  --src-user=root \
  --src-password=Mister007 \
  --src-tables=temp_audit_events_for_account_id_8351 \
  --dst-host=35.223.7.1 \
  --dst-port=9000 \
  --dst-schema=storage \
  --dst-table=audit_events \
  --dst-user=admin \
  --dst-password=clickhouse \
  --migrate-table