import { writable } from 'svelte/store';

export const contents = writable([
    {
        "actionName": "var",
        "desc": "Set variable to 'name'",
        "actionNumber" : 1,
    },
    {
        "actionName": "print",
        "desc": "Print out contents",
        "actionNumber": 2,
    }
]);