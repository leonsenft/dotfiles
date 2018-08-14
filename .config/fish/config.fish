# Don't source this file again when creating a tmux session.
test -z "$TMUX"; or exit

if status --is-interactive
  abbr --add dot "git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
  abbr --add ta 'tmux attach-session -d -t'
  abbr --add tl 'tmux list-sessions'
  abbr --add tn 'tmux new-session -s'
  abbr --add vi 'vim'
end

set -x EDITOR $VISUAL
set -x PATH ~/.pub-cache/bin $PATH
set -x VISUAL vim
