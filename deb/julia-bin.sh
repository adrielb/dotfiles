JULIA=julia-1.2.0
cd ~/apps/julia-bin/
wget https://julialang-s3.julialang.org/bin/linux/x64/1.2/$JULIA-linux-x86_64.tar.gz
tar zxvf $JULIA-linux-x86_64.tar.gz
rm current
ln -sfv $JULIA current
julia

cd ~/apps/local/bin
ln -sfv ~/apps/julia-bin/current/bin/julia


ctags-exuberant \
  --recurse \
  --languages=julia \
  --totals=yes \
  -f ~/.julia/tags \
  ~/.julia/packages

ctags-exuberant \
  --recurse \
  --languages=julia \
  --totals=yes \
  -f ~/apps/julia-bin/tags \
  ~/apps/julia-bin/$JULIA/share/julia/base \
  ~/apps/julia-bin/$JULIA/share/julia/stdlib


using Pkg
Pkg.add(split("
Distributions
OhMyREPL
Revise
JuMP
Cbc
POMDPs
POMDPSimulators 
POMDPPolicies 
BeliefUpdaters
OnlineStats 
Parameters 
StatsPlots 
Plots 
Formatting
LanguageServer
SymbolServer
StaticLint
"))
Pkg.gc()
] precompile
