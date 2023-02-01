package handlers

import (
	"net/http"

	"github.com/labstack/echo"
	model "github.com/zviedris/questioner/models"
	"github.com/zviedris/questioner/storage"
)

// e.GET("/questioner/list", handlers.ListQuestioners)
// lists all questioners that is available
func ListQuestioners(c echo.Context) error {

	conn := storage.GetStorage()
	sess := conn.NewSession(nil)

	var quest []model.Questioner

	//select all questioner data
	_, err := sess.Select("*").From("questioner").Load(&quest)

	if err != nil {
		return c.String(http.StatusInternalServerError, err.Error())
	}

	return c.JSON(http.StatusOK, quest)

}
