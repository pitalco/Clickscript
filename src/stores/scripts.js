import { writable } from 'svelte/store';

export const popup = writable([
    {
        "type": "folder",
        "name": "server",
        "contents": {
            "filename": "index.py",
            "script": [
                "print",
                "lookup"
            ]
        }
    },
    {
        "type": "file",
        "name": "index.py",
        "contents": {
            "filename": "index.py",
            "script": [
                "print",
                "lookup"
            ]
        }
    }
]);