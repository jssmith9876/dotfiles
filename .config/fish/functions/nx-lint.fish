function nx-lint --wraps='nx affected --target lint --max-warnings=0' --description 'alias nx-lint=nx affected --target lint --max-warnings=0'
  nx affected --target lint --max-warnings=0 $argv; 
end
