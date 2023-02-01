package models

//interface to use as response validation
type Input interface {
	Validate() bool
}

//all questioner response
type Answer struct {
	Id           int64  `json:"id" db:"id"`
	QuestionId   int64  `json:"questionId" db:"question_id"`
	TextValue    string `json:"textValue" db:"text_value"`
	NumericValue int64  `json:"numericValue" db:"numeric_value"`
}

//individual question response
type Response struct {
	Id           int64    `json:"id" db:"id"`
	QuestionerId int64    `json:"questionerId" db:"questioner_id"`
	Answers      []Answer `json:"answers"`
}

//Response insert so that id is filled when insert in database
type ResponseInsert struct {
	Id           int64 `json:"id" db:"id"`
	QuestionerId int64 `json:"questionerId" db:"questioner_id"`
}
