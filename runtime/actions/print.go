package actions

import (
	"encoding/json"
	"fmt"
	"log"

	"github.com/pitalco/clickscript/runtime/types"
)

type PrintArgs struct {
	Values []interface{} `json:"values"`
}

func Print(ctx types.Context, args []byte) (code string, err error) {
	var printArgs PrintArgs

	err = json.Unmarshal(args, &printArgs)
	if err != nil {
		log.Fatal(err)
	}

	fmt.Print(printArgs.Values...)

	return code, nil
}
