abstract type AbstractCategory{N} end


struct Category{N} <: AbstractCategory{N}

    objects::Vector{N}
    arrows::Matrix{N}

end


function checkcomposition(category::Category)
end


function add_obj(category::Category{N}, object::N)::Category{N} where N
end

function add_obj(category::Category{N}, objects::Vector{N})::Category{N} where N
end

function add_arrow(category::Category{N}, arrow::Pair{N,N})::Category{N} where N
end

function add_arrow(category::Category{N}, arrows::Vector{Pair{N,N}})::Category{N} where N
end

Cat = Category(["a", "b"], ["a" => "b"])
add_arrow(Cat, ["b" => "c", "c" => "d"])
add_arrow(Cat, "b" => "c")
add_obj(Cat, "d")
add_arrow(Cat, "b" => "e")





