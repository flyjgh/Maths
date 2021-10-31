

inductive ℕ : Type
    | Z : ℕ
    | S : ℕ -> ℕ

def Z   : ℕ := ℕ.Z
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

infixl:65 " + " => P
infixl:70 " * " => T
-- infixl:80 " ^ " => PW

axiom PZ (a : ℕ) : a + Z = a
axiom PS (α β : ℕ) : α + (ℕ.S β) = ℕ.S (α + β)

theorem example1 (x y z : ℕ) : x * y + z = x * y + z := rfl

theorem example2 (x y : ℕ) (h : y = x + SSSZ) : SSZ * y = SSZ * (x + SSSZ) := by
    rw [h]

theorem example3 (a b : ℕ) (h : ℕ.S a = b) : ℕ.S (ℕ.S a) = ℕ.S b := by
    rw [<- h]

theorem PSZ (a : ℕ) : a + (ℕ.S Z) = (ℕ.S a) := by
    rw [PS]
    rw [PZ]
