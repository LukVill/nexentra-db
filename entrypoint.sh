#!/bin/bash
set -e

# Start PostgreSQL in the background
postgres -c listen_addresses='*' &
PG_PID=$!

# Wait for PostgreSQL to start
until pg_isready -U "$POSTGRES_USER"; do
  echo "Waiting for PostgreSQL to startup..."
  sleep 2
done

# Start pgAgent
pgagent hostaddr=127.0.0.1 dbname=$POSTGRES_DB user=$POSTGRES_USER

# Wait for Postgres to exit (container stays alive)
wait $PG_PID