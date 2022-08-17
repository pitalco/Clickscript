using ArgParse

function parse_commandline()
    s = ArgParseSettings()

    @add_arg_table s begin
        "path"
            help = "Parse and then run the Clickscript JSON file provided"
            required = true
    end

    return parse_args(s)
end