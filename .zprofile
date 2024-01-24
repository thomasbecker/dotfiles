#!/bin/zsh
#
# .zprofile - Zsh file loaded on login.
#

#
# Browser
#

if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER="${BROWSER:-open}"
fi

#
# Editors
#

export EDITOR="${EDITOR:-vim}"
export VISUAL="${VISUAL:-vim}"
export PAGER="${PAGER:-less}"

#
# Paths
#

# Ensure path arrays do not contain duplicates.
typeset -gU path fpath

export GOBIN="$HOME/go/bin"
# Set the list of directories that zsh searches for commands.
path=(
  $HOME/{,s}bin(N)
  /opt/homebrew/opt/gnu-sed/libexec/gnubin
  /opt/{homebrew,local}/{,s}bin(N)
  /usr/local/{,s}bin(N)
  $GOBIN
  $path
)
