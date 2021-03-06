# ----------------------------------------------------------------
# (ƒ)(x) == (α -> β) -> α -> β == Modus Ponens

S = α -> β -> γ -> (α)(γ)((β)(γ))  # (α -> (β -> γ)) -> ((α -> β) -> (α -> γ))
K = α -> β -> α
I = (S)(K)(K)
KI = (K)(I)  # (S)(K)

ω = (S)(I)(I)
# Ω = (ω)(ω)
Y = ƒ -> (α -> (ƒ)(α)(α))(α -> (ƒ)(α)(α))

var = α -> β -> (β)(α)
B   = f -> g -> α -> (f)((g)(α))  # composition
B   = f -> g -> (f ∘ g)

# if P then Q else R == (P)(Q)(R)

# ----------------------------------------------------------------

Zero = (K)(I)
Succ = n -> γ -> α -> (γ)((n)(γ)(α))
Succ = n -> γ -> (γ) ∘ n(γ)

one   = (Succ)(Zero)
two   = (Succ)(one)
three = (Succ)(two)
four  = (Succ)(three)
five  = (Succ)(four)
toNum = n -> (n)(α -> α+1)(0)

P   = α -> β -> (α)(Succ)(β)
T   = (B)
POW = α -> β -> (β)(α)

# ----------------------------------------------------------------

tt  = (K)
ff  = (K)(I)
eq  = α -> β -> (α)(β)((N)(β))
N   = α -> (α)(ff)(tt)
∧   = α -> β -> (α)(β)(α)
∨   = α -> β -> (α)(α)(β)
XOR = α -> β -> (α)((N)(β))(β)
testbool = ƒ -> (ƒ)(true)(false)

# if P then Q else R === P -> Q -> R -> (P)(Q)(R)

# ----------------------------------------------------------------

×   = α -> β -> γ -> (γ)(α)(β)
nil = (K)
fst = (K)
snd = (KI)

(×)(two)(three)(snd) |> toNum

# ----------------------------------------------------------------

