#!/usr/bin/env bash
LOCAL_ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

tmux run "$LOCAL_ROOT/scripts/tmux-github.sh"
