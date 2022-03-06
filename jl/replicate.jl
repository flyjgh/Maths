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




using MuKanren

equals(:x,3)
equals(3,3)

@run(1, (q), equals(x,5))
