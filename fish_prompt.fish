function fish_prompt -d "Snorin - oh-my-zsh sorin inspired prompt"
    #Main
	printf (set_color cyan)(prompt_pwd)' '

    #determine if git repo is set...
	if git rev-parse ^ /dev/null
        set -l git_status (git branch --show-current)
        test -n "$git_status"; or set -l git_status (git rev-parse --short HEAD)

        #optionally show "git:" in front of branch/revision
        set -q snorin_show_git_prefix
        and set -l git_prefix (set_color blue)git(set_color brwhite):
        or set -l git_prefix ''

        printf $git_prefix(set_color red)$git_status' '
    end

    #print fun part of prompt
    set -l chevron '❯'
    test -n "$snorin_chevrons"; or set -U snorin_chevrons green

    for chevron_color in $snorin_chevrons
        printf (set_color $chevron_color)$chevron
    end
    printf ' '
    set_color normal
end
