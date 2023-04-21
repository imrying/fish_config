
function rgit
    set -l cmd git $argv
    cdr
    $cmd
    cd -
end
