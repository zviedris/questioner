# questioner

To connect and use database set QUESTIONER_DATABASE_URL in Enviornment in format username:password@(localhost:3306)/dbname?multiStatements=true

To support adequat workload to around 100 requests per second - SET GLOBAL max_connections = 600; in MySQL database with root user with default connection count error with connection limit is achieved
