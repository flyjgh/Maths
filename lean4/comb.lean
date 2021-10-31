universe u

variable (X : Type)

def I (x : X) := x

def K (x y : X) := id x

def S (x : X -> X -> X) (y : X -> X) (z : X)  := (x z) (y z)


structure Monoid (α : Type) where
    comb : α -> α -> α
    id   : α -> α
    def mkMonoid (comb : α -> α -> α) : Monoid α :=
        { comb := comb, id := λ x => x }

#check Monoid
#check @Monoid.comb

#check (mkMonoid (λ a b : Nat => a + b)).comb
#eval (mkMonoid (λ a b : Nat => a + b)).comb 5 5
#eval (mkMonoid (λ a b : Nat => a + b)).id 3
