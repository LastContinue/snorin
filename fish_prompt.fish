function fish_prompt -d "Snorin - oh-my-zsh sorin inspired prompt"
	# use these to DRY up some code
	function print_color_space
        printf '%s ' (set_color $argv[1])$argv[2]
        set_color normal
	end

	function print_color
        printf '%s' (set_color $argv[1])$argv[2]
        set_color normal
	end

    # where are we ?
	print_color_space cyan (prompt_pwd)

    # determine if git repo is set and try to set some information 
	if set -l repo_info (command git symbolic-ref --short HEAD ^ /dev/null) # try set branch name
    or set -l repo_info (command git rev-parse --short HEAD ^ /dev/null) # else try to set hash
        # optionally show "git:" in front of branch/revision
        # I believe there's a built-in Fish variable for this functionality.
        # May move to that in the future if it works roughly the same
        set -q snorin_show_git_prefix; and print_color blue "git"; and print_color brwhite ":"

        print_color_space red $repo_info
    end

    # print fun part of prompt
    test -n "$snorin_chevrons"; or set -g snorin_chevrons green

    for chevron_color in $snorin_chevrons
        print_color $chevron_color ❯
    end
    printf " " 
end
