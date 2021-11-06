import Lean

universe u

section natural

    inductive ℕ : Type
        | Z : ℕ
        | S : ℕ -> ℕ

    def SZ   : ℕ := (ℕ.S ℕ.Z)
    def SSZ  : ℕ := (ℕ.S SZ)
    def SSSZ : ℕ := (ℕ.S SSZ)


    def P (k l : ℕ) : ℕ := match k with
        | ℕ.Z   => l
        | ℕ.S k => ℕ.S (P k l)

    def T (k l : ℕ) : ℕ := match k with
        | ℕ.Z => ℕ.Z
        | ℕ.S k => P l (T k l)

    def PW (k l : ℕ) : ℕ := match k, l with
        | _, ℕ.Z     => (ℕ.S ℕ.Z)
        | k, ℕ.S l   => T k (PW k l)


    def T2 : ℕ -> ℕ := T (ℕ.S (ℕ.S ℕ.Z))
    -- ==
    def T2_2 := (T · (ℕ.S (ℕ.S ℕ.Z)))

    def SQ n := (T n n)
    -- ==
    def SQ2 n := (PW · (ℕ.S (ℕ.S ℕ.Z))) n
    -- ≈
    def SQ3 n := (T · ·) n -- not good

    infixl:65 " + " => P
    notation:64 n:64"+" => P n
    notation:64 "+"m:65 => (P · m)
    infixl:70 " * " => T
    notation:64 n:64"*" => T n
    notation:64 "*"m:65 => (T · m)
    infixl:80 " ^ " => PW
    notation:79 n:80"^" => PW n
    notation:79 "^"m:79 => (PW · m)
    postfix:80 "²" => SQ


    #check  SSZ ^
    #check  ^ SSZ
    #check  SSZ ^ SSZ

    #check  T (SZ²)
    #check  (SZ² * ·)
    #check (SQ ∘ P SSZ)
    #reduce SSZ ^ SSSZ
    #reduce + SSZ²²
    #reduce (SQ ∘ SQ ∘ (* SSZ)) SZ
    #reduce T2 (ℕ.S ℕ.Z) = T2_2 (ℕ.S ℕ.Z)

    #check (T · (ℕ.S (ℕ.S ℕ.Z)))


    -- theorem NT1EQN : ∀ α : ℕ, (T α (ℕ.S ℕ.Z)) = (α) :=
        -- λ (a : ℕ) => sorry

end natural

section prop

    variable (p q r : Prop)
    variable (hp : p)

    axiom devl : (p q r : Prop) -> (p ∧ q ∨ r) -> (p ∧ r ∨ q ∧ r)
    #check devl
    #check devl p
    #check devl p q
    #check devl p q r
        
    theorem t0 : p -> q -> p := by
        intro hp
        intro hq
        exact hp

    theorem t1 : p -> q -> p :=
        λ hp => λ hq => hp
    -- ==
    theorem t2 (hp : p) (hq : q) : p := hp
    -- ==
    theorem t3 : q -> p := λ hq => hp
    -- ≈    
    def t4     : q -> p := λ hq => hp

    theorem t5 {p q : Prop} (hp : p) (hq : q) : p := hp
    -- ≈
    theorem t6 {p q : Prop} : (hp : p) -> (hq : q) -> p :=
        λ {α : p} {β : q} => α

    theorem t7 (hα : α) (hβ : β) : α := hα
    -- ==
    theorem t8 : (hα : α) -> (hβ : β) -> α := λ hα hβ => hα

    #reduce t4 p
    #print t1
    #check t2 p
    #check t3 _ p
    #check t1 
    #check @t7.{0,0}
    #check t4
    #print t1
    #print t4

    theorem pcomp (α₁ : q -> r) (α₂ : p -> q) : (p -> r) :=
        λ α₃ : p => α₁ (α₂ α₃)
    -- ==
    theorem pcomp2 : (q -> r) -> (p -> q) -> (p -> r) :=
        λ {α₁ : q -> r} {α₂ : p -> q} α₃ : p => α₁ (α₂ α₃)

    #check pcomp
    #check pcomp2

    #check λ (h₁ : p) (h₂ : q) => And.intro h₁ h₂

    theorem inv (α : p ∧ q) : q ∧ p :=
        And.intro α.right α.left

    theorem inv2 : (p ∧ q) -> (q ∧ p) :=
        λ α : p ∧ q => And.intro α.right α.left

    #check inv _ q
    #check inv2 _ q

    theorem testinv (x : Bool) : (x ∧ true) -> (true ∧ x) := match x with
        | true  => inv true _
        | false => inv _ _
    -- ==
    theorem testinv2 (x : Bool) : (x ∧ true) -> (true ∧ x) :=
        inv _ true

    #check testinv2 false

    -- theorem eqinv (p q) : (p ∧ q) = (q ∧ p) := sorry

end prop



