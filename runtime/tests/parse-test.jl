using Test
include("../src/types.jl")
include("../src/parse/parser.jl")

@testset "Runtime Parser" begin
    @test typeof(ParseFile("./runtime/code.json")) == Dict{String, Any}
end