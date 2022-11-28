package actions

import (
	"encoding/json"
	"log"

	"github.com/pitalco/clickscript/runtime/types"
)

type VarArgs struct {
	Name      string      `json:"name"`
	Value     interface{} `json:"value"`
	ValueType string      `json:"type"`
}

func Var(ctx types.Context, args []byte) error {
	var varArgs VarArgs
	// unmarshal the args for this action from bytes
	err := json.Unmarshal(args, &varArgs)
	if err != nil {
		log.Fatal(err)
	}
	// store the variable in memory as the specified type
	ctx.Memory[varArgs.Name] = varArgs.Value
	return nil
}
