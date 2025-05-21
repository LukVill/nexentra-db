#!/bin/bash
set -e

# Start PostgreSQL in the foreground (no pgAgent)
exec postgres -c listen_addresses='*'