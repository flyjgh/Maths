-- trivial: proves (h : true)
-- exfalso: changes goal to false

import lean
import Lean

variable (α β ρ η μ : Prop)

macro "welcome " p:term : tactic =>
  `(intro $p:term)
macro "same " p:term : tactic =>
  `(exact $p:term)

-- ---------------------------------------------------------------------
-- α -> β -> ρ
-- α -> β
-- α ------> ρ
example : (α -> β -> ρ) -> (α -> β) -> (α -> ρ) := by
    intros h₁ h₂ h₃
    apply h₁
    exact h₃
    apply h₂
    exact h₃

-- ---------------------------------------------------------------------
--      α -> ρ
-- η -> β -> ρ -> μ

example : (α -> ρ) -> (η -> β) -> (ρ -> μ) -> (β -> ρ) -> η -> μ := by
    intros αρ ηβ ρμ βρ eta
    apply ρμ
    apply βρ
    apply ηβ
    exact eta

-- ---------------------------------------------------------------------
-- α -> (α -> β)
-- (α -> β) -> α

example : (α -> α -> β) -> ((α -> β) -> α) -> β := by
    intros ααβ αβ_α
    apply ααβ
    apply αβ_α
    welcome alpha
    apply ααβ
    exact alpha
    exact alpha
    apply αβ_α
    intro aplha
    apply ααβ
    exact aplha
    assumption

-- ---------------------------------------------------------------------

example : ((α -> β) -> ρ) -> ((β -> ρ) -> α) -> ((ρ -> α) -> β) -> α := by
    intros αβ_ρ βρ_α ρα_β
    apply βρ_α
    intro beta
    apply αβ_ρ
    intro aplha
    apply ρα_β
    intro rho
    apply aplha

-- ---------------------------------------------------------------------

example : ((β -> α) -> α) -> (β -> ρ) ->  (ρ -> α) -> α := by
    intros βα_α βρ ρα
    apply βα_α
    intro beta
    apply ρα
    apply βρ
    exact beta

-- ---------------------------------------------------------------------

example : (((α -> β -> β) -> ((α -> β) -> β)) -> ρ) ->
          ((((α -> α) -> β) -> (α -> α -> β)) -> ρ) ->
          (((α -> α -> β) -> ((α -> α) -> β)) -> ρ) -> ρ :=
        by
          intros h₁ h₂ h₃
          apply h₂
          intros αα_β alpha _
          apply αα_β
          intro _
          assumption

-- ---------------------------------------------------------------------

example : true → true := by
    intro a
    cases a
    rfl

example : (true → false) → false := by
    intro tf
    apply tf
    trivial

-- ---------------------------------------------------------------------

-- Lean3

-- variables (P Q : Prop)

-- example : false → P :=
-- begin
--   intro,
--   exfalso,
--   assumption
-- end

-- example : (P → false) → P → Q :=
-- begin
--   intros pf p,
--   exfalso,
--   apply pf,
--   assumption
-- end

