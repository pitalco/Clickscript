include("runner/runner.jl")
include("cli.jl")

function main()
    # parse the command line arguments (turns them into a Dict)
    parsed_args = parse_commandline()
    path = parsed_args["path"]
    # set a memory store for all in memory variables
    vars = Dict()
    # run the code runner and parser
    Runner(path, vars)
end

main()
