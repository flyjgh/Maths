struct Zero
    n::Int
end

struct Succ
    n::Function
end

struct ℕ
    n::Union{Zero,Succ}
end

# ----------------------------------------------------------------

z     = x -> y -> y
one   = x -> x
two   = ƒ -> x -> ƒ(x)
three = ƒ -> x -> ƒ(ƒ(x))

Z = x -> y -> y
S = n -> ƒ -> x -> ƒ((n)(ƒ)(x))
B = ƒ -> g -> x -> ƒ(g(x))
# S = n -> ƒ -> B(ƒ)(n(ƒ))

toNum = n -> n(x -> x+1)(0)
one   = S(Z)
two   = S(one)
three = S(two)
four  = S(three)

toNum(S(four))

P = x -> y -> (x)(S)(y)
T = B  # Composition
POW = x -> y -> (y)(x)

P(four)(four) |> toNum
T(S(four))(two) |> toNum
POW(S(four))(two) |> toNum

# Cartesian Prod
V = x -> y -> ƒ -> ƒ(x)(y)

V(two)(three)(P) |> toNum
