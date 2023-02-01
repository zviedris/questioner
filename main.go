package main

import (
	"embed"

	"github.com/labstack/echo"
	"github.com/labstack/gommon/log"
	infrastructure "github.com/zviedris/infrastructure"
	migrations "github.com/zviedris/migrations"
	"github.com/zviedris/questioner/config"
	"github.com/zviedris/questioner/handlers"
	"github.com/zviedris/questioner/storage"
)

//go:embed sql
var folder embed.FS

func main() {
	conf, err := config.InitAppConfig()
	if err != nil {
		log.Fatal(err)
	}

	//run automigrate DB
	if conf.AutoMigrate {
		migrateDBInstance := infrastructure.NewMasterDbInstance("mysql", conf.DatabaseURL)
		err, _, _ := migrations.RunAutoMigrate(migrateDBInstance.DBX().DB, folder, "sql", "mysql", "questioner")
		if err != nil {
			log.Error(err)
		}
	}

	//initialize DB connection for the project
	storage.InitializeStorage("mysql", conf.DatabaseURL, 500)

	e := echo.New()

	//server paths and functions to execute
	e.GET("/questioner/list", handlers.ListQuestioners)
	e.POST("/response/save", handlers.SaveResponse)
	e.GET("/statistics/question/:id", handlers.QuestionStatistics)

	e.Logger.Fatal(e.Start(":" + conf.AppPort))
}
