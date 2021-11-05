# ----------------------------------------------------------------
# identity
I = x -> x

# Mockingbird
# self-application
M = ƒ -> ƒ(ƒ)
M(I)(1)

# Bluebird
# Composition
B = ƒ -> g -> x -> ƒ(g(x))
# == ƒ -> g -> x -> (ƒ ∘ g)(x)

# Loop
# Base Recursion
L = (x -> (x)(x))(x -> (x)(x))
L = M(M)

# Y Combinator
# Recursive Combinator
Y = ƒ -> (x -> ƒ(x)(x))(x -> ƒ(x)(x))

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
C = ƒ -> x -> y -> ƒ(y)(x)

# Thrush
# assignement
T = x -> y -> (y)(x)

# Vireo
# Cartesian product using Closures
V = x -> y -> ƒ -> ƒ(x)(y)

# fst & snd
fst = x -> x(K)
snd = x -> x(K(I))

S = x -> y -> z -> (x)(z)(y(z))
S(K)(K)(6)

ι = x -> x(S)(K)

# ----------------------------------------------------------------

# true
K = x -> y -> x

# false
KI = x -> y -> y

# Not
N = b -> b(KI)(K)
N = b -> C(b)(K)(KI)
N(K)(1)(0)
N(K)(K)(KI)(1)(0)

# And
∧ = x -> y -> x(y)(x)
∧(K)(K)(1)(0)

# Or
∨ = x -> y -> x(x)(y)
∨(KI)(KI)(1)(0)

# Equality
t = x -> y -> x(y)(N(y))
t(KI)(KI)(1)(0)

# XOR
XOR = x -> y -> x(N(y))(y)
XOR(KI)(K)(1)(0)

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


