import { print } from "./types/print"
import { variable } from "./types/var"

export const actions = {
    "print": {
        "name": "print",
        "description": "Print the provided input to the console.",
        "inputs": [
            {
                "type": "list",
                "name": "values"
            }
        ],
        "encode": print
    },
    "var": {
        "name": "var",
        "description": "Set a variable into memory.",
        "inputs": [
            {
                "type": "string",
                "name": "name"
            },
            {
                "type": "any",
                "name": "value"
            }
        ],
        "encode": variable
    },
    "get": {
        "name": "get",
        "description": "Send a get request to url.",
        "inputs": [
            {
                "type": "string",
                "name": "url"
            }
        ],
        "encode": () => {}
    },
    "post": {
        "name": "post",
        "description": "Send a post request to url.",
        "inputs": [
            {
                "type": "string",
                "name": "url"
            }
        ],
        "encode": () => {}
    },
    "put": {
        "name": "put",
        "description": "Send a put request to url.",
        "inputs": [
            {
                "type": "string",
                "name": "url"
            }
        ],
        "encode": () => {}
    }
}

export const options = [
    {
        "group": "basic",
        "actions": [
            actions["var"],
            actions["print"]          
        ]
    },
    {
        "group": "http",
        "actions": [
            actions["get"],
            actions["post"],
            actions["put"]
        ]
    }
]