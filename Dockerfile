# Use the official Fly.io PostgreSQL image as base
FROM flyio/postgres-flex:17.2

# Install pgAgent and dependencies
RUN apt-get update && \
    apt-get install -y pgagent && \
    rm -rf /var/lib/apt/lists/*

echo "POSTGRES_USER=$POSTGRES_USER"
echo "POSTGRES_DB=$POSTGRES_DB"

# Copy your custom entrypoint (which will call the original one)
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# Set the custom entrypoint
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

# Set default command if none is provided
CMD ["postgres"]

# Expose default PostgreSQL port
EXPOSE 5432
