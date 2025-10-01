function nx-test --wraps='nx affected --target test' --description 'alias nx-test=nx affected --target test'
  nx affected --target test $argv; 
end
