include("../parse/parser.jl")
include("../runner/handler.jl")

"""
    Runner(file_path::String, vars::Dict)::Bool
Runner is the main runner function for the Clickscript runtime. It returns true if successful
for testing purposes and throws an error if there is an error.

# Examples
```julia
julia> vars = Dict()
julia> Runner("./code.json", vars)
```
"""
    function Runner(file_path::String, vars::Dict)::Bool
    # parse the file provided via command line path
    raw_actions = ParseFile(file_path)
    # map all raw dicts to types for actions
    actions = ActionMapper.(raw_actions["script"])
    for action in actions
        Handler(action, vars)
    end
    return true
end