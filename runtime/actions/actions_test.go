package actions_test

import (
	"encoding/json"
	"testing"

	"github.com/pitalco/clickscript/runtime/actions"
	"github.com/pitalco/clickscript/runtime/types"
	"github.com/stretchr/testify/assert"
)

func TestFunctionAction(t *testing.T) {
	ctx := types.NewContext()
	t.Run("CreateFunction", func(t *testing.T) {
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
	t.Run("RunFunctionCorrect", func(t *testing.T) {
		runArgs := actions.RunArgs{
			Name:   "test",
			Inputs: []actions.RunInput{},
		}
		runArg, err := json.Marshal(&runArgs)
		assert.NoError(t, err)
		err = actions.RunFunction(ctx, runArg)
		assert.NoError(t, err)
	})
	t.Run("RunFunctionNotCreated", func(t *testing.T) {
		runArgs := actions.RunArgs{
			Name:   "testwrong",
			Inputs: []actions.RunInput{},
		}
		runArg, err := json.Marshal(&runArgs)
		assert.NoError(t, err)
		err = actions.RunFunction(ctx, runArg)
		assert.Error(t, err)
	})
}

func TestVarAction(t *testing.T) {}

func TestPrintAction(t *testing.T) {}

func TestIfAction(t *testing.T) {}

func TestLoopAction(t *testing.T) {}

func TestMathAction(t *testing.T) {}
