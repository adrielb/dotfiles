JULIA=julia-1.1.0
cd ~/apps/julia-bin/
wget https://julialang-s3.julialang.org/bin/linux/x64/1.1/$JULIA-linux-x86_64.tar.gz
tar zxvf $JULIA-linux-x86_64.tar.gz
ln -sf $JULIA current
julia

cd ~/apps/local/bin
ln -sf ~/apps/julia-bin/current/bin/julia


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


add \
Distributions \
OhMyREPL \
Revise \
JuMP \
Cbc \
POMDPs \
POMDPSimulators \
POMDPPolicies \
OnlineStats \
Parameters \
StatsPlots \
Plots \
Formatting
