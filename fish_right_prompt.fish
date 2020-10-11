function fish_right_prompt -d "Snorin - oh-my-zsh sorin inspired prompt - right side"
    set -l last_status $status

	# use this to DRY up some code
	function print_symbol
        printf '%s ' (set_color $argv[1])$argv[2]
        set_color normal
	end

    # last status
    if not test $last_status -eq 0
        # some users might find the actual code more helpful than
        # some random symbol ported from another shell
        if set -q snorin_show_error_code 
            print_symbol red (printf '[%s]' $last_status)
        else 
            print_symbol red ⏎
        end
    end

	if command git rev-parse ^ /dev/null
        # https://github.com/fish-shell/fish-shell/blob/master/share/tools/web_config/sample_prompts/sorin.fish#L110
        set -l git_status_code (command git status --porcelain | string sub -l2)

        if string match -qr '[ACDMT][ MT]|[ACMT]D' $git_status_code
            print_symbol green ✚
        end

        if string match -qr '[ ACMRT]D' $git_status_code
            print_symbol red ✖
        end

        if string match -qr '[MT]$' $git_status_code
            print_symbol blue ✹
        end

        if string match -qe R $git_status_code
            print_symbol magenta ➜
        end

        if string match -qr 'AA|DD|U' $git_status_code
            print_symbol yellow ═
        end

        if string match -qe '\?\?' $git_status_code
            print_symbol cyan ★
        end
	end
end
