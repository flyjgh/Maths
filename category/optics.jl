struct OpticRepr <: AbstractOptic
    l::Function
    r::Function
end
OpticRepr(o::OpticRepr) = o
OpticRepr(o::AbstractOptic) =
  OpticRepr(a->left(o, a),
    (m, b′)->right(o, m, b′))

left(o::OpticRepr, a) = o.l(a)
right(o::OpticRepr, m, b′) = o.r(m, b′)

function (o::AbstractOptic)(f::Function, a)
    m, b = left(o, a)
    b′ = f(b)
    right(o, m, b′)
end

function (o::AbstractOptic)(a)
    m, b = left(o, a)
    b, b′->right(o, m, b′)
end

