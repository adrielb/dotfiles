
# include .bashrc if it exists
if [ -f "$HOME/.bashrc" ]; then
. "$HOME/.bashrc"
fi

export PETSC_DIR=~/apps/petsc
export PATH=~/apps/R-cran/R-3.1.2/bin:$PATH
