include("../types.jl")
include("../actions/print.jl")
include("../actions/var.jl")
include("../types.jl")

# this is the seperate handler for defining functions, running if statements, and while statements. 
# Replicates normal handler but seperate in case we want to customize and to avoid error
function InternalHandler(action::Action, vars::Dict)
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