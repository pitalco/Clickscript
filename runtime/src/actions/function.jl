include("../types.jl")
include("./print.jl")
include("./var.jl")
include("../types.jl")
include("./handler.jl")

# ActionDefineFunction defines a function via a list of actions in the memory store
function ActionDefineFunction(action::Action, vars::Dict)::Bool
    var_name = filter(d -> d.name == "var_name", action.args)[1]
    vars[var_name.value] = action.actions
    return true
end

# ActionRunFunction runs a function via a list of actions in the memory store. Returns true if sucessful
# for testing purposes and throws error if there is an error
function ActionRunFunction(action::Action, vars::Dict)::Bool
    var_name = filter(d -> d.name == "var_name", action.args)[1]
    for action in vars[var_name.value]
        InternalHandler(action, vars)
    end
    return true
end