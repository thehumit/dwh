### README for Docker Compose Setup

#### Overview
This Docker Compose file sets up a PostgreSQL master-slave replication system with an additional service to run DDL (Data Definition Language) scripts.

#### Services
1. **postgresql-master**: 
   - **Image**: `bitnami/postgresql`.
   - **Role**: Acts as the master database.
   - **Ports**: Exposes port 5432.
   - **Volumes**: Uses `postgresql_master_data` for data persistence.
   - **Environment Variables**: Configured for master replication, audit logs, and basic PostgreSQL settings.

2. **postgresql-slave**: 
   - **Image**: `bitnami/postgresql`.
   - **Role**: Acts as the slave database in the replication setup.
   - **Dependencies**: Depends on `postgresql-master`.
   - **Environment Variables**: Configured for slave replication and to connect to the master database.

3. **run_ddl_script**: 
   - **Image**: `postgres:latest`.
   - **Role**: Executes DDL scripts against the master and slave databases.
   - **Volumes**: Mounts scripts and bash script for execution.
   - **Environment Variables**: Contains database connection details and paths to scripts.
   - **Dependencies**: Depends on both `postgresql-master` and `postgresql-slave`.
   - **Entrypoint**: Executes the bash script `/execute_ddl.sh`.

#### Volumes
- **postgresql_master_data**: 
  - **Driver**: Local.
  - **Purpose**: Used by `postgresql-master` for data persistence.

#### Execution
1. Start the services with `docker-compose up`. This will bring up both the master and slave databases and then execute the DDL scripts.

#### Important Notes
- Ensure port 5432 is not being used on the host machine, as it's exposed by both the master and slave services.
- The `ALLOW_EMPTY_PASSWORD` environment variable is set to 'yes', which is generally not recommended for production environments.
- Customize the environment variables, especially `POSTGRESQL_PASSWORD`, `POSTGRESQL_REPLICATION_USER`, and `POSTGRESQL_REPLICATION_PASSWORD` for a secure setup.
- The DDL scripts `ddl_init.sql`, `mock_data.sql`, and `gmv_view.sql` will be executed against the databases. Modify these scripts according to your requirements.
- The `postgresql-slave` service does not specify a host port mapping for 5432, which might lead to conflicts or accessibility issues depending on your Docker configuration.

#### Troubleshooting
- If services fail to start, check the Docker logs for error messages.
- Ensure all volume paths (`./bash_scripts/execute_ddl.sh`, etc.) are correctly set and accessible by Docker.
- Network issues between containers can be resolved by checking Docker network configurations and ensuring that the services are on the same network.

This setup provides a basic PostgreSQL replication environment with DDL script execution capabilities, suitable for development and testing. For a production environment, further security and configuration considerations are necessary.