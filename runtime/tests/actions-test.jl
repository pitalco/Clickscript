using Test
include("../src/types.jl")
include("../src/actions/print.jl")
include("../src/actions/compare.jl")

############# Variables For Testing #############

# Print Action Test Objects
PrintTestArg = Arg("test", "value", "string", "value")
PrintTestAction = Action(1, "print", [PrintTestArg], [])

# Equal Compare Action Test Objects
EqualTestArg1True = Arg("test", 1, "number", nothing)
EqualTestArg2True = Arg("test", 1, "number", nothing)
EqualTestArg1False = Arg("test", 1, "number", nothing)
EqualTestArg2False = Arg("test", 2, "number", nothing)
EqualTestActionTrue = Action(1, "equal", [EqualTestArg1True, EqualTestArg2True], [])
EqualTestActionFalse = Action(1, "equal", [EqualTestArg1False, EqualTestArg2False], [])

#####################################################

@testset "Runtime Actions" begin
    @test ActionPrint(PrintTestAction, Dict())
    @test ActionEqual(EqualTestActionTrue, Dict()) == true
    @test ActionEqual(EqualTestActionFalse, Dict()) == false
end