#!/usr/bin/env bash
SHARE="$( tmux show -gqv @CHER )/lib/share"
source "$SHARE/dump.fun"
source "$SHARE/fatal.fun"

dump ">>> tmux plugin: GITGUD running..."
