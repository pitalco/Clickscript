using Test
include("../src/actions/print.jl")
include("../src/types.jl")

PrintTestValue = Param("test", "value", "string", "value")

ActionPrint(PrintTestValue)