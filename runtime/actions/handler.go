package actions

import (
	"log"

	"github.com/pitalco/clickscript/runtime/types"
)

// GetFunction is a lookup function that maps a function name to a function
// and then returns that function. The function then can be used to run the code
// within the runner. For each newly created Clickscript action, you must add that
// action as a case in the switch statement for Clickscript to be able to use it.
func GetFunction(ctx types.Context, functionName string) func(ctx types.Context, args []byte) (log string, err error) {
	switch functionName {
	case types.PrintHandlerName:
		return Print
	case types.VarHandlerName:
		return Var
	case types.FunctionHandlerName:
		return CreateFunction
	case types.FunctionRunHandlerName:
		return RunFunction
	default:
		log.Fatalf("action %s does not exist", functionName)
	}
	return nil
}
