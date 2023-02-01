package models

type QuestionStatistics struct {
	QuestionId   int64              `json:"questionId"`
	TotalCount   int64              `json:"totalCount"`
	AverageValue float64            `json:"averageValue"`
	OptionStats  []OptionStatistics `json:"optionStatistics"`
}

type OptionStatistics struct {
	OptionValue int64 `json:"optionValue" db:"option_value"`
	Count       int64 `json:"count" db:"answer_count"`
}

func (s QuestionStatistics) CalculateStatistics() (int64, float64) {
	totalCount := int64(0)
	totalValue := int64(0)
	for _, value := range s.OptionStats {
		totalCount += value.Count
		totalValue += value.Count * value.OptionValue
	}
	return totalCount, float64(totalValue) / float64(totalCount)
}
