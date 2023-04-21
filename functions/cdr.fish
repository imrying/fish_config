function cdr --description 'cd git root directory'
  if set -q argv[1]
    cd (git rev-parse --show-toplevel)/$argv[1]
  else
    cd (git rev-parse --show-toplevel)
  end
end