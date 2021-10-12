export const actions = {
    "print": {
        "name": "Print to console",
        "description": "Print the provided input to the console.",
        "functions": {
            "python": {
                "inputs": [
                    {
                        "name": "Input",
                        "type": "any"
                    }
                ],
                "outputs": [
                    {
                        "name": "Output",
                        "type": "any"
                    }
                ],
                "function": (input) => {
                    return `print(` + input + `)`
                }
            },
            "nodejs": {
                "inputs": [
                    {
                        "name": "Input",
                        "type": "any"
                    }
                ],
                "outputs": [
                    {
                        "name": "Output",
                        "type": "any"
                    }
                ],
                "function": (input) => {
                    return `console.log(` + input + `)`
                }
            }
        }
    },
}