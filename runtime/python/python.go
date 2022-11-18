package python

import (
	"encoding/json"
	"fmt"
	"log"
	"os"

	"github.com/schnetzlerjoe/clickscriptcompiler/python/actions"
	"github.com/schnetzlerjoe/clickscriptcompiler/python/types"
)

func Compile() error {
	// create initial base variables needed later
	var code string
	var err error

	// read in the json file that will be converted to code
	file, err := os.ReadFile("./code.json")
	if err != nil {
		return err
	}
	// unmarshal the raw json bytes into golang struct
	script := types.Script{}
	json.Unmarshal(file, &script)

	// loop through each command in the json file (golang struct)
	// and use handler to lookup function and convert to python string code.
	// Each compiled string is concated into the current code string
	for i, action := range script.Script {
		if i == 0 {
			run := actions.GetFunction(action.Action)
			code, err = run(action.Args)
			if err != nil {
				return err
			}
		} else {
			run := actions.GetFunction(action.Action)
			newCode, err := run(action.Args)
			code = fmt.Sprintf("%s\n\n%s", code, newCode)
			if err != nil {
				return err
			}
		}
	}

	// create the base python script file
	f, err := os.Create("script.py")
	if err != nil {
		log.Fatal(err)
	}

	// write the generated python script (in the code variable) to the file
	_, err = f.Write([]byte(code))
	if err != nil {
		log.Fatal(err)
	}

	f.Close()

	return nil
}
