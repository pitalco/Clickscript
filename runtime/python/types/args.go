package types

import (
	"fmt"
	"strconv"

	"github.com/pkg/errors"
)

type Arg struct {
	Name        string      `json:"arg_name"`
	Value       string      `json:"arg_value"`
	ValueAsType interface{} `json:"arg_value_type"`
	Type        string      `json:"arg_type"`
}

type Args []Arg

func NewArgs(args []Arg) Args {
	var argsList Args
	for _, arg := range args {
		argsList = append(argsList, arg)
	}
	return argsList
}

func (a Args) GetArg(argName string) (arg Arg, err error) {
	for _, arg := range a {
		if arg.Name == argName {
			return arg, nil
		}
	}
	return arg, errors.Wrapf(ErrArgNotFound, "argument %s not found", argName)
}

func (a Arg) ArgAsType() (Arg, error) {
	switch a.Type {
	case "string":
		a.ValueAsType = fmt.Sprintf("%q", string(a.Value))
		return a, nil
	case "number":
		val, err := strconv.ParseFloat(a.Value, 64)
		a.ValueAsType = val
		if err != nil {
			return a, err
		}
		return a, nil
	case "bytes":
		a.ValueAsType = fmt.Sprintf("bytes(%q, 'utf-8')", a.Value)
		return a, nil
	case "variable":
		a.ValueAsType = fmt.Sprintf("%s", a.Value)
		return a, nil
	case "function":
		return a, nil
	case "tuple":
		return a, nil
	case "boolean":
		return a, nil
	case "list":
		return a, nil
	case "dict":
		return a, nil
	case "none":
		return a, nil
	default:
		return a, errors.Wrapf(ErrTypeNotFound, "type %s not found", a.Type)
	}
}
