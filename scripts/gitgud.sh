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
  dump ">> icon: $icon"
  tmux set -g '@gitgud' "$icon "
  local remote_url="$(git info | grep "remote\.origin\.url" )"
  tmux set -ag @gitgud "${remote_url##*:}"

}

main
