# ----------------------------------------------------------------
# identity
I = x -> x

# Mockingbird
# self-application
M = ƒ -> (ƒ)(ƒ)
M(I)(1)

# Bluebird
# Composition
B = ƒ -> g -> x -> (ƒ)((g)(x))
# == ƒ -> g -> x -> (ƒ ∘ g)(x)

# Loop
# Base Recursion
L = (x -> (x)(x))(x -> (x)(x))
L = M(M)

# Y Combinator
# Recursive Combinator
Y = ƒ -> (x -> (ƒ)(x)(x))(x -> (ƒ)(x)(x))

# Kestrel
# true
K = x -> y -> x

# Kite
# false
KI = x -> y -> y
# == (K)(I) == (C)(K)
KI(5)(6)
KI(K)(KI)(5)(6)

# Cardinal
C = ƒ -> x -> y -> (ƒ)(y)(x)

# Thrush
# assignement
T = x -> y -> (y)(x)

# Vireo
# Cartesian product using Closures
V = x -> y -> ƒ -> (ƒ)((x)(y))

# fst & snd
fst = x -> (x)(K)
snd = x -> (x)((K)(I))

S = x -> y -> z -> (x)(z)((y)(z))
S(K)(K)(6)

ι = x -> x(S)(K)

# ----------------------------------------------------------------

# true
tt = x -> y -> x

# false
ff = x -> y -> y

# Not
N = b -> (b)(ff)(tt)
N = b -> (C)(b)(tt)(ff)
N(tt)(1)(0)

# And
∧ = x -> y -> (x)(y)(x)
∧(tt)(tt)(1)(0)

# Or
∨ = x -> y -> (x)(x)(y)
∨(ff)(ff)(1)(0)

# Equality
t = x -> y -> (x)(y)((N)(y))
t(ff)(ff)(1)(0)

# XOR
XOR = x -> y -> (x)((N)(y))(y)
XOR(ff)(tt)(1)(0)

# ----------------------------------------------------------------
# S K combinators
# (ƒ)(x) == (α -> β) -> α -> β == Modus Ponens

S = x -> y -> z -> (x)(z)((y)(z))
K = x -> y -> x
I = (S)(K)(K)
ω = (S)(I)(I)
# Ω = (ω)(ω)

(I)(K)(I)(1)(0)
tt = (K)
ff = (S)(K)
Not = x -> (x)(ff)(tt)
∧ = x -> y -> (x)(y)(x)
∨ = x -> y -> (x)(x)(y)
testbool(ƒ) = ƒ(1)(0)

(Not)(tt) |> testbool
# ----------------------------------------------------------------
# ----------------------------------------------------------------
# Kestrel variant
K = (x,y) -> x
# == true

# Kite variant
KI = (x,y) -> y
# == ⇀(K,I) == KI
# == ⇀(C,K) == CK
# == false
⇀(KI,5)(6)
KI(K,KI)(5,6)

# Loop
# Base Recursion
L = (x -> x(x))(x -> x(x))
L = M(M)

# Y Combinator
# Recursive Combinator
Y = ƒ -> (x -> ƒ(x(x)))(x -> ƒ(x(x)))

# Bluebird
B = (ƒ,g,x) -> ƒ(g(x))

# Not
N = b -> b(KI,K)
N = b -> C(b,K,KI)
N(K)(1,0)
N(K)(K,KI)(1,0)

# And
∧ = (x,y) -> x(y,x)
(K ∧ K)(1,0)

# Or
∨ = (x,y) -> x(x,y)
(KI ∨ KI)(1,0)

# Equality
t = (x,y) -> x(y,N(y))
t(KI,KI)(1,0)

# XOR
XOR = (x,y) -> x(N(y), y)
XOR(KI,K)(1,0)

# Cardinal
C = (ƒ,x,y) -> ƒ(y,x)
# ----------------------------------------------------------------

struct ƒ λ end

Base.show(io::IO, ƒ) = toNum(ƒ.λ);

var = ƒ(α::ƒ -> β::ƒ -> (β.λ)(α.λ));
×   = ƒ(α::ƒ -> β::ƒ -> γ::ƒ -> (γ.λ)(α.λ)(β.λ));
∘   = ƒ(γ::ƒ -> g::ƒ -> α::ƒ -> (γ.λ)((g.λ)(α.λ)));

I = ƒ(α::ƒ -> α.λ);
Y = ƒ(γ::ƒ -> (α::ƒ -> (γ.λ)(α.λ)(α.λ))(α::ƒ -> (γ.λ)(α.λ)(α.λ)));

Z = ƒ(α::ƒ -> β::ƒ -> β.λ.λ);
S = ƒ(n::ƒ -> γ::ƒ -> α::ƒ -> (γ.λ)((n.λ)(γ.λ)(α.λ)));
S = ƒ(n::ƒ -> γ::ƒ -> comp(γ.λ)((n.λ)(γ.λ)));

one   = (S.λ)(Z);
two   = (S.λ)(one);
three = (S.λ)(two.λ);
ƒour  = (S.λ)(three.λ);
ƒive  = (S.λ)(ƒour.λ);
toNum = ƒ(n::ƒ -> (n.λ)(α -> α+1)(0));

+ = ƒ(α::ƒ -> β::ƒ -> (α.λ)(S.λ)(β.λ))
* = comp
^ = ƒ(α::ƒ -> β::ƒ -> (β.λ)(α.λ))

tt  = ƒ(α::ƒ -> β::ƒ -> α.λ)
ff  = ƒ(α::ƒ -> β::ƒ -> β.λ)
Not = ƒ(α::ƒ -> (α.λ)(ff.λ)(tt.λ))
∧   = ƒ(α::ƒ -> β::ƒ -> (α.λ)(β.λ)(α.λ))
∨   = ƒ(α::ƒ -> β::ƒ -> (α.λ)(α.λ)(β.λ))
==  = ƒ(α::ƒ -> β::ƒ -> (α.λ)(β.λ)((Not.λ)(β.λ)))

# ----------------------------------------------------------------
