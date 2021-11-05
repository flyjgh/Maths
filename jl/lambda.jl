# ----------------------------------------------------------------

var = α -> β -> (β)(α)
×   = α -> β -> γ -> (γ)(α)(β)
∘   = γ -> g -> α -> (γ)((g)(α))

I   = α -> α
Y   = γ -> (α -> (γ)(α)(α))(α -> (γ)(α)(α))

Z     = α -> β -> β
S     = n -> γ -> α -> (γ)((n)(γ)(α))
S     = n -> γ -> ∘(γ)((n)(γ))

one   = (S)(Z)
two   = (S)(one)
three = (S)(two)
four  = (S)(three)
five  = (S)(four)
toNum = n -> (n)(α -> α+1)(0)

P     = α -> β -> (α)(S)(β)
T     = ∘
POW   = α -> β -> (β)(α)

tt  = α -> β -> α
ff  = α -> β -> β
Not = α -> (α)(ff)(tt)
∧   = α -> β -> (α)(β)(α)
∨   = α -> β -> (α)(α)(β)
==  = α -> β -> (α)(β)((Not)(β))
Not(tt)(1)(0)

# ----------------------------------------------------------------