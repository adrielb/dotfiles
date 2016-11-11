include("/home/abergman/apps/julia/contrib/build_sysimg.jl")

build_sysimg(force=true)

Pkg.update()

Pkg.add("Plots")
Pkg.add("GR")
Pkg.add("StatPlots")
Pkg.add("PlotRecipes")
Pkg.add("PyPlot")

using Plots, GR, StatPlots, PlotRecipes

Pkg.add("ProfileView")
using ProfileView

Pkg.add("Gallium")
using Gallium

Pkg.add("Lint")
using Lint

Pkg.add("RCall")
using RCall

Pkg.add("DataFrames")
using DataFrames

Pkg.add("Distributions")
using Distributions

Pkg.add("Optim")
using Optim

Pkg.add("JuMP")
using JuMP

Pkg.add("Gadfly")
using Gadfly

Pkg.add("Cairo")
using Cairo

Pkg.add("Vega")
using Vega

Pkg.add("Sundials")
using Sundials

Pkg.add("Sims")
using Sims

Pkg.add("Winston")
using Winston

Pkg.add("Immerse")
using Immerse

