#!/usr/bin/env bash
SHARE="$( tmux show -gqv @CHER )/lib/share"
ICONS="$( tmux show -gqv @ICONS )"
source "$SHARE/dump.fun"
source "$SHARE/fatal.fun"
source "$SHARE/yaml2item.fun"

main()
{
  dump ">>> tmux plugin: GITGUD running..."
  dump ">> \$ICONS: $ICONS"
  icon=$(yaml2item ".icons.sys.GitBranch" "$ICONS")
  (( "$?" != 0 )) && fatal "failed to get icon" || dump ">> GitBranch: $icon" 
  unit $icon
}

unit()
{
  ttmux set -g @Gitgud "#[fg=#{@}"
}
main
