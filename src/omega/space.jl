module Space

export Ω, ΩBase, resolve, linearize, unlinearize

"Probability Space indexed with values of type I"
abstract type Ω{I} <: AbstractRNG end

"This is base Omega - Sample Space Object"
abstract type ΩBase{I} <: Ω{I} end

idtype(::Type{OT}) where {I, OT <: Ω{I}} = I

function resolve end

"Linearize ω into flat vector"
function linearize end

"Inverse of `linearize`, structure vector into ω"
function unlinearize end

## Rand

"Random ω ∈ Ω"
Base.rand(x::Type{O}) where O <: ΩBase = O()()

Random.rng_native_52(ω::Ω) = Random.rng_native_52(Random.GLOBAL_RNG)

end