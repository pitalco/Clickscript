using ArgParse
include("parse/parser.jl")
include("runner/handler.jl")

function parse_commandline()
    s = ArgParseSettings()

    @add_arg_table s begin
        "path"
            help = "Parse and then run the Clickscript JSON file provided"
            required = true
    end

    return parse_args(s)
end

function ParseAndRun()
    # parse the command line arguments (turns them into a Dict)
    parsed_args = parse_commandline()
    # parse the file provided via command line path
    raw_actions = ParseFile(parsed_args["path"])
    # map all raw dicts to types for actions
    actions = ActionMapper.(raw_actions["script"])
    for action in actions
        Handler(action)
    end
end

ParseAndRun()
