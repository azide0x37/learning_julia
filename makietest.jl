using ModernGL
using GLMakie

# Plot a streamplot of a vector field
#using Grassmann, Makie; @basis S"∞+++"
#streamplot(vectorfield(exp((π/4)*(v12+v∞3)),V(2,3,4),V(1,2,3)),-1.5..1.5,-1.5..1.5,-1.5..1.5,gridsize=(10,10))

GLMakie.activate!(inline=false)
Makie.inline!(true)

x = -4pi:0.01:4pi
approx = fill(0.0, length(x))
cmap = [:gold, :deepskyblue3, :orangered, :mediumseagreen, :darkorchid3]


with_theme(palette=(; patchcolor=cgrad(cmap, alpha=0.45))) do
  fig, axis, lineplot = lines(x, sin.(x); label=L"sin(x)", linewidth=3, color=:black,
    axis=(; title="Polynomial approximation of sin(x)",
      xgridstyle=:dash, ygridstyle=:dash,
      xticksize=10, yticksize=10, xtickalign=1, ytickalign=1,
      xticks=(-3π:π/2:3π, ["-3π", "-5π/2", "-2π", "-3π/2", "-π", "-π/2", "0", "π/2", "π", "3π/2", "2π", "5π/2", "3π"]),
    ))
  translate!(lineplot, 0, 0, 2) # move line to foreground
  band!(x, sin.(x), approx .+= x; label=L"n = 0")
  band!(x, sin.(x), approx .+= -x .^ 3 / 6; label=L"n = 1")
  band!(x, sin.(x), approx .+= x .^ 5 / 120; label=L"n = 2")
  band!(x, sin.(x), approx .+= -x .^ 7 / 5040; label=L"n = 3")
  band!(x, sin.(x), approx .+= x .^ 9 / 362880; label=L"n = 4")
  band!(x, sin.(x), approx .+= -x .^ 11 / 39916800; label=L"n = 5")
  band!(x, sin.(x), approx .+= x .^ 13 / 6227020800; label=L"n = 6")
  band!(x, sin.(x), approx .+= -x .^ 15 / 1307674368000; label=L"n = 7")

  limits!(-9.7, 9.7, -1.5, 1.5)
  axislegend(; position=:rt, backgroundcolor=(:white, 1), framecolor=:orange)
  #save("./approxsin.png", fig, size=(800, 600))
  display(fig)
end
