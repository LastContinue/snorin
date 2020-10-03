function fish_right_prompt -d "Snorin - oh-my-zsh sorin inspired prompt - right side"
    set -l last_status $status

	# use this to DRY up some code
	function print_symbol
        printf (set_color $argv[1])$argv[2]' '
        set_color normal
	end

    # last status
    if not test $last_status -eq 0
        printf (set_color red)"⏎ "
        set_color normal
    end

	if git rev-parse ^ /dev/null
		for i in (git status -s | cut -c 1-2 | string trim | sort | uniq)
			switch $i
                # There's quite a few cases missing according to
                # https://git-scm.com/docs/git-status
                # but I tried to cover all of the ones I come across
                # in "normal" usage, as well as trying to keep close
                # to the oh-my-zsh source
                # Always double-check your Git status before commiting
                case A AM
                    print_symbol green ✚
                case D AD MD RD
                    print_symbol red ✖
                case M MM
                    print_symbol blue ✹
                case R RM
                    print_symbol magenta ➜
                case "*U*" AA
                    print_symbol yellow ═
                case \?\?
                    print_symbol cyan ★
                case "*"
                    print_symbol yellow ◊
                    # if you start getting this a lot,
                    # please open an issue or file a PR
                    # I wanted something generic that didn't really mean "good" or "bad"
            end
		end
	end
end
