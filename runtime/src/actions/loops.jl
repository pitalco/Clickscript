include("./handler.jl")

# ActionFor runs the action for a for loop. Returns true if successful for testing
# purposes. Throws exception if error
function ActionFor(action::Action, vars::Dict)::Bool
    # get the iterator list from the action args
    list::Arg = filter(d -> d.name == "var_iterator", action.args)[1]
    # get the custom function name for the for loop
    func = filter(d -> d.name == "var_iterator_func", action.args)[1]
    # lookup the custom function actions from in memory vars
    func_actions::Array{Action} = vars[func]

    for item in list
        # add the current iterator as an arg in the action.args
        vars["for_iter_item"] = item
        # run through each nested action item as loop. Each item referenced must be var type
        # for proper lookup in the vars list
        for act in func_actions
            InternalHandler(act, vars)
        end
    end

    return true
end

# ActionWhile runs the action for a while loop. Returns true if successful for testing
# purposes. Throws exception if error
function ActionWhile(action::Action, vars::Dict)::Bool
    # get the custom function name for the for loop
    func = filter(d -> d.name == "var_iterator_func", action.args)[1]
    # lookup the custom function actions from in memory vars
    func_actions::Array{Action} = vars[func]
    # get the statement action to rerun at the end of each while statement
    statement::Bool = InternalHandler(action, vars)

    while statement
        # run through each nested action item as loop. Each item referenced must be var type
        # for proper lookup in the vars list
        for act in func_actions
            InternalHandler(act, vars)
        end
        # rerun statement to be evaluated for next loop
        statement::Bool = InternalHandler(action, vars)
    end

    return true
end