#!/usr/bin/env bash
SHARE="$( tmux show -gqv @CHER )/lib/share"
ICONS="$( tmux show -gqv @ICONS )"
source "$SHARE/dump.fun"
source "$SHARE/fatal.fun"
source "$SHARE/yaml2item.fun"

dump ">>> tmux plugin: GITGUD running..."

