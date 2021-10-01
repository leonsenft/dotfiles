function prompt_info
  if __fish_is_git_repository
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
    echo (__fish_git_prompt "%s ")
  end
end

function _git_has_staged_changes
  not git diff-index --quiet --cached HEAD -- 2>/dev/null
end

function _git_has_unstaged_changes
  not git diff-files --quiet 2>/dev/null
end

