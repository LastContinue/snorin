function fish_right_prompt -d "Snorin - oh-my-zsh sorin inspired prompt - right side"

	# use this to DRY up some code
	function print_symbol
		printf (set_color $argv[1])$argv[2]' '
	end

    # last status
    test $status != 0; and printf (set_color red)"⏎ "

	if git rev-parse ^ /dev/null
        #take advantage of Fish `String` commands
		for i in (git status --porcelain |
                    cut -c 1-2 |
                    string trim |
                    string replace 'MM' 'M' | #same symbol - blue ✹
                    string replace 'RM' 'M' |
                    string replace 'AD' 'D' | #same symbol - green ✚
                    uniq)
			switch $i
                # there's probably a gazillion cases I'm missing
                # but I tried to cover all of the ones I come across
                # in "normal" usage, as well as trying to keep close
                # to the oh-my-zsh source
                case "A"
                    print_symbol green ✚
                case "D"
                    print_symbol red ✖
                case "M"
                    print_symbol blue ✹
                case "R"
                    print_symbol magenta ➜
                # I can't remember exactly how to trigger this locally
                # to test it (they are merge conflicts), so probably wrong
                case "*U*"
                    print_symbol yellow ═
                # this is usually a new file... usually
                case "??"
                    print_symbol cyan ✭
            end
		end
	end
end
