mutable struct Arg
    name::String
    value::String
    type::String
    ValueAsType::Any
end

mutable struct Action
    order::Int64
    action::String
    args::Array{Arg}
    actions::Array{Action}
end