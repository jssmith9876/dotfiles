function git-branch-clean --wraps=git\ branch\ --merged\ \|\ egrep\ -v\ \"\(^\\\*\|master\)\"\ \|\ xargs\ git\ branch\ -d --description alias\ git-branch-clean\ git\ branch\ --merged\ \|\ egrep\ -v\ \"\(^\\\*\|master\)\"\ \|\ xargs\ git\ branch\ -d
  git branch --merged | egrep -v "(^\*|master)" | xargs git branch -d $argv; 
end
