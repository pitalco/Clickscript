package actions_test

import (
	"encoding/json"
	"testing"

	"github.com/pitalco/clickscript/runtime/actions"
	"github.com/pitalco/clickscript/runtime/types"
	"github.com/stretchr/testify/assert"
)

func TestFunctionAction(t *testing.T) {
	t.Run("CreateFunction", func(t *testing.T) {
		ctx := types.NewContext()
		defArg := actions.DefArgs{
			Name:    "test",
			Inputs:  []actions.CreateInput{},
			Actions: []types.Action{},
		}
		createArg, err := json.Marshal(&defArg)
		assert.NoError(t, err)
		err = actions.CreateFunction(ctx, createArg)
		assert.NoError(t, err)
	})
}

func TestVarAction(t *testing.T) {}

func TestPrintAction(t *testing.T) {}
