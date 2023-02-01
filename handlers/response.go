package handlers

import (
	"fmt"
	"net/http"
	"strconv"

	"github.com/labstack/echo"
	model "github.com/zviedris/questioner/models"
	"github.com/zviedris/questioner/storage"
)

// e.POST("/response/save", handlers.SaveResponse)
func SaveResponse(c echo.Context) error {
	var req model.Response
	//get input data about request
	if err := c.Bind(&req); err != nil {
		return c.String(http.StatusBadRequest, err.Error())
	}

	//do database save
	err1 := saveResponse(&req)

	if err1 != nil {
		fmt.Println(err1)
		return c.String(http.StatusBadRequest, err1.Error())
	}

	return c.JSON(http.StatusOK, req.Id)
}

func saveResponse(respose *model.Response) error {

	conn := storage.GetStorage()

	sess := conn.NewSession(nil)

	tx, err := sess.Begin()
	if err != nil {
		return err
	}
	//if there is error then there will be rollback
	defer tx.RollbackUnlessCommitted()

	var resp model.ResponseInsert
	resp.QuestionerId = respose.QuestionerId

	//insert response
	_, err2 := tx.InsertInto("response").
		Columns("questioner_id").
		Record(&resp).
		Exec()

		/* //this works for postgresql
		err2 := tx.InsertInto("response").
			Columns("questioner_id", "time").
			Values(respose.QuestionerId, time.Now())
			Returning("id").Load(&respose.Id)*/

	if err2 != nil {
		return err2
	}

	//insert all answers for the response for each question
	for _, value := range respose.Answers {
		_, err2 = tx.InsertInto("answer").
			Columns("response_id", "question_id", "numeric_value", "text_value").
			Values(resp.Id, value.QuestionId, value.NumericValue, value.TextValue).
			Exec()

		if err2 != nil {
			return err2
		}

		//update statistics
		//can be done in a queue in other service as well
		if &value.NumericValue != nil {
			query := "UPDATE question_statistic SET answer_count = answer_count + 1 WHERE question_id = " + strconv.FormatInt(value.QuestionId, 10) + " AND option_value = " + strconv.FormatInt(value.NumericValue, 10)

			_, err2 = tx.UpdateBySql(query).Exec()
			if err2 != nil {
				return err2
			}
		}
	}

	tx.Commit()
	return nil
}
