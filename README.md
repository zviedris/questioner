# questioner

To connect and use database set QUESTIONER_DATABASE_URL in Enviornment in format username:password@(localhost:3306)/dbname?multiStatements=true
QUESTIONER_PORT - application port - default 1323

To support adequat workload to around 100 requests per second - SET GLOBAL max_connections = 600; in MySQL database with root user with default connection count error with connection limit is achieved

go build - builds an exe that can be run as a server
go run main.go - runs in visual stuidio code