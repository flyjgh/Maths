# Types    ≣ proposition
# programs ≣ proofs
# eval     ≣ simplification

# empty Type
# Union{}  (or struct end)  ≣ False

# singleton Type
# nothing                   ≣ True

# elem
# struct α end              ≣ Prop α              ≣ α
# a::α                      ≣ a ⊢ Prop α

# function application
# f(a::α)::β                ≣ α => β              ≣ α -> β
# ≣
# (a::α) -> b::β            ≣ α => (α => β) => β  ≣ α -> (α -> β) -> β  # MD
# ≣
# a::α |> (x -> b::β)       ≣ (α => β) => α => β  ≣ (α -> β) -> α -> β  # MD

# Cartesian product
# (a::α, b::β)              ≣ (α ∧ β)             ≣  (α × β)
# ((a::α, b::β)) -> a       ≣ (α ∧ β) => α        ≣ (α × β) -> α
# (a::α, b::β) -> (a,b)     ≣ α => β => (α ∧ β)   ≣ α -> β -> (α × β)
# ≣
# x -> (y -> (x, y))        ≣ α => (β => (α ∧ β)) ≣ α -> (β -> (α × β))

# proofs

# (g ∘ f)(x::α)::γ ≣ (α -> β) -> (β -> γ) -> α -> γ
