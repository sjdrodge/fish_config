if not set -q my_fish_user_vars_initialized
  my_fish_user_variables
end

# Keychain
if begin; status --is-interactive; and type keychain >/dev/null 2>&1; end
  eval (keychain --agents ssh --quiet --eval id_rsa | sed 's/^\(set -e \S\+; \)and \(.*\)$/\1\2;/')
end

# Virtualenv
set -U VIRTUALFISH_HOME $HOME/.venv
source $HOME/.config/fish/virtualfish/virtual.fish
source $HOME/.config/fish/virtualfish/auto_activation.fish

# DIR_COLORS
if begin; type dircolors >/dev/null 2>&1; and test -e $HOME/.dircolors; end
  eval (dircolors -c $HOME/.dircolors  | sed 's/>&\/dev\/null$//')
end

# Git prompt variables
set -g __fish_git_prompt_show_informative_status 1
# set -g __fish_git_prompt_showupstream 'informative'
set -g __fish_git_prompt_showstashstate 1
set -g __fish_git_prompt_describe_style 'branch'

set -g __fish_git_prompt_char_upstream_prefix ''
set -g __fish_git_prompt_char_upstream_ahead '↑'
set -g __fish_git_prompt_char_upstream_behind '↓'
# set -g __fish_git_prompt_char_stateseparator '❘'
set -g __fish_git_prompt_char_dirtystate '✚'
set -g __fish_git_prompt_char_invalidstate '✖'
set -g __fish_git_prompt_char_stagedstate '●'
set -g __fish_git_prompt_char_untrackedfiles '…'
set -g __fish_git_prompt_char_cleanstate '✔'
set -g __fish_git_prompt_char_stashstate '$'

set -g __fish_git_prompt_color_dirtystate cyan
set -g __fish_git_prompt_color_invalidstate $fish_color_error
set -g __fish_git_prompt_color_stagedstate yellow
set -g __fish_git_prompt_color_untrackedfiles $fish_color_normal
set -g __fish_git_prompt_color_cleanstate green --bold
# set -g __fish_git_prompt_color_stashstate

# set -g __fish_git_prompt_color_prefix
# set -g __fish_git_prompt_color_suffix
# set -g __fish_git_prompt_color_bare
# set -g __fish_git_prompt_color_merging
set -g __fish_git_prompt_color_branch magenta --bold
# set -g __fish_git_prompt_color_flags
# set -g __fish_git_prompt_color_upstream
