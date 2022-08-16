include("../types.jl")

macro equal(x, y)
    return :( $x == $y )
end

macro nequal(x, y)
    return :( $x != $y )
end

macro gt(x, y)
    return :( $x > $y )
end

macro gte(x, y)
    return :( $x >= $y )
end

macro lt(x, y)
    return :( $x < $y )
end

macro lte(x, y)
    return :( $x <= $y )
end
