package handlers

import (
	"net/http"
	"strconv"

	"github.com/labstack/echo"
	model "github.com/zviedris/questioner/models"
	"github.com/zviedris/questioner/storage"
)

// e.GET("/statistics/question/:id", handlers.QuestionStatistics)
// lists all questioners that is available
func QuestionStatistics(c echo.Context) error {

	//get input data about request
	idString := c.Param("id")
	//check if input is string
	id, err := strconv.Atoi(idString)
	if err != nil {
		return c.String(http.StatusBadRequest, "Received a string")
	}
	var result model.QuestionStatistics

	err, result.OptionStats = queryStatistics(idString)

	if err != nil {
		return c.String(http.StatusInternalServerError, err.Error())
	}
	//if no statistics if found then return error
	if len(result.OptionStats) == 0 {
		return c.String(http.StatusInternalServerError, "statistics not found")
	}

	result.QuestionId = int64(id)
	result.TotalCount, result.AverageValue = result.CalculateStatistics()

	return c.JSON(http.StatusOK, result)

}

// database statistics call
func queryStatistics(id string) (error, []model.OptionStatistics) {
	conn := storage.GetStorage()
	sess := conn.NewSession(nil)

	var quest []model.OptionStatistics

	_, err := sess.Select("option_value", "answer_count").From("question_statistic").Where("question_id = " + id).Load(&quest)

	return err, quest
}
