function prompt_pwd
  set -l path (pwd)

  if __fish_is_git_repository
    set -l path_to_repo (dirname (git rev-parse --show-toplevel ^/dev/null))
    set path (string replace "$path_to_repo/" "" $path)
  else
    set path (string replace -r "^$HOME" "~" $path)
  end

  echo $path
end

