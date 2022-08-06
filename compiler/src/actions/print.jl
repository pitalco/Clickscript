include("../types.jl")

function ActionPrint(action::Action)
    print = ""
    for arg in action.args
        print = print * " " * arg.value
    end
    println(print)
    return
end