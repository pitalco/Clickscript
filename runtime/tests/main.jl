using Test

@testset verbose = true "Runtime Tests" begin
    include("actions-test.jl")
    include("parse-test.jl")
    include("runner-test.jl")
end