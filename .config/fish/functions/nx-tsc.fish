function nx-tsc --wraps='nx affected --target tsc' --description 'alias nx-tsc=nx affected --target tsc'
  nx affected --target tsc $argv; 
end
