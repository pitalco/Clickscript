include("../types.jl")

function ActionPrint(action::Action, vars::Dict)
    print = ""
    for arg in action.args
        # convert value into value as type
        arg = AsType(arg, vars)
        print = print * " " * arg.valueastype
    end
    println(print)
    return
end