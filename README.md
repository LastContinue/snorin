# Snorin' 💤 🐟
## Oh-My-Zsh Sorin for Fish!
"Opinionated" (lazy) port of the Oh-My-Zsh "Sorin" theme for the Fish Shell. 

![default prompt](https://raw.githubusercontent.com/LastContinue/snorin/assets/default.png)

## What? Why? Isn't there already a Sorin theme for Fish?
Yes, in fact, there are two just in the main Fish repo alone (and probably an untold amount in the wild!) 

However, I found the one in `fish_config` to be lacking some features (Git), and [the second one](https://github.com/fish-shell/fish-shell/blob/988283c7177d8496f18c1fea1a1007aa8d45d984/share/tools/web_config/sample_prompts/sorin.fish) too complex to understand what was happending (especially when compairing the source for the [oh-my-zsh original](https://github.com/robbyrussell/oh-my-zsh/blob/master/themes/sorin.zsh-theme)), so I started hacking.

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
![git repo info](https://raw.githubusercontent.com/LastContinue/snorin/assets/git_stuff1.png)
![more git repo info](https://raw.githubusercontent.com/LastContinue/snorin/assets/git_stuff2.png)

* new files `★` (the current star is _slightly_ different than the screenshot above. I will update screenshots when I get some time)
* modified files `✹`
* removed files `✖`
* staged files `✚`
* file renamed (might not show up until you stage) `➜` 
* unmerged (usually shows up during merge conflict) `═`

### Variable support  
This theme includes support for its own optional variables if you want to further customize your experience (without writing any code). 

* `snorin_chevrons [color1 .. colorN]`
* `snorin_show_git_prefix`
* `snorin_show_error_code`

#### Chevrons
`snorin_chevrons`  
![chevron example](https://raw.githubusercontent.com/LastContinue/snorin/assets/chevrons.png)


by default, this prompt will give you one green ❯ symbol (this is how the Oh-My-Zsh Sorin does it)  
However, the "Sorin" themes for Fish usually have three: a red ❯, a yellow ❯, and a green ❯ (something like `❯❯❯`) .  

I decided to let the user chose.  
You can have as many ❯ 's as you want with this theme by setting  

`set snorin_chevrons color1 color2 color3 .. color n`  

For example, I like the red, yellow, green, so I have mine set as  

`set -U snorin_chevrons red yellow green` or  
`set -gx snorin_chevrons red yellow green` if you're writing this to a config

#### Git Prefix
`snorin_show_git_prefix`

I realized that after _months_ of daily use, the `git:` prefix before the branch was a bit redundant. If this theme could support multiple DVCS, then having a prefix for the type would make sense (`svn:`, `hg:`, `git:`, etc).  I decided to **disable the prefix by default** in order to cut down on visual clutter (Apologies that the screenshots don't reflect this for now - I plan to make new screenshots soon 🙇‍♂️). I am aware that Fish includes a very similar variable by default, and that you could also use `fish_vcs_prompt` if you wanted other vcs types, but this is _lazy_ port after all 😉


`set -U snorin_show_git_prefix` will enable the `git:` prefix (it doesn't need a value, only to be set. Use `set -gx snorin_show_git_prefix` if you're writing this to a config file)
`set -e snorin_show_git_prefix` will disable the `git:` prefix **this is the default behavior**

#### Error Codes
`snorin_show_error_code`  

By default, my inspiration Sorin theme uses a red `⏎` on the right side to indicate the last line returned non-zero. However, after playing around with some commands (`set -q` comes to mind), I realized _sometimes_ it might be better for it to actually print out the eror code instead.  

This can now be enabled via  
`set -U snorin_show_error_code` or
`set -gx snorin_show_error_code` if you're writing to this to a config

`set -e snorin_show_git_prefix` will disable it and you'll return to the `⏎` **this is the default behavior**

### Random Fun
I thought it might be fun to have the ability to have random colors generated for your prompts, so I wrote a little function that uses 
either `jot` or `shuf` (make sure you have at least one of these installed<sup id="a1">[1](#f1)</sup>) to help make some random colors for your prompts. It works like 
this  
```
snorin_random_chevrons N
```
(where N is the number of chevrons you want. It can also be passed without N to just do one chevron)

#### For Instance
If you want each new term session/tab to have a different prompt in your `fish_config` (mine's at `~/.config/fish/config.fish`, but ymmv) you could do something like  
```
if type -q snorin_random_chevrons
    snorin_random_chevrons 3
end
```  
(`type -q` will (q)uietly check if a function/program if it exists, returning a value rather than listing the output of `type`)

That should give each new session/tab a different set of colors (maybe. I only defined 10 colors so duplicates will happen)

This is just a "for instance". There's hundreds of triggering events you could use to have a prompt
change colors or number of `❯`. Use your imagination!

**sources**:  
https://github.com/robbyrussell/oh-my-zsh/blob/master/themes/sorin.zsh-theme  
https://github.com/fish-shell/fish-shell/pull/2243  
(I believe this eventually morphed into [this](https://github.com/fish-shell/fish-shell/blob/master/share/tools/web_config/sample_prompts/sorin.fish), however I found this shorter version better as inpiration)

**Footnotes**  
<b id="f1">1</b> Interestingly enough, `shuf` doesn't do duplicates, whereas `jot` does. I don't consider this an issue, but this might drive some people _crazy_ [↩](#a2)
