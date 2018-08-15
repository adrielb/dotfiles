
# include .bashrc if it exists
if [ -f "$HOME/.bashrc" ]; then
. "$HOME/.bashrc"
fi

export PETSC_DIR=~/apps/petsc

export PATH="$HOME/.cargo/bin:$PATH"
