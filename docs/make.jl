using Documenter
using Omega

makedocs(
  modules = [Omega],
  authors = "Zenna Tavares, Javier Burroni, Edgar Minaysan, Rajesh Ragananth, Armando Solar-Lezama",
  format = Documenter.HTML(),
  sitename = "Omega.jl",
  pages = [
    "Home"=>"index.md",
    "Basic Tutorial" => "basictutorial.md",
    "Modeling" => "model.md",
    "(Conditional) Independence" => "conditionalindependence.md",
    "Conditional Inference"=>"inference.md",
    "Soft Execution"=>"soft.md",
    "Inference Algorithms"=>"inferencealgorithms.md",
    "Causal Inference" => "causal.md",
    "Distributional Inference" => "higher.md",
    "Built-in Distributions" => "distributions.md",
    "Cheat Sheet" => "cheatsheet.md",
    "Internals" => ["Overview" => "internalsoverview.md",
                    "Ω" => "omega.md",
                    "RandVar" => "randvar.md"],
    "Contribution Guide" => "contrib.md",
    "Omega vs other PPLs" => "omegavsotherppls.md",
  ]
)

deploydocs(
  repo = "github.com/zenna/Omega.jl.git",
)
