package actions

import (
	"fmt"
	"log"

	"github.com/schnetzlerjoe/clickscriptcompiler/python/types"
)

type PrintArgs struct {
	Values []interface{} `json:"values"`
}

func Print(args []types.Arg) (code string, err error) {
	var currentVal string

	for i, arg := range args {
		arg, err = arg.ArgAsType()
		if err != nil {
			log.Fatal(err)
		}
		if i != 0 {
			switch arg.Type {
			case "string":
				currentVal = fmt.Sprintf("%s, %s", currentVal, arg.ValueAsType)
			case "number":
				currentVal = fmt.Sprintf("%s, %f", currentVal, arg.ValueAsType)
			case "bytes":
				currentVal = fmt.Sprintf("%s, %s", currentVal, arg.ValueAsType)
			case "variable":
				currentVal = fmt.Sprintf("%s, %s", currentVal, arg.ValueAsType)
			case "function":
			case "tuple":
			case "boolean":
			case "list":
			case "dict":
			case "none":
			}
		} else {
			switch arg.Type {
			case "string":
				currentVal = fmt.Sprintf("%s", arg.ValueAsType)
			case "number":
				currentVal = fmt.Sprintf("%f", arg.ValueAsType)
			case "bytes":
				currentVal = fmt.Sprintf("%s", arg.ValueAsType)
			case "variable":
				currentVal = fmt.Sprintf("%s", arg.ValueAsType)
			case "function":
			case "tuple":
			case "boolean":
			case "list":
			case "dict":
			case "none":
			}
		}
	}

	code = "print(" + currentVal + ")"
	if err != nil {
		log.Fatal(err)
	}
	return code, nil
}
