#!/usr/bin/env bash
SHARE="$( tmux show -gqv @CHER )"
ICONS="$( tmux show -gqv @ICONS )"
source "$SHARE/dump.fun"
source "$SHARE/fatal.fun"
source "$SHARE/yaml2item.fun"

main()
{
  dump ">>> tmux plugin: GITGUD running..."
  local info="$(grep -e 'remote.origin.url' <$( git-info ))"
  local git_name="$(git-info | grep "^origin.*push" | sed  's/^.*://;s/\..*$//')"
  dump ">> line: $info"
  dump ">> git_name: ${git_name}"
  icon=$(yaml2item ".icons.sys.GitBranch" "$ICONS")
  (( "$?" != 0 )) && fatal "failed to get icon" || dump ">> GitBranch: $icon" 
  tmux set -g @GitBranch "$icon"
  tmux set -ag @GitBranch "$git_name"

  
  unit $icon
}

unit(){
  tmux set -g @Gitgud "#[fg=#{@green}]#{@HemiL}#[bg=#{@bg0}]#[reverse]#{@GitBranch} #[bg=default]#[noreverse]#{@TriangleR}"
}
main
