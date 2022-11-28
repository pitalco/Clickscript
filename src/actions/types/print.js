import { Buffer } from 'buffer'
globalThis.Buffer = Buffer

export const print = (values = []) => {
    let json = {
        "values": values,
    }
    return {
        "action": "print",
        "args": json
    }
}