#!/bin/bash
# Export non-sensitive environment variables
export DB_CONNECTION=pgsql
export DB_HOST=db
export DB_PORT=5432
export DB_DATABASE=laravel
export DB_USERNAME=postgres
export DB_PASSWORD=secret
export BACKEND_API_HOST=http://backend:8000

# Print the variables to verify (optional)
echo "DB_CONNECTION: $DB_CONNECTION"
echo "DB_HOST: $DB_HOST"
echo "DB_PORT: $DB_PORT"
echo "DB_DATABASE: $DB_DATABASE"
echo "DB_USERNAME: $DB_USERNAME"
echo "DB_PASSWORD: ******"  # Mask sensitive data
echo "BACKEND_API_HOST: $BACKEND_API_HOST"
