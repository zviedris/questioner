package storage

import (
	db "github.com/gocraft/dbr/v2"
)

var conn *db.Connection

// initialize storage for all project so that only new connections should be opened
func InitializeStorage(dbType string, dbPath string, maxConections int) {
	conn, _ = db.Open(dbType, dbPath, nil)
	conn.SetMaxOpenConns(maxConections)
}

// Get initializet connection
func GetStorage() *db.Connection {
	return conn
}
