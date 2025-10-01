function gtc
  set -l branch_name (string join '_' $argv)
  gt create $branch_name --all -m "$argv"
end
