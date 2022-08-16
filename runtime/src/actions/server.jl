using Genie

# adds a server route from a Clickscript action
function ActionAddServerRoute()
    route("/hello") do
        "Hello World"
    end
end

# starts up the the server as a Genie server
function ActionStartServer()
    up()
end