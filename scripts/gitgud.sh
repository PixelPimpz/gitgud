#!/usr/bin/env bash
SHARE="$( tmux show -gqv @CHER )"
ICONS="$( tmux show -gqv @ICONS )"
source "$SHARE/dump.fun"
source "$SHARE/fatal.fun"
source "$SHARE/yaml2item.fun"

main()
{
  local git-addy="$(grep -e 'remote.origin.url' <$( git-info ))"
  dump ">>> tmux plugin: GITGUD running..."
  icon=$(yaml2item ".icons.sys.GitBranch" "$ICONS")
  (( "$?" != 0 )) && fatal "failed to get icon" || dump ">> GitBranch: $icon" 
  tmux set -g @GitBranch "$icon"
  
  unit $icon
}

unit()
{
  tmux set -g @Gitgud "#[fg=#{@Orange}]#{@HemiL}#[bg=#{@BG0_S}]#[reverse]#{@GitBranch} branch-name #[bg=default]#[noreverse]#{@TriangleR}"
}
main
