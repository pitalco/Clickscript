include("./handler.jl")

macro if(action::Action, vars::Dict)
    result::Bool = InternalHandler(action, vars)
   :(
    if result
        InternalHandler(action.actions)
    end
   )
end

macro ifelse(action::Action, vars::Dict)
    :(
     if
     else
     end
    )
 end
