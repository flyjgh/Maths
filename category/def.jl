abstract type AbstractCategory{N} end


struct Category{N} <: AbstractCategory{N}

    objects::Vector{N}
    arrows::Vector{Pair{N,N}}

    Category(objects::Vector{N}) where N = new{N}(objects, Pair{N,N}[])
    Category(objects::Vector{N}, arrows) where N = new{N}(objects, arrows) 
end


function checkcomposition(category::Category)
    T = typeof(category.objects[1])
    tmparrows = Pair{T,T}[]
    finish = false
    while finish == false
        for arrowone ∈ filter(x -> x.first ≠ x.second, category.arrows)
            for arrowtwo ∈ filter(x -> x.first ≠ x.second, category.arrows)
                if arrowone.second == arrowtwo.first
                    push!(tmparrows, arrowone.first => arrowtwo.second)
                end
            end
        end
        (length(tmparrows) >= 1) && (length(category.arrows) != length(∪(category.arrows, tmparrows))) ?
            append!(category.arrows, ∪(tmparrows)) :
            finish = true
    end
end

function addobj(category::Category{N}, object::N)::Category{N} where N
    object ∈ category.objects && return category
    push!(category.objects, object)
    return category
end

function addobj(category::Category{N}, objects::Vector{N})::Category{N} where N
    for object ∈ objects
        object ∈ category.objects && continue
        push!(category.objects, object)
    end
    return category
end

function addarrow(category::Category{N}, arrow::Pair{N,N})::Category{N} where N
    arrow ∈ category.arrows && return category
    push!(category.arrows, arrow)
    arrow.first  ∈ category.objects || addobj(category, arrow.first)
    arrow.second ∈ category.objects || addobj(category, arrow.second)
    checkcomposition(category)
    return category
end

function addarrow(category::Category{N}, arrows::Vector{Pair{N,N}})::Category{N} where N
    for arrow ∈ arrows
        arrow ∈ category.arrows && continue
        push!(category.arrows, arrow)
        arrow.first  ∈ category.objects || addobj(category, arrow.first)
        arrow.second ∈ category.objects || addobj(category, arrow.second)
    end
    checkcomposition(category)
    return category
end

Cat = Category(["a", "b"], ["a" => "b"])
# addarrow(Cat, ["b" => "c", "c" => "d"])
# addarrow(Cat, "b" => "c")
# addobj(Cat, "d")
# addarrow(Cat, "c" => "d")

