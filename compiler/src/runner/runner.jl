include("../parse/parser.jl")
include("../runner/handler.jl")

function Runner(vars::Dict)
    # parse the command line arguments (turns them into a Dict)
    parsed_args = parse_commandline()
    # parse the file provided via command line path
    raw_actions = ParseFile(parsed_args["path"])
    # map all raw dicts to types for actions
    actions = ActionMapper.(raw_actions["script"])
    for action in actions
        Handler(action, vars)
    end
end