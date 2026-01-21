#!/usr/bin/env bash
LOCAL_ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
tmux unbind C-g
tmux bind C-g run "$LOCAL_ROOT/scripts/tmux-gitgud.sh"
tmux run "$LOCAL_ROOT/scripts/tmux-gitgud.sh"
