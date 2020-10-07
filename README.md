# Snorin' 💤 🐟
## Oh-My-Zsh Sorin for Fish!
"Opinionated" (lazy) port of the Oh-My-Zsh "Sorin" theme for the Fish Shell. 

<img src="https://raw.githubusercontent.com/LastContinue/snorin/assets/default.png" alt="default prompt" width=80% height=80%>

## What? Why? Isn't there already a Sorin theme for Fish?
Yes, in fact, there are two just in the main Fish repo alone (and probably an untold amount in the wild!) 

However, I found the one in `fish_config` to be lacking some features (Git), and [the second one](https://github.com/fish-shell/fish-shell/blob/master/share/tools/web_config/sample_prompts/sorin.fish) was too different from the Sorin theme I liked from [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh/blob/master/themes/sorin.zsh-theme). So, I started hacking  
## Installation

Fisher
```
fisher add lastcontinue/snorin
```

Oh-my-fish
```
omf install https://github.com/lastcontinue/snorin
```

## Features
Puts the Git repo info on the left, on the right it shows Git status  
<img src="https://raw.githubusercontent.com/LastContinue/snorin/assets/git_stuff1.png" alt="git repo info" width=90% height=90%>  
It can do branches and hashes  
<img src="https://raw.githubusercontent.com/LastContinue/snorin/assets/git_stuff2.png" alt="more git repo info" width=40% height=40%>

#### Symbols<sup id="a1">[[1]](#f1)</sup>
* new (untracked) files - cyan `★` 
* modified files - blue `✹`
* removed files - red `✖`
* staged files - green `✚`
* file renamed - magenta `➜` (using `git mv` will trigger this. Just doing `mv foo bar` might not do it) 
* unmerged - yellow `═` (usually shows up during merge conflict)  

### Variable support  
This theme includes support for its own optional variables if you want to further customize your experience (without writing any code). 

* `snorin_chevrons [color1 .. colorN]`
* `snorin_show_git_prefix`
* `snorin_show_error_code`

#### Chevrons
<img src="https://raw.githubusercontent.com/LastContinue/snorin/assets/chevrons.png" alt="chevron example" width=50% height=50%>  

by default, this prompt will give you one green ❯ symbol (this is how the Oh-My-Zsh Sorin does it)  
However, the "Sorin" themes for Fish usually have three: a red ❯, a yellow ❯, and a green ❯ (something like `❯❯❯`) .  

I decided to let the user choose!  
You can have as many ❯ 's as you want with this theme by setting  

`set snorin_chevrons color1 color2 color3 .. color n`  

For example, If you wanted `red, yellow, green` you could do

`set -U snorin_chevrons red yellow green` or  
`set -g snorin_chevrons red yellow green` if you're writing this to a config  

#### Git Prefix
<img src="https://raw.githubusercontent.com/LastContinue/snorin/assets/git_prefix.png" alt="git prefix example" width=50% height=50%>

[My inspiration Sorin theme](https://github.com/ohmyzsh/ohmyzsh/blob/master/themes/sorin.zsh-theme#L29) uses `git:` as a prefix for the branch/hash information. However, after _months_ of daily use, I started to feel this might be a bit redundant. If this theme could support multiple DVCS, then having a prefix for the type would make more sense (`svn:`, `hg:`, `git:`, etc).  I decided to **disable the prefix by default** in order to cut down on visual clutter. I am aware that Fish includes a very similar variable by default, and that you could also use `fish_vcs_prompt` if you wanted other vcs types, but this is _lazy_ port after all 😉  

`set -U snorin_show_git_prefix` or  
`set -g snorin_show_git_prefix` if you're writing this to a config file  
(no value needs to be set)  

`set -e snorin_show_git_prefix` will disable the `git:` prefix **this is the default behavior**

#### Error Codes
<img src="https://raw.githubusercontent.com/LastContinue/snorin/assets/error_codes.png" alt="git prefix example" width=90% height=90%>

By default, [my inspiration Sorin theme](https://github.com/ohmyzsh/ohmyzsh/blob/master/themes/sorin.zsh-theme#L25) uses a red `⏎` on the right side to indicate the last line returned non-zero. However, after playing around with some commands (`set -q` comes to mind), I realized _sometimes_ it might be better for it to actually print out the error code instead. (Additionally the `⏎` can be a bit hard to read...)  

`set -U snorin_show_error_code` or  
`set -g snorin_show_error_code` if you're writing to this to a config  

`set -e snorin_show_git_prefix` will disable it and you'll return to the `⏎` **this is the default behavior**

### Random Fun
I thought it might be fun to have the ability to have random colors generated for your prompts, so I wrote a little function that uses 
either `jot` or `shuf` (make sure you have at least one of these installed<sup id="a2">[[2]](#f2)</sup>) to help make some random colors for your prompts. It works like 
this  
```
snorin_random_chevrons N
```
(where N is the number of chevrons you want. It can also be passed without N to just do one random colored chevron)

#### For Instance
If you want each new term session/tab to have a different prompt<sup id="a3">[[3]](#f3)</sup> in your `fish_config` (mine's at `~/.config/fish/config.fish`, but ymmv) you could do something like  
```
if type -q snorin_random_chevrons
    snorin_random_chevrons 3
end
```  
That should give each new session/tab a different set of colors (maybe. I only defined 10 colors so duplicates will happen)

This is just a "for instance". There are hundreds of triggering events you could use to have a prompt
change colors or number of `❯`. Use your imagination!

**sources**:  
https://github.com/robbyrussell/oh-my-zsh/blob/master/themes/sorin.zsh-theme  
https://github.com/fish-shell/fish-shell/pull/2243  
(I believe this eventually morphed into [this](https://github.com/fish-shell/fish-shell/blob/master/share/tools/web_config/sample_prompts/sorin.fish), however I found this shorter version better as inpiration)

**Footnotes**  
<b id="f1">1.</b> What each one of these colors looks like _exactly_ depends on how you've setup your colors in Fish or in your terminal. My magenta is set to `#a665a5`, yours maybe something different.[↩](#a1)

<b id="f2">2.</b> Interestingly enough, `shuf` doesn't do duplicates, whereas `jot` does. I don't consider this an issue, but this might drive some people _crazy_.[↩](#a2)

<b id="f3">3.</b> You may have noticed that I used this when making most of the screenshots. I like it 😁[↩](#a3)
