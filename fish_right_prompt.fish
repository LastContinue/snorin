function fish_right_prompt -d "Snorin - oh-my-zsh sorin inspired prompt - right side"
    # last status
    test $status != 0; and printf (set_color red)"⏎ "

	if git rev-parse ^ /dev/null
        # Symbols
		for i in (git status --porcelain | cut -c 1-2 | uniq)
			switch $i
                # there's probably a gazillion cases I'm missing
                # but I tried to cover all of the ones I come across
                # in "normal" usage as well as trying to keep close
                # with the oh-my-zsh source
				case "A "
					printf (set_color green)✚' '
				case "*D"
					printf (set_color red)✖' '
				case "*M*"
					printf (set_color blue)✹' '
                case "*R*"
                    printf (set_color magenta)➜' '
                case "*U*"
                    printf (set_color yellow)═' '
				case "??"
					printf (set_color cyan)✭' '
			end
		end
	end
end
