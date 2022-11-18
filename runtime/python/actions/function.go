package actions

import (
	"fmt"
	"log"

	"github.com/schnetzlerjoe/clickscriptcompiler/python/types"
)

// creates a python function and returns the string representation of the code of
// such function.
func CreateFunction(action types.Action) (code string, err error) {

	for _, action := range action.Actions {
		run := GetFunction(action.Action)
		code, err = run(action.Args)
		if err != nil {
			log.Fatal(err)
		}
	}

	code = fmt.Sprintf("def:\n\t%s", code)

	if err != nil {
		log.Fatal(err)
	}
	return code, nil
}
