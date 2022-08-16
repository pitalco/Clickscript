include("../types.jl")
include("./print.jl")
include("./var.jl")
include("../types.jl")
include("./handler.jl")

# ActionDefineFunction defines a function via a list of actions in the memory store
function ActionDefineFunction(action::Action, vars::Dict)
    var_name = filter(d -> d.name == "var_name", action.args)[1]
    vars[var_name.value] = action.actions
end

# ActionRunFunction runs a function via a list of actions in the memory store
function ActionRunFunction(action::Action, vars::Dict)
    var_name = filter(d -> d.name == "var_name", action.args)[1]
    for action in vars[var_name.value]
        InternalHandler(action, vars)
    end
end