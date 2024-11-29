#!/bin/bash
set -e

DB_HOST=$(aws secretsmanager get-secret-value --secret-id $SECRET_NAME | jq -r '.host')
DB_PASSWORD=$(aws secretsmanager get-secret-value --secret-id $SECRET_NAME | jq -r '.password')
DB_USER=$(aws secretsmanager get-secret-value --secret-id $SECRET_NAME | jq -r '.username')

psql -h "$DB_HOST" -U "$DB_USER" -d postgres -c "INSERT INTO payee (email, name, phone_number) VALUES ('testuser@example.com', 'Test User', '1234567890');"
psql -h "$DB_HOST" -U "$DB_USER" -d postgres -c "SELECT * FROM payee;"
