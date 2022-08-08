include("../types.jl")

function ActionVar(action::Action, vars::Dict)
    var_name = filter(d -> d.name == "var_name", action.args)[1]
    var_value = filter(d -> d.name == "var_value", action.args)[1]
    vars[var_name.value] = var_value.value
end