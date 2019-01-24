# Don't source this file again when creating a tmux session.
test -z "$TMUX"; or exit

if status --is-interactive
  abbr -a ta 'tmx2 attach-session -d -t'
  abbr -a tl 'tmx2 list-sessions'
  abbr -a tn 'tmx2 new-session -s'
  abbr -a v 'vim'
end

set -x EDITOR $VISUAL
set -x PATH ~/.pub-cache/bin $PATH
set -x VISUAL vim
