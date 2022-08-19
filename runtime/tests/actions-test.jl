using Test
include("../src/types.jl")
include("../src/actions/print.jl")
include("../src/actions/var.jl")
include("../src/actions/compare.jl")
include("../src/actions/function.jl")
include("../src/actions/loops.jl")

############# Variables For Testing #############

# Print Action Test Objects
PrintTestArg = Arg("test", "value", "string", "value")
PrintTestAction = Action(1, "print", [PrintTestArg], [])

# Var Action Test Objects
VarTestArgName = Arg("var_name", "x", "string", "value")
VarTestArgValue = Arg("var_value", "value", "string", "value")
VarTestAction = Action(1, "print", [VarTestArgName, VarTestArgValue], [])

# Function Define Action Test Objects
DefineTestArgName = Arg("var_name", "x", "string", "value")
DefineTestAction = Action(1, "define", [DefineTestArgName], [PrintTestAction])
# Function Run Action Test Objects
RunTestArgName = Arg("var_name", "x", "function", "value")
RunTestAction = Action(1, "run", [RunTestArgName], [])

# Equal Compare Action Test Objects
EqualTestArg1True = Arg("test", "1", "number", nothing)
EqualTestArg2True = Arg("test", "1", "number", nothing)
EqualTestArg1False = Arg("test", "1", "number", nothing)
EqualTestArg2False = Arg("test", "2", "number", nothing)
EqualTestActionTrue = Action(1, "equal", [EqualTestArg1True, EqualTestArg2True], [])
EqualTestActionFalse = Action(1, "equal", [EqualTestArg1False, EqualTestArg2False], [])

# Not Equal Compare Action Test Objects
NEqualTestArg1True = Arg("test", "1", "number", nothing)
NEqualTestArg2True = Arg("test", "2", "number", nothing)
NEqualTestArg1False = Arg("test", "1", "number", nothing)
NEqualTestArg2False = Arg("test", "1", "number", nothing)
NEqualTestActionTrue = Action(1, "nequal", [NEqualTestArg1True, NEqualTestArg2True], [])
NEqualTestActionFalse = Action(1, "nequal", [NEqualTestArg1False, NEqualTestArg2False], [])

# Greater Than Compare Action Test Objects
GTTestArg1True = Arg("test", "2", "number", nothing)
GTTestArg2True = Arg("test", "1", "number", nothing)
GTTestArg1False = Arg("test", "1", "number", nothing)
GTTestArg2False = Arg("test", "2", "number", nothing)
GTTestActionTrue = Action(1, "gt", [GTTestArg1True, GTTestArg2True], [])
GTTestActionFalse = Action(1, "gt", [GTTestArg1False, GTTestArg2False], [])

# Greater Than Equal Compare Action Test Objects
GTETestArg1True = Arg("test", "2", "number", nothing)
GTETestArg2True = Arg("test", "1", "number", nothing)
GTETestArg1False = Arg("test", "1", "number", nothing)
GTETestArg2False = Arg("test", "2", "number", nothing)
GTETestActionTrue = Action(1, "gt", [GTETestArg1True, GTETestArg2True], [])
GTETestActionFalse = Action(1, "gt", [GTETestArg1False, GTETestArg2False], [])

# Lesser Than Compare Action Test Objects
LTTestArg1True = Arg("test", "1", "number", nothing)
LTTestArg2True = Arg("test", "2", "number", nothing)
LTTestArg1False = Arg("test", "2", "number", nothing)
LTTestArg2False = Arg("test", "1", "number", nothing)
LTTestActionTrue = Action(1, "lt", [LTTestArg1True, LTTestArg2True], [])
LTTestActionFalse = Action(1, "lt", [LTTestArg1False, LTTestArg2False], [])

# Lesser Than Equal Compare Action Test Objects
LTETestArg1True = Arg("test", "1", "number", nothing)
LTETestArg2True = Arg("test", "2", "number", nothing)
LTETestArg1False = Arg("test", "2", "number", nothing)
LTETestArg2False = Arg("test", "1", "number", nothing)
LTETestActionTrue = Action(1, "lte", [LTETestArg1True, LTETestArg2True], [])
LTETestActionFalse = Action(1, "lte", [LTETestArg1False, LTETestArg2False], [])

#####################################################

@testset "Runtime Actions" begin
    @test ActionPrint(PrintTestAction, Dict()) == true
    @test ActionVar(VarTestAction, Dict()) == true
    @test ActionDefineFunction(DefineTestAction, Dict()) == true
    @test ActionRunFunction(RunTestAction, Dict("x" => [PrintTestAction])) == true
    @test ActionFor(ForTestAction, Dict()) == true
    @test ActionWhile(ForTestAction, Dict()) == true
    @test ActionEqual(EqualTestActionTrue, Dict()) == true
    @test ActionEqual(EqualTestActionFalse, Dict()) == false
    @test ActionNEqual(NEqualTestActionTrue, Dict()) == true
    @test ActionNEqual(NEqualTestActionFalse, Dict()) == false
    @test ActionGT(GTTestActionTrue, Dict()) == true
    @test ActionGT(GTTestActionFalse, Dict()) == false
    @test ActionGTE(GTETestActionTrue, Dict()) == true
    @test ActionGTE(GTETestActionFalse, Dict()) == false
    @test ActionLT(LTTestActionTrue, Dict()) == true
    @test ActionLT(LTTestActionFalse, Dict()) == false
    @test ActionLTE(LTETestActionTrue, Dict()) == true
    @test ActionLTE(LTETestActionFalse, Dict()) == false
end