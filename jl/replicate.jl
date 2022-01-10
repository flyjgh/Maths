begin
    quine = "@show quine; println(quine)"
    @show quine; println(quine)
end

function mk(x)
    function (y)
        (x ∘ x)(y)
    end
end

(() -> () -> () -> ())()
