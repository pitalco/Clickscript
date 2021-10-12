import { writable } from 'svelte/store';

export const contents = writable([
    {
        "type": "folder",
        "name": "server",
        "contents": [
            {
                "type": "folder",
                "name": "index",
                "script": [
                    {
                        "id": "print",
                        "inputs": []
                    },
                    {
                        "id": "csv_to_df",
                        "inputs": []
                    },
                ]
            }
        ]
    },
    {
        "type": "file",
        "name": "index",
        "contents": {
            "name": "index",
            "script": [
                "print",
                "lookup"
            ]
        }
    }
]);