data ℕ = Z | S ℕ

data Li : ℕ -> Type -> Type where
    Nil  : Li Z a
    (::) : a -> Li n a -> Li (S n) a

P : ℕ -> ℕ -> ℕ
P Z x     = x
P (S k) x = S (P k x)

T : ℕ -> ℕ -> ℕ
T Z x     = Z
T (S k) x = P x (T k x)

POW : ℕ -> ℕ -> ℕ
POW _ Z     = S Z
POW x (S k) = T x (POW x k)

POW2 : ℕ -> ℕ
POW2 x = POW x (S (S Z))


-- PZ : Z -> P Z Z = Z
-- PZ Z Z = ?Rel





