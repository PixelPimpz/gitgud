#!/usr/bin/env bash
LOCAL_ROOT=$1
[[ ! $LOCAL_ROOT ]] && fatal "missing \$LOCAL_ROOT"
SHARE="$( tmux show -gqv @CHER )"
ICONS="$( tmux show -gqv @ICONS )"
source "$SHARE/dump.fun"
source "$SHARE/fatal.fun"
source "$SHARE/yaml2item.fun"

main()
{
  dump ">>> gitgud running..."
  [[ ! -d "$LOCAL_ROOT/.git" ]] && fatal "not a git" 
  local icon=$(yaml2item ".icons.app.gh" $ICONS)
  local remote_url="$(tmux run-shell 'git info | grep "remote\.origin\.url"')"
  dump ">> icon: $icon"
  tmux set -g '@gitgud' "$icon "
  dump ">> remote_url: $remote_url"
  tmux set -ag @gitgud "${remote_url##*github.com/} "

}

main
