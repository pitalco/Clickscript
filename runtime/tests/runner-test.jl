using Test
include("../src/cli.jl")
include("../src/types.jl")
include("../src/runner/runner.jl")

# set a test memory store for all in memory variables
vars = Dict()

@testset "Runtime Runner" begin
    @test Runner("runtime/code.json", vars)
end