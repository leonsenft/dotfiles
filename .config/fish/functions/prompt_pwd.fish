function prompt_pwd
  set -l path (pwd)
  set -l git_path (git rev-parse --show-toplevel ^/dev/null)

  if test $git_path
    set -l parent_path (dirname $git_path)
    set path (string replace "$parent_path/" "" $path)
  else
    set path (string replace -r "^$HOME" "~" $path)
  end

  echo $path
end
