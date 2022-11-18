package actions

import (
	"fmt"
	"log"

	"github.com/schnetzlerjoe/clickscriptcompiler/python/types"
)

func Var(argsRaw []types.Arg) (code string, err error) {
	args := types.NewArgs(argsRaw)
	name, err := args.GetArg("var_name")
	name, err = name.ArgAsType()
	if err != nil {
		return code, err
	}
	value, err := args.GetArg("var_value")
	value, err = value.ArgAsType()
	if err != nil {
		return code, err
	}
	switch value.Type {
	case "string":
		code = fmt.Sprintf("%s = %s", name.ValueAsType, value.ValueAsType)
	case "number":
		code = fmt.Sprintf("%s = %f", name.ValueAsType, value.ValueAsType)
	case "bytes":
		code = fmt.Sprintf("%s = %s", name.ValueAsType, value.ValueAsType)
	case "variable":
		code = fmt.Sprintf("%s = %s", name.ValueAsType, value.ValueAsType)
	case "function":
	case "tuple":
	case "boolean":
	case "list":
	case "dict":
	case "none":
	}
	if err != nil {
		log.Fatal(err)
	}
	return code, nil
}
