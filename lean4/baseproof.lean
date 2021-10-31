universe u

variable (α β γ : Prop)

theorem modus_ponens : α -> (α -> β) -> β := by
    intro h₁
    intro h₂
    apply h₂
    exact h₁

-- example : (α -> β) -> α -> β := by
    -- intro h₁
    -- exact h₁

theorem const : α -> β -> α := by
    intros h₁ h₂
    exact h₁

theorem transitivity : (α -> β) -> (β -> γ) -> (α -> γ) := by
    intros h₁ h₂ h₃
    apply h₂
    apply h₁
    exact h₃

example : (α -> β -> γ) -> (α -> β) -> (α -> γ) := by
    intros h₁ h₂ h₃
    apply h₁
    exact h₃
    apply h₂
    exact h₃


variable (X Y : Type)
variable (x : X) (y : Y)

#check (X × Y) × (Y × X)
#check ((x, y), (y, x)).1.2
