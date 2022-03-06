data ℕ = Zero | S ℕ

data Maybe a = Nothing | Just a
data Sum a b = a | b

data L a = Nil | (::) a (L a)

P : ℕ -> ℕ -> ℕ
P Zero x     = x
P (S k) x = S (P k x)

T : ℕ -> ℕ -> ℕ
T Zero x     = Zero
T (S k) x = P x (T k x)

POW : ℕ -> ℕ -> ℕ
POW _ Zero     = S Zero
POW x (S k) = T x (POW x k)

SQUARE : ℕ -> ℕ
SQUARE x = POW x (S (S Zero))

repeat : a -> L a
repeat x = x :: repeat x

take : ℕ -> L a -> L a
take Zero _   = Nil
take _ Nil = Nil
take (S n) (x :: xs) = x :: take n xs

PZero : Zero -> P Zero Zero = Zero
PZero Zero Zero = ?Rel





