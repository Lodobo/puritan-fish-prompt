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
