# Don't source this file again when creating a tmux session.
test -z "$TMUX"; or exit

if status --is-interactive
  abbr -a ta 'tmux attach-session -d -t'
  abbr -a tl 'tmux list-sessions'
  abbr -a tn 'tmux new-session -s'
  abbr -a v 'vim'
end

set -x EDITOR $VISUAL
set -x PATH ~/.pub-cache/bin $PATH
set -x VISUAL vim
