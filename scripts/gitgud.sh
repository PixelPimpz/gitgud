#!/usr/bin/env bash
SHARE="$( tmux show -gqv @CHER )"
ICONS="$( tmux show -gqv @ICONS )"
source "$SHARE/dump.fun"
source "$SHARE/fatal.fun"
source "$SHARE/yaml2item.fun"

main()
{
  dump ">>> gitgud running..."
  local icon=$(yaml2item ".icons.sys.GitBranch" $ICONS)
}

main
