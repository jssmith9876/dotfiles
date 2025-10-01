function use_prod --wraps='export AWS_PROFILE=PROD' --description 'alias use_prod=export AWS_PROFILE=PROD'
  export AWS_PROFILE=PROD $argv
        
end
