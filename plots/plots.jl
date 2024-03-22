using GLMakie
using Grassmann, Makie;
@basis S"∞+++";

GLMakie.activate!(;
  title="Streamplot of a vector field",
  #decorated=true,
  #float=false,
  #render_on_demand=true,
  focus_on_show=true,
  #scalefactor=4.0,
)

Makie.inline!(false)

streamplot(
  vectorfield(exp((π / 4) * (v12 + v∞3)), V(2, 3, 4), V(1, 2, 3)),
  -0.5:0.1:1.0,
  -2.50:0.1:2.50,
  -2.50:0.1:2.50,
  gridsize=(3, 25),
  #maxsteps=25,
  #quality=4,
)

