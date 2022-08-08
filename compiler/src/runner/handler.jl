# everytime a new action is created, it must be added into the handler to actually run
# within the runner

include("../actions/print.jl")
include("../actions/var.jl")
include("../actions/function.jl")
include("../types.jl")

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
