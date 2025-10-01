function pipv --wraps='pip freeze | grep $arg1' --wraps='pip freeze | grep -i $arg1' --description 'alias pipv=pip freeze | grep -i $arg1'
  pip freeze | grep -i $arg1 $argv
        
end
