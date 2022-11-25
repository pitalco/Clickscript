package actions

import (
	"encoding/json"
	"log"

	"github.com/pitalco/clickscript/runtime/types"
)

type CreateInput struct {
	Name      string
	InputType string
}

type RunInput struct {
	Name  string
	Value interface{}
}

type DefArgs struct {
	Name    string
	Inputs  []CreateInput
	Actions []types.Action
}

type RunArgs struct {
	Name   string
	Inputs []RunInput
}

// RunFunction runs a pre-defined function
func RunFunction(ctx types.Context, args []byte) (logs string, err error) {
	var runArgs RunArgs
	// unmarshal the args for this action from bytes
	err = json.Unmarshal(args, &runArgs)
	if err != nil {
		log.Fatal(err)
	}
	// convert to list of action type
	actions := ctx.Memory[runArgs.Name].([]types.Action)
	// add each input as a memory value
	for _, in := range runArgs.Inputs {
		ctx.Memory[in.Name] = in.Value
	}
	// run each action within the function
	for _, a := range actions {
		// get the function for this action from the handler
		run := GetFunction(ctx, a.Action)
		logs, err = run(ctx, a.Args)
		if err != nil {
			log.Fatal(err)
		}
	}
	return logs, nil
}

// CreateFunction takes a function and stores it in memory. Can be run with RunFunction ('run' action)
func CreateFunction(ctx types.Context, args []byte) (logs string, err error) {
	var defArgs DefArgs
	// unmarshal the args for this action from bytes
	err = json.Unmarshal(args, &defArgs)
	if err != nil {
		log.Fatal(err)
	}
	// set the function in memory
	ctx.Memory[defArgs.Name] = defArgs.Actions
	return logs, nil
}
