include("../types.jl")
include("../actions/print.jl")
include("../actions/var.jl")
include("../types.jl")

# this is the function handler for defining functions. Replicates normal handler
# but seperate in case we want to customize
function Handler(action::Action, vars::Dict)
    if action.action === "print"
        return ActionPrint(action, vars)
    end
    if action.action === "var"
        return ActionVar(action, vars)
    end
    if action.action === "define"
        return ActionDefineFunction(action, vars)
    end
    if action.action === "run"
        return ActionRunFunction(action, vars)
    end
end

# ActionDefineFunction defines a function via a list of actions in the memory store
function ActionDefineFunction(action::Action, vars::Dict)
    var_name = filter(d -> d.name == "var_name", action.args)[1]
    vars[var_name.value] = action.actions
end

# ActionRunFunction runs a function via a list of actions in the memory store
function ActionRunFunction(action::Action, vars::Dict)
    var_name = filter(d -> d.name == "var_name", action.args)[1]
    for action in vars[var_name.value]
        Handler(action, vars)
    end
end