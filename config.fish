if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -x PATH $HOME/bin $PATH
set -x PATH $HOME/.cargo/bin $PATH

source ~/.asdf/asdf.fish


export GODEBUG=cgocheck=0

function fish_greeting
    neofetch --off
    # cat ~/.config/fish/files/startup.txt
    # cat ~/.config/fish/files/fishes/(ls ~/.config/fish/files/fishes | shuf -n 1)
    echo -e "\n"
end

function clean-lst --description 'remove characters from lst files'
    for file in -- *.lst
        mv -- "$file" (echo $file | cut -c 27-)
    end
end

function tagion-cov --description 'run unittests with dmd and create cov'
    rm *.lst
    make unittest DC=dmd COV=1;
    clean-lst;
end

function multigraph --description 'convert all *.hibon files to svg'
    parallel --progress 'set base (basename {} .hibon) ; graphview {} | neato -Tsvg -o $base.svg' ::: *.hibon
end
starship init fish | source