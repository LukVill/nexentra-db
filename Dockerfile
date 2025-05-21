# Use the official Fly.io PostgreSQL image as base
FROM flyio/postgres-flex:17.2

# Copy your custom entrypoint (which will call the original one)
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# Set the custom entrypoint
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

# Set default command if none is provided
CMD ["postgres"]

# Expose default PostgreSQL port
EXPOSE 5432
