function fish_prompt
  set -l last_status $status
  set -l prompt_color $fish_color_autosuggestion
  set -l status_color
  if test $last_status -ne 0
    set status_color red
  else
    set status_color normal
  end
  echo -ns \
    (set_color $prompt_color)(prompt_pwd)" " \
    (prompt_info) \
    (set_color $status_color)"❯ " \
    (set_color normal)
end
