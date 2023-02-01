package config

import (
	"errors"
	"os"
)

// AppConfig - Init app config
type AppConfig struct {
	Environment    string `json:"environment"`
	AppPort        string `json:"appPort"`
	DatabaseURL    string `json:"databaseUrl"`
	MaxConnections int    `json:"maxConnections"`

	AutoMigrate bool   `json:"auto_migrate"`
	LogLevel    string `json:"log_level"`
}

func InitAppConfig() (*AppConfig, error) {
	currentEnv := "development"
	//databaseUrl := "user=postgres password=password host=localhost port=5555 dbname=dbname sslmode=prefer connect_timeout=10"
	//databaseUrl := "username:password@(localhost:3306)/dbname?multiStatements=true"
	databaseUrl := ""
	//default automigration is true
	migration := true

	appPort := os.Getenv("QUESTIONER_PORT")
	if appPort == "" {
		appPort = "1323"
	}

	if os.Getenv("ENV") != "" {
		currentEnv = os.Getenv("ENV")
	}

	if os.Getenv("QUESTIONER_DATABASE_URL") != "" {
		databaseUrl = os.Getenv("QUESTIONER_DATABASE_URL")
	} else {
		return nil, errors.New("database url not set")
	}

	//automigrate by default true
	/*
		if os.Getenv("AUTO_MIGRATE") != "" {
			if os.Getenv("QUESTIONER_DATABASE_URL") == "true" {
				migration = true
			} else {
				migration = false
			}
		}*/

	return &AppConfig{
		Environment:    currentEnv,
		AppPort:        appPort,
		DatabaseURL:    databaseUrl,
		MaxConnections: 500,
		AutoMigrate:    migration,
	}, nil
}
