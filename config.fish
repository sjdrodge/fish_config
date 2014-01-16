# PATH
if which ruby gem >/dev/null 2>&1
  set -gx PATH (ruby -rubygems -e 'puts Gem.user_dir')/bin $PATH
end
set -gx PATH $HOME/.cabal/bin $PATH
set -gx PATH $HOME/bin $PATH

# Universal environment variables
set -Ux EDITOR vim
set -Ux PAGER vimpager
set -Ux HOSTNAME (hostname)

# Keychain
if begin; status --is-interactive; and which keychain >/dev/null 2>&1; end
  eval (keychain --quiet --eval id_rsa | sed 's/^set -e \S\+; and \(.*\)$/\1;/')
end

# Virtualenv
set -U VIRTUALFISH_HOME $HOME/.venv
source $HOME/.config/fish/virtualfish/virtual.fish
source $HOME/.config/fish/virtualfish/auto_activation.fish

# Git prompt variables
set -g __fish_git_prompt_show_informative_status 1
set -g __fish_git_prompt_hide_untrackedfiles 1

set -g __fish_git_prompt_color_branch magenta --bold
set -g __fish_git_prompt_showupstream "informative"
set -g __fish_git_prompt_char_upstream_ahead "↑"
set -g __fish_git_prompt_char_upstream_behind "↓"
set -g __fish_git_prompt_char_upstream_prefix ""

set -g __fish_git_prompt_char_stagedstate "●"
set -g __fish_git_prompt_char_dirtystate "✚"
set -g __fish_git_prompt_char_untrackedfiles "…"
set -g __fish_git_prompt_char_conflictedstate "✖"
set -g __fish_git_prompt_char_cleanstate "✔"

set -g __fish_git_prompt_color_dirtystate cyan
set -g __fish_git_prompt_color_stagedstate yellow
set -g __fish_git_prompt_color_invalidstate $fish_color_error
set -g __fish_git_prompt_color_untrackedfiles $fish_color_normal
set -g __fish_git_prompt_color_cleanstate green --bold
