function snorin_random_chevrons -d "randomly sets snorin_chevrons colors for N number of chevrons."
    set -l possible_colors red yellow green blue cyan magenta white brred brmagenta brwhite
    set -l color_count $argv[1]
    # default color_count to 1 if nothing was passed in
    test -n "$color_count"; or set color_count 1
    
    # If shuf is installed, use it. Doesn't do duplicates
    if type -q shuf
        set shuffled_colors (command shuf -i1-10 -n$color_count)
    # jot is installed by default on MacOS so 'easy win' here. Occasionally does duplicates
    else if type -q jot
        set shuffled_colors (command jot -r $color_count 1 10)
    else
        echo "ERROR: either 'shuf' or 'jot' needs to be installed to use this function"
        return 1
    end
    
    set color_list
    for c in $shuffled_colors
        set color_list $color_list $possible_colors[$c]
    end
    set -gx snorin_chevrons $color_list
end
