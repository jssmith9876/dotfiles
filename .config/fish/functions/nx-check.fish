function nx-check --wraps='nx-tsc && nx-lint && nx-test' --description 'alias nx-check nx-tsc && nx-lint && nx-test'
  nx-tsc && nx-lint && nx-test $argv; 
end
