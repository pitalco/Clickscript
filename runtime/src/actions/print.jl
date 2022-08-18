include("../types.jl")

# ActionPrint runs the action for runtime. Returns true if successful for testing
# purposes. Throws exception if error
function ActionPrint(action::Action, vars::Dict)::Bool
    print = ""
    for arg in action.args
        # convert value into value as type
        arg = AsType(arg, vars)
        print = print * " " * arg.value
    end
    println(print)
    return true
end