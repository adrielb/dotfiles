cd ~/apps/julia-bin/

JULIA=julia-1.0.2

wget https://julialang-s3.julialang.org/bin/linux/x64/1.0/$JULIA-linux-x86_64.tar.gz

tar zxvf $JULIA-linux-x86_64.tar.gz

cd ~/apps/local/bin

ln -sf ~/apps/julia-bin/$JULIA/bin/julia

julia

ctags-exuberant \
  --recurse \
  --languages=julia \
  --totals=yes \
  -f ~/.julia/tags \
  ~/.julia/packages


