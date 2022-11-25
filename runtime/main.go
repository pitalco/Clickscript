package main

import (
	"encoding/json"
	"fmt"
	"log"
	"net/http"
	"os"

	"github.com/pitalco/clickscript/runtime/actions"
	"github.com/pitalco/clickscript/runtime/types"
)

// Runner that runs each item in Clickscript script
func main() {
	// create the context object
	ctx := types.Context{}

	// setup log file
	// If the file doesn't exist, create it or append to the file
	file, err := os.OpenFile("logs.txt", os.O_APPEND|os.O_CREATE|os.O_WRONLY, 0666)
	if err != nil {
		log.Fatal(err)
	}

	log.SetOutput(file)

	http.HandleFunc("/code", func(w http.ResponseWriter, r *http.Request) {
		if r.Method == http.MethodPost {
			// unmarshal Clickscript file from base64 -> JSON
			s := &types.Script{}
			err := json.NewDecoder(r.Body).Decode(s)
			if err != nil {
				http.Error(w, err.Error(), http.StatusBadRequest)
				return
			}
			// Get the action function and run it for each action
			for _, line := range s.Script {
				// get the function to run
				run := actions.GetFunction(ctx, line.Action.Action)
				// run the function
				err := run(ctx, line.Action.Args)
				if err != nil {
					http.Error(w, err.Error(), http.StatusBadRequest)
					return
				}
			}
		}
	})

	http.HandleFunc("/run", func(w http.ResponseWriter, r *http.Request) {
		// gets and returns the log in base64 bytes. Also writes it to .log file
		if r.Method == http.MethodGet {
			fmt.Fprintf(w, "Hello!")
		}
	})

	fmt.Printf("Starting Clickscript server at port 8080\n")
	if err := http.ListenAndServe(":8080", nil); err != nil {
		log.Fatal(err)
	}
}
