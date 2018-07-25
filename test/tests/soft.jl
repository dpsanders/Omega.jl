using Omega
using UnicodePlots
using Cassette

function softtest()
  x = normal(0.0, 1.0)
  y = normal(0.0, 1.0)
  coldsamples = withkernel(Omega.kseα(10.0)) do
    rand((x, y), x ≊ y)
  end
  print(UnicodePlots.densityplot(ntranspose(coldsamples)...))

  hotsamples = withkernel(Omega.kseα(0.01)) do
    rand((x, y), x ≊ y)
  end
  print(UnicodePlots.densityplot(ntranspose(hotsamples)...))
end

softtest()

function softtest2(ω = 0.39)
  g(x::Bool) = x & x
  function f(ω)
    if Bool(ω > 0.35)
      baba = ω > 0.5
      # @show typeof(baba)
      g(baba)
    else
      2ω <= 0.2
    end
  end
  softapply(f, ω)
end

function f(ω)
  if Bool(ω > 0.35)
    (baba, epsilon) = ω ⪆ 0.5
    # @show typeof(baba)
    (res, epsilon2) = g(baba)
    
  else
    2ω <= 0.2
  end
end

softtest2()

function softtest3()
  g(x::Real)::Bool = x > 0.5
  softapply(g, 0.3)
end

softtest3()