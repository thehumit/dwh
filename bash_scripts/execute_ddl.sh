#!/bin/bash



# Function to check if postgres_primary is ready
check_postgres_primary_ready() {
    PGPASSWORD=$PRIMARY_DB_PASSWORD psql -h $PRIMARY_DB_HOST -U $PRIMARY_DB_USER -p $PRIMARY_DB_PORT -d $PRIMARY_DB_NAME -c '\q'
    return $?
}


# Wait for primary database to be ready
echo "Waiting for primary database to be ready..."
while ! check_postgres_primary_ready; do
  sleep 1
done
echo "Primary database is ready."

# Execute DDL script
echo "Executing DDL script on primary database..."
PGPASSWORD=$PRIMARY_DB_PASSWORD psql -h $PRIMARY_DB_HOST -U $PRIMARY_DB_USER -p $PRIMARY_DB_PORT -d $PRIMARY_DB_NAME -f $DDL_SCRIPT_PATH

# Execute Mock data script
# Comment for clear auto-test
PGPASSWORD=$PRIMARY_DB_PASSWORD psql -h $PRIMARY_DB_HOST -U $PRIMARY_DB_USER -p $PRIMARY_DB_PORT -d $PRIMARY_DB_NAME -f $MOCK_DATA_PATH

# Execute Mock data script
PGPASSWORD=$PRIMARY_DB_PASSWORD psql -h $PRIMARY_DB_HOST -U $PRIMARY_DB_USER -p $PRIMARY_DB_PORT -d $PRIMARY_DB_NAME -f $GMV_VIEW_PATH


if [ $? -eq 0 ]; then
    echo "DDL script executed successfully."
else
    echo "Failed to execute DDL script."
    exit 1
fi
