include("../types.jl")

function ActionEqual(x, y)
    return x == y
end

function ActionNEqual(x, y)
    return x != y
end

function ActionGT(x, y)
    return x > y
end

function ActionGTE(x, y)
    return x >= y
end

function ActionLT(x, y)
    return x < y
end

function ActionLTE(x, y)
    return x <= y
end
