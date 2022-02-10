import { writable } from 'svelte/store';

export const contents = writable([
    {
        "type": "folder",
        "fileName": "server",
        "ext": null,
        "contents": []
    },
    {
        "type": "file",
        "fileName": "main",
        "ext": "py",
        "contents": []
    }
]);