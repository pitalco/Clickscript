include("./handler.jl")

function ActionFor(action::Action, vars::Dict)
    # get the iterator list from the action args
    list = filter(d -> d.name == "var_iterator", action.args)[1]
    # add the current iterator as an arg in the action.args
    for item in list
        # run through each nested action item as loop. Each item referenced must be var type
        # for proper lookup in the vars list
    end
end

function ActionWhile(action::Action, vars::Dict)
    # get the iterator list from the action args
    list = filter(d -> d.name == "var_iterator", action.args)[1]
    # get the statement action to rerun at the end of each while statement
    statement::Bool = InternalHandler(action, vars)
    # add the current iterator as an arg in the action.args
    while statement
        # run through each nested action item as loop. Each item referenced must be var type
        # for proper lookup in the vars list
    end
end