mutable struct Arg
    name::String
    value::String
    type::String
    valueastype::Any
end

mutable struct Action
    order::Int64
    action::String
    args::Array{Arg}
    actions::Array{Action}
end

function AsType(arg::Arg, vars::Dict)
    if arg.type == "variable"
        arg.valueastype = vars[arg.value]
    else
        arg.valueastype = arg.value
    end
    return arg
end