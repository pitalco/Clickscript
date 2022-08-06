include("../types.jl")

function ActionVar(action::Action)
    var_name = filter(d -> d.name == "var_name", action.args)[1]
    var_value = filter(d -> d.name == "var_value", action.args)[1]
    println(var_name.value * " = " * var_value.value)
    println(Meta.parse(var_name.value * " = " * var_value.value))
end