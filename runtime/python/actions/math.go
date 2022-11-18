package actions

import (
	"encoding/json"
)

type MathArgs struct {
	FirstValue  float64 `json:"first_value"`
	SecondValue float64 `json:"last_value"`
	Operation   string  `json:"operation"`
}

func Math(args []byte) (code string, err error) {
	var rawVals MathArgs
	json.Unmarshal(args, &rawVals)

	return code, nil
}
