include("../types.jl")

function ActionVar(action::Action)
    var_name = filter(d -> d.name == "var_name", action.args)[1]
    var_value = filter(d -> d.name == "var_value", action.args)[1]
    var_name.value = var_value.value
    setfield!(var_name.value, :field, var_value.value)
    println(getfield(var_name.value, :field))
end