using JSON
include("../types.jl")

function ParseFile(path::String="./")
    # read the code JSON file and pipe it to json parser
    items = read(path, String) |> JSON.parse
    return items
end

# ActionMapper maps all raw Action Dicts to Action type
function ActionMapper(action::Dict)
    return Action(action["order"], action["action"], ArgMapper.(action["args"]), action["actions"])
end

# ArgMapper maps all raw Arg Dicts to Arg type
function ArgMapper(arg::Dict)
    return Arg(arg["arg_name"], arg["arg_value"], arg["arg_type"], nothing)
end