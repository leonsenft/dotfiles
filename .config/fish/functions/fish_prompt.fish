 function fish_prompt
  set -l last_status $status
  set -l path (pwd)
  set -l symbol '❯'

  if __fish_is_git_repository
    # Remove leading path to current repository.
    set -l repo_path (git rev-parse --show-toplevel ^/dev/null)
    set -l repo_parent_path (dirname $repo_path)
    set path (string replace $repo_parent_path/ '' $path)
    # Color branch name depending on status of staged files.
    set -l branch_color
    if _git_has_unstaged_changes
      set branch_color red
    else if _git_has_staged_changes
      set branch_color brown
    else
      set branch_color green
    end
    set -g __fish_git_prompt_color_branch $branch_color
    set -g __fish_git_prompt_showupstream git
    set -g __fish_git_prompt_char_upstream_equal ""
    set -g __fish_git_prompt_char_upstream_behind "↓"
    set -g __fish_git_prompt_char_upstream_ahead "↑"
    set -g __fish_git_prompt_char_upstream_diverged "↓↑"
  else
    set path (string replace $HOME '~' $path)
  end

  if test $last_status -ne 0
    # Color symbol red to indicate last command failed.
    set symbol (set_color red)$symbol(set_color normal)
  end

  set -l prompt
  # Use subdued color for path.
  set prompt $prompt (set_color $fish_color_autosuggestion)
  set prompt $prompt $path(set_color normal)' '
  set prompt $prompt (__fish_git_prompt "%s ")
  set prompt $prompt $symbol' '
  echo -ns $prompt
end

function _git_has_staged_changes
  not git diff-index --quiet --cached HEAD -- ^/dev/null
end

function _git_has_unstaged_changes
  not git diff-files --quiet ^/dev/null
end
