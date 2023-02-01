package models

//return data about questioner
type Questioner struct {
	Id          int64  `json:"id" db:"id"`
	Description string `json:"description" db:"description"`
	Code        string `json:"code" db:"code"`
}
