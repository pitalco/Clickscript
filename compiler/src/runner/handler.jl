# everytime a new action is created, it must be added into the handler to actually run
# within the runner

include("../actions/print.jl")
include("../actions/var.jl")
include("../types.jl")

function Handler(action::Action)
    if action.action === "print"
        return ActionPrint(action)
    end
    if action.action === "var"
        return ActionVar(action)
    end
end