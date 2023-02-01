# questioner

To connect and use database set QUESTIONER_DATABASE_URL in Enviornment in format username:password@(localhost:3306)/dbname?multiStatements=true
QUESTIONER_PORT - application port - default 1323

On application start DB migrations will be run and DB will be populated with tables and test data

To support adequat workload without errors to around 100 requests per second - SET GLOBAL max_connections = 600; in MySQL database with root user
This will help to mittigate max connection errors as those connections will stuck up at MySQL part. 

go build - builds an exe that can be run as a server
go run main.go - runs in visual stuidio code