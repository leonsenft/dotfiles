if status --is-interactive
  abbr -a ta 'tmux attach-session -d -t'
  abbr -a tl 'tmux list-sessions'
  abbr -a tn 'tmux new-session -s'
  abbr -a v 'vim'
end

set -x VISUAL vim
set -x EDITOR $VISUAL
set -x PATH ~/bin ~/.pub-cache/bin ~/code/flutter/bin ~/.cargo/bin /opt/homebrew/bin $PATH
