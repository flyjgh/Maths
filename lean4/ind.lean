namespace ind

inductive bottom

inductive unit
    | star : unit

inductive bool
    | true  : bool
    | false : bool

inductive prod α β
    | mk : α → β → prod α β

inductive sum α β 
    | inl {} : α → sum α β
    | inr {} : β → sum α β

inductive option α
    | none {} : option α
    | some    : α → option α

inductive inhabited α
    | mk : α → inhabited α

inductive Eq {α : Sort u} (a : α) : α → Prop
    | refl {} : Eq a a

inductive nat
    | zero : nat
    | succ : nat → nat

inductive List (α : Type u) where
  | nil : List α
  | cons (head : α) (tail : List α) : List α

def List.foldl {α β} (f : α → β → α) : (init : α) → List β → α
  | a, nil      => a
  | a, cons b l => foldl f (f a b) l

inductive binary_tree
    | leaf : binary_tree
    | node : binary_tree → binary_tree → binary_tree

def inline {α} (a : α) : α := a

def id {α : Sort u} (a : α) : α := a

def comp : (q -> r) -> (p -> q) -> (p -> r) :=
    λ {α₁ : q -> r} {α₂ : p -> q} α₃ : p => α₁ (α₂ α₃)

structure Thunk (α : Type u) : Type u where
  fn : Unit → α

structure sigma {α : Type u} (β : α → Type v) where
  fst : α
  snd : β fst

structure Equivalence {α : Sort u} (r : α → α → Prop) : Prop where
  refl  : ∀ x, r x x
  symm  : ∀ {x y}, r x y → r y x
  trans : ∀ {x y z}, r x y → r y z → r x z

variable {α : Sort u} {β : α → Sort v}
def fequiv {α : Sort u} {β : α → Sort v} (f₁ f₂ : ∀ (x : α), β x) : Prop := ∀ x, f₁ x = f₂ x

class inductive Decidable (p : Prop) where
    | isFalse (h : Not p) : Decidable p
    | isTrue  (h : p) : Decidable p

structure Subtype {α : Sort u} (p : α → Prop) where
  val : α
  property : p val

def cond {α : Type u} (c : Bool) (x y : α) : α :=
  match c with
    | true  => x
    | false => y

def or (x y : Bool) : Bool :=
  match x with
    | true  => true
    | false => y

def and (x y : Bool) : Bool :=
  match x with
    | false => false
    | true  => y

def not : Bool → Bool
    | true  => false
    | false => true

class Add (α : Type u) where
  add : α → α → α

class Sub (α : Type u) where
  sub : α → α → α

class Mul (α : Type u) where
  mul : α → α → α

class Neg (α : Type u) where
  neg : α → α

class Div (α : Type u) where
  div : α → α → α

class Mod (α : Type u) where
  mod : α → α → α

class Pow (α : Type u) (β : Type v) where
  pow : α → β → α

class Append (α : Type u) where
  append : α → α → α

class Xor (α : Type u) where
  xor : α → α → α

class ShiftLeft (α : Type u) where
  shiftLeft : α → α → α

class ShiftRight (α : Type u) where
  shiftRight : α → α → α

structure Fin (n : Nat) where
  val  : Nat
  isLt : LT.lt val n

def UInt8.size : Nat := 256
structure UInt8 where
  val : Fin UInt8.size

def UInt64.size : Nat := 18446744073709551616
structure UInt64 where
  val : Fin UInt64.size

