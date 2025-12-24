# puritan-fish-prompt

A minimal prompt for the [Fish Shell](https://fishshell.com). Inspired by Robby Russel. 

## Features

- Displays the current directory
- Support for `git` *(branch name and repository status)*. Displays a circle if the branch is dirty.
- Displays '$' for user session and '#' for root session

## Screenshot

![Screenshot of the prompt](.github/puritan-fish-prompt.png)

## Installation


### Requirements

You need [Fish Shell](https://fishshell.com) and [Oh My Fish!](https://github.com/oh-my-fish/oh-my-fish/).

### Installing

#### create new theme

`$ omf new theme puritan`

#### open config file

`$ vim ~/.config/omf/themes/puritan/fish_prompt.fish`

```fish
# name: puritan
# author: Lodobo

function _is_git_dirty
    echo (command git status -s --ignore-submodules=dirty 2> /dev/null)
end

function fish_prompt
    set -l cyan (set_color -o cyan)
    set -l magenta (set color -o magenta)
    set -l normal (set_color normal)

    if fish_is_root_user
        set indicator '#'
    else
        set indicator '$'
    end
    set -l cwd $cyan(path basename $PWD)

    if [ (_is_git_dirty) ]
        set git_status "$normal ●"
    end

    set -g __fish_git_prompt_color magenta 
    set -l git_prompt "$(fish_git_prompt)$git_status"
    echo -n -s $cyan $indicator ' ' $cwd $git_prompt ' '
end
```

#### switch to new theme
`$ echo "puritan" > ~/.config/omf/theme`
