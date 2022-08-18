include("../types.jl")

function ActionEqual(action::Action, vars::Dict)
    x = action.args[1]
    x = AsType(x, vars)
    y = action.args[2]
    y = AsType(y, vars)
    return x.valueastype == y.valueastype
end

function ActionNEqual(action::Action, vars::Dict)
    x = action.args[1]
    x = AsType(x, vars)
    y = action.args[2]
    y = AsType(y, vars)
    return x.valueastype != y.valueastype
end

function ActionGT(action::Action, vars::Dict)
    x = action.args[1]
    x = AsType(x, vars)
    y = action.args[2]
    y = AsType(y, vars)
    return x.valueastype > y.valueastype
end

function ActionGTE(action::Action, vars::Dict)
    x = action.args[1]
    x = AsType(x, vars)
    y = action.args[2]
    y = AsType(y, vars)
    return x.valueastype >= y.valueastype
end

function ActionLT(action::Action, vars::Dict)
    x = action.args[1]
    x = AsType(x, vars)
    y = action.args[2]
    y = AsType(y, vars)
    return x.valueastype < y.valueastype
end

function ActionLTE(action::Action, vars::Dict)
    x = action.args[1]
    x = AsType(x, vars)
    y = action.args[2]
    y = AsType(y, vars)
    return x.valueastype <= y.valueastype
end
