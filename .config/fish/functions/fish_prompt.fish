function _get_num_local_changes -d "Returns the count of matches for the local GIT status"
  set -l match_glob $argv[1];
  set -l match_str $argv[2..-1];

  echo (string match -e -r $match_glob $match_str | count);
end

function _get_num_remote_changes -d "Returns the number of remote changes for the GIT status"
  set -l match_glob $argv[1];
  set -l match_str $argv[2];

  echo (string match -e -r $match_glob $match_str | awk 'NR == 2');
end

function _regex_match -d "Matching a regex statement onto a string"
  set -l match_glob $argv[1];
  set -l match_str $argv[2];

  echo (string match -e -r $match_glob $match_str);
end

function _print_prompt_part -d "Prints a section of the prompt with no newline and a trailing space"
  set -l color $argv[1];
  set -l echo_args $argv[2..-1];

  set_color $color;
  echo -n $echo_args" ";
  set_color normal;
end

function _print_git_stat -d "Prints a GIT stat if it has matches"
  set -l color $argv[1];
  set -l symbol $argv[2];
  set -l count $argv[3];
 
  # Only print out the stat if we have a positive count
  if test -z $count || test $count -eq 0
    return
  end

  set_color $color;
  printf "%c%d " $symbol $count;
  set_color normal;
end

function fish_prompt -d "The prompt... duh"
  set -l pwd (prompt_pwd);

  # Git information
  set -l git_branch (git rev-parse --abbrev-ref HEAD 2>/dev/null); 
  set -l git_remote_changes (git status -sb 2>/dev/null);
  set -l git_local_changes (git status --porcelain 2>/dev/null);

  set -l commits_behind (_get_num_remote_changes 'behind (\d+)' $git_remote_changes);
  set -l commits_ahead (_get_num_remote_changes 'ahead (\d+)' $git_remote_changes);
  set -l num_stashes (git stash list 2>/dev/null | count);
  set -l staged_changes (_get_num_local_changes '^[MD] ' $git_local_changes);
  set -l unstaged_changes (_get_num_local_changes '^ [MD]' $git_local_changes);
  set -l untracked_files (_get_num_local_changes '\?\?' $git_local_changes);

  # Print prompt
  _print_prompt_part blue $pwd;
  _print_prompt_part green $git_branch;
  _print_git_stat green "⇣" $commits_behind;
  _print_git_stat green "⇡" $commits_ahead;
  _print_git_stat green "*" $num_stashes;
  _print_git_stat green "+" $staged_changes;
  _print_git_stat yellow "!" $unstaged_changes;
  _print_git_stat cyan "?" $untracked_files;
  echo "Ⲗ "
end

## TODO
# - Add remaining git stats
#    - Merge conflicts? Maybe not necessary 
