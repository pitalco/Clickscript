include("../types.jl")

# ActionVar runs the var action for runtime. Returns true if successful for testing
# purposes. Throws exception if error
function ActionVar(action::Action, vars::Dict)::Bool
    var_name = filter(d -> d.name == "var_name", action.args)[1]
    var_value = filter(d -> d.name == "var_value", action.args)[1]
    vars[var_name.value] = var_value.value
    return true
end