I(x) = x

K(x,y) = x

S(x,y,z) = x(z)(y(z))

ι(x) = x(SK)

struct Zero
    n::Int
end

struct Succ
    n::Function
end
struct ℕ
    n::Union{Zero,Succ}
end

struct Monoid{T}
    ×
    id
end

Monoid{ℕ}(Succ(Zero), Zero)

# dependent dispatch
f(x) = x^3
f(::Val{:2}) = 8
@code_typed f(Val(2))

