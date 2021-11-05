using Base: @pure
foldr(+, 0:4)
map(+, 1:4)
filter(>=(3), 1:4)

@pure f(x) = x

# ----------------------------------------------------------------
# currying

f = x::Int -> y::Int -> z::Int -> 6x^2 + 4y + z
f3 = f(3)
f36 = f3(6)
f369 = f36(9)

(⇀)(x, ƒ) = (args...) -> ƒ(x, args...)
(⤏)(ƒ, x...) = (args...) -> ƒ(x..., args...)

g(a,b,c) = a + b + c
(2 ⇀ g)(3, 5)
(2 ⇀ 3 ⇀ g)(5)
(2 ⇀ 3 ⇀ 5 ⇀ g)()

ff(x,y,z) = 6x^2 + 4y + z
⤏(ff,2)(3,4)
⤏(ff,2,3)(4)
⤏(ff,2,3,4)()

double = 2 ⇀ * 
double(5)

struct Curried end
macro (⇀)(fdef)
    f = fdef.args[1].args[1]
    fargs = fdef.args[1].args[2:end]
    arity = length(fargs)
    body = fdef.args[2]
    err_str = "Too many arguments. Function $f only takes $arity arguments"
    quote 
        begin 
        function $f(args...)
            if length(args) < $arity
                x -> $f((args..., x)...)
            elseif length(args) == 3
                $f(Curried(), args...)
            else
                throw($err_str)
            end
        end
        $f(::Curried, $(fargs...)) = $body
        end
    end |> esc
end

@⇀ h(a,b,c) = a+b+c

h(2)(3)(5)
h(2,3)(4)

# ----------------------------------------------------------------

struct Fun
    ƒ
end

Base.iterate(f::Fun, i) = f.ƒ.(i)
Base.getindex(f::Fun, i::Int) = f.ƒ(i)
Base.getindex(f::Fun, r::AbstractRange) = f.ƒ.(r)
Base.getindex(f::Fun, a::AbstractArray) = f.ƒ.(a)

sqr = Fun(x->√x)
sqr(10)

struct Memoize
    ƒ
    lookup
    Memoize(ƒ::Function) = new(ƒ, Pair[])
end

look(lookup, x...) = [x == elem.first for elem ∈ lookup]

ƒ(x) = 2x^2
M = Memoize(ƒ)

function (m::Memoize)(args...)
    (length(m.lookup) != 0) && (1 ∈ ∪(look(m.lookup, args))) ?
        m.lookup[look(m.lookup, args)].second :
        begin
            answer = m.ƒ(args...)
            append!(m.lookup, args => answer)
            return answer
        end
end
push!([], (6) => ans)
M(6)
