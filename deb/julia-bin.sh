source ./logger.sh

cd ~/apps/local/bin
ln -sfv ~/apps/julia-bin/current/bin/julia

JULIA=julia-1.3.1
mkdir -p ~/apps/julia-bin/
cd ~/apps/julia-bin/
TARGZ=$JULIA-linux-x86_64.tar.gz
if [ ! -f "$TARGZ" ]; then
  wget https://julialang-s3.julialang.org/bin/linux/x64/1.3/$TARGZ
fi
tar zxvf $TARGZ
rm -f current
ln -sfv $JULIA current
julia

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

exit 0

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
StaticArrays
LearningStrategies
RecursiveArrayTools
BSON
SQLite
DataFrames
"))
Pkg.gc()
] precompile
