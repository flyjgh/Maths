-- trivial: proves (h : true)
-- False.elim: changes goal to false
-- admit allGoals calc case cases change contradiction decide erewrite erw exact exists first focus funext generalize have induction injection injections intro intros match next open refine rename rewrite rfl rotateLeft rotateRight rw show simp simp_all skip solve split subst suffices trivial try unhygienic withReducible

variable (α β ρ η μ : Prop)

macro "use " p:term : tactic => `(tactic| refine ⟨$p:term, ?_⟩)
macro "exfalso" : tactic => `(tactic| apply False.elim)
macro "left" : tactic => `(tactic| apply Or.inl)
macro "right" : tactic => `(tactic| apply Or.inr)

------------------------------------------------------------------------
-- α -> β -> ρ
-- α -> β
-- α ------> ρ
example : (α -> β -> ρ) -> (α -> β) -> (α -> ρ) := by
    intros h₁ h₂ h₃
    apply h₁
    exact h₃
    apply h₂
    exact h₃

------------------------------------------------------------------------
--      α -> ρ
-- η -> β -> ρ -> μ

example : (α -> ρ) -> (η -> β) -> (ρ -> μ) -> (β -> ρ) -> η -> μ := by
    intros αρ ηβ ρμ βρ eta
    apply ρμ
    apply βρ
    apply ηβ
    exact eta

------------------------------------------------------------------------
-- α -> (α -> β)
-- (α -> β) -> α

example : (α -> α -> β) -> ((α -> β) -> α) -> β := by
    intros ααβ αβ_α
    apply ααβ
    apply αβ_α
    intro alpha
    apply ααβ
    exact alpha
    exact alpha
    apply αβ_α
    intro aplha
    apply ααβ
    exact aplha
    assumption

------------------------------------------------------------------------

example : ((α -> β) -> ρ) -> ((β -> ρ) -> α) -> ((ρ -> α) -> β) -> α := by
    intros αβ_ρ βρ_α ρα_β
    apply βρ_α
    intro beta
    apply αβ_ρ
    intro aplha
    apply ρα_β
    intro rho
    apply aplha

------------------------------------------------------------------------

example : ((β -> α) -> α) -> (β -> ρ) ->  (ρ -> α) -> α := by
    intros βα_α βρ ρα
    apply βα_α
    intro beta
    apply ρα
    apply βρ
    exact beta

------------------------------------------------------------------------

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

------------------------------------------------------------------------

example : true → true := by
    intro a
    rfl

example : (True → False) → False := by
    intro tf
    apply tf
    trivial

example : False → α := by
    intro f
    apply False.elim f

example : (α → False) → α → β := by
    intro αf alpha
    apply False.elim
    apply αf
    assumption

example : α → ((α → False) → False) := by
    intros alpha αf
    apply αf
    exact alpha

example : (True → False) → α := by
    intro tf
    apply False.elim
    apply tf
    trivial

------------------------------------------------------------------------

example : α ∧ β -> α := by
    intro αaβ
    apply And.left αaβ

example : (α → β → γ) → (α ∧ β → γ) := by
    intros αβγ αaβ
    apply αβγ
    apply And.left αaβ
    apply And.right αaβ

example : α → β → α ∧ β := by
    intros alpha beta
    apply And.intro alpha beta


/-- `∧` is symmetric -/
example : α ∧ β → β ∧ α := by
    intros αaβ
    apply And.intro
    apply And.right αaβ
    apply And.left αaβ

example : α → α ∧ True := by
    intro alpha
    simp
    exact alpha

example : False → α ∧ False := by
    intro f
    apply And.intro
    apply False.elim;
    assumption
    assumption

/-- `∧` is transitive -/
example : (α ∧ β) → (β ∧ γ) → (α ∧ γ) := by
    intros αaβ βaγ
    cases αaβ
    cases βaγ
    apply And.intro
    assumption
    assumption

example : ((α ∧ β) → γ) → (α → β → γ) := by
    intros αaβγ alpha beta
    apply αaβγ
    apply And.intro
    assumption
    assumption

------------------------------------------------------------------------

example : (α ↔ β) → (β ↔ α) := by
    intro αiffβ
    rw [αiffβ]
    simp
