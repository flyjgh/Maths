abstract type AbstractCategory{N} end


struct Category{N} <: AbstractCategory{N}

    objects::Vector{N}
    arrows::Vector{Pair{N,N}}

    Category(objects::Vector{N}) where N = new{N}(objects, objects .=> objects)
    Category(objects::Vector{N}, arrows) where N = new{N}(objects, append!(objects .=> objects, arrows)) 
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

# function checkcomposition(category::Category{N}) where N
#     tmparrows = Pair{N,N}[]
#     finish = false
#     while finish == false
#         for arrowone ∈ filter(x -> x.first ≠ x.second, category.arrows)
#             for arrowtwo ∈ filter(x -> x.first ≠ x.second, category.arrows)
#                 if arrowone.second == arrowtwo.first
#                     ∉(arrowone.first => arrowtwo.second, category.arrows) &&
#                         push!(tmparrows, arrowone.first => arrowtwo.second)
#                 end
#             end
#         end
#         (length(tmparrows) >= 1) ? append!(category.arrows, ∪(tmparrows)) : finish = true
#     end
# end

function tst(c)
    tmp = []
    finish = false
    while finish == false
        for arrowone ∈ filter(x -> x.first ≠ x.second, c)
            for arrowtwo ∈ filter(x -> x.first ≠ x.second, c)
                if arrowone.second == arrowtwo.first
                    push!(tmp, arrowone.first => arrowtwo.second)
                end
            end
        end
        (length(tmp) >= 1) && (length(c) != length(∪(c, tmp))) ?
        append!(c, ∪(tmp)) :
        finish = true
    end
    return c
end


function add_obj(category::Category{N}, object::N)::Category{N} where N
    object ∈ category.objects && return category
    push!(category.objects, object)
    push!(category.arrows, object .=> object)
    return category
end

function add_obj(category::Category{N}, objects::Vector{N})::Category{N} where N
    for object ∈ objects
        object ∈ category.objects && continue
        push!(category.objects, object)
        push!(category.arrows, object .=> object)
    end
    return category
end

function add_arrow(category::Category{N}, arrow::Pair{N,N})::Category{N} where N
    arrow ∈ category.arrows && return category
    push!(category.arrows, arrow)
    arrow.first  ∈ category.objects || add_obj(category, arrow.first)
    arrow.second ∈ category.objects || add_obj(category, arrow.second)
    checkcomposition(category)
    return category
end

function add_arrow(category::Category{N}, arrows::Vector{Pair{N,N}})::Category{N} where N
    for arrow ∈ arrows
        arrow ∈ category.arrows && continue
        push!(category.arrows, arrow)
        arrow.first  ∈ category.objects || add_obj(category, arrow.first)
        arrow.second ∈ category.objects || add_obj(category, arrow.second)
    end
    checkcomposition(category)
    return category
end

Cat = Category(["a", "b"], ["a" => "b"])
add_arrow(Cat, ["b" => "c", "c" => "d"])
add_arrow(Cat, "b" => "c")
add_obj(Cat, "d")
add_arrow(Cat, "b" => "e")


struct Connections{N}
    
    chains::Vector{Vector{N}}

    Connections(category::Category{N}) = new{N}(connection_analysis(category))

end

function connection_analysis(category::Category)::Vector{Vector{N}}
    arrows = category.arrows
    clean(arrows)
    merge(arrows) || bind(arrows)
end

clean(arrows::Vector{Pair{N,N}}) = filter(x -> x.first ≠ x.second, arrows)
bind(x) = nothing



