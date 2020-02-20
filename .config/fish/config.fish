if status --is-interactive
  abbr -a ta 'tmux attach-session -d -t'
  abbr -a tl 'tmux list-sessions'
  abbr -a tn 'tmux new-session -s'
  abbr -a v 'vim'
end

set -x EDITOR $VISUAL
set -x VISUAL vim

# Don't set PATH when creating a new tmux session.
if not set -q TMUX
  set -x PATH ~/.pub-cache/bin ~/code/flutter/bin ~/.cargo/bin $PATH
end
