## Vector Indices
## ==============

@inline combine(a::Vector{Int}, b::Vector{Int}) = vcat(a, b)
@inline append(a::Vector{Int}, b::Int) = vcat(a, Int[b])
@inline base(::Type{Vector{Int}}, i::Int) = Int[i]

Base.getindex(ωπ::OmegaProj{O, I}, i::I) where {O, I} = 
  OmegaProj{O, I}(ωπ.ω, combine(ωπ.id, i))

Base.getindex(ωπ::OmegaProj{O, I}, i::SI) where {O, I, SI} = 
  OmegaProj{O, I}(ωπ.ω, append(ωπ.id, i))

## Pairing Indices
## ===============
const Paired = Int

# struct Paired{T}
#   val::T
# end

"Cantour Pairing Function"
@inline pair(k1, k2) = div((k1 + k2)*(k1 + k2 + 1), 2) + k2
@inline pair(k1) = k1

@inline combine(a::Paired, b::Paired) = pair(a, b)
@inline base(::Type{Paired}, i::Int) = i

Base.getindex(ωπ::OmegaProj{O, Paired}, i::Int) where O = OmegaProj{O, Paired}(ωπ.ω, pair(ωπ.id, i))