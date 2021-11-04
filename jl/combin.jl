# ----------------------------------------------------------------
# identity
I = x -> x

# Mockingbird
# self-application
M = ƒ -> ƒ(ƒ)
M(I)(1)

# Loop
# Base Recursion
L = (x -> x(x))(x -> x(x))
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
# == K(I) == C(K)

KI(5)(6)
KI(K)(KI)(5)(6)

# Cardinal
C = ƒ -> x -> y -> ƒ(y)(x)

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

S = x -> y -> z -> x(z)(y(z))
S(K)(K)(6)

ι = x -> x(S)(K)

# ----------------------------------------------------------------
# Kestrel variant
K = (x,y) -> x
# == true

# Kite variant
KI = (x,y) -> y
# == I ⇀ K == ⤏(K,I) == KI
# == K ⇀ C == ⤏(C,K) == CK
# == false
(5 ⇀ KI)(6)
⤏(KI,5)(6)
KI(K,KI)(5,6)

# Loop
# Base Recursion
L = (x -> x(x))(x -> x(x))
L = M(M)

# Y Combinator
# Recursive Combinator
Y = ƒ -> (x -> ƒ(x(x)))(x -> ƒ(x(x)))

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


