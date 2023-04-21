
function rmake
    # Change to the root folder of the repository
    cdr
    
    # Run the make command with the specified target
    make $argv
    
    # Change back to the original directory
    cd -
end