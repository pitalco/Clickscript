import { Buffer } from 'buffer'
globalThis.Buffer = Buffer

export const variable = (name, value) => {
    if (typeof name != "string") {
        throw Error("name must be type of string")
    }
    let json = {
        "name": name,
        "value": value
    }
    return {
        "action": "print",
        "args": json
    }
}