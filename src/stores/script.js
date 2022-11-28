import { writable } from 'svelte/store';
import { Buffer } from 'buffer'
globalThis.Buffer = Buffer
import { actions } from '../actions/actions';

function createScript() {
    const { subscribe, set, update } = writable({
        "file_name": "file.click",
        "script": []
    });

    return {
        subscribe,
        addAction: (action, args = {}) => {
            update(a => {
                    a.script.push({
                        "action": {
                            "action": action,
                            "args": args
                        },
                        "notes": actions[action].description,
                        "line": a.script.length
                    })
                    return a
                }
            )
        },
        updateAction: (line, args) => {
            update(a => {
                    a.script[line].action.args = args
                    return a
                }
            )
        },
        set: (script) => set(script)
    }
}

export const script = createScript()