# PATH
set -e fish_user_paths
# # Rubygems
if type ruby gem >/dev/null 2>&1
  set -U fish_user_paths (ruby -rubygems -e 'puts Gem.user_dir')/bin $fish_user_paths
end
# # Node/NPM
set -Ux NPM_PACKAGES $HOME/.npm-packages
set -gx NODE_PATH $NPM_PACKAGES/lib/node_modules $NODE_PATH
if test -e $NPM_PACKAGES/bin
  set -U fish_user_paths $NPM_PACKAGES/bin $fish_user_paths
end
# # Cabal
if test -e $HOME/.cabal/bin
  set -U fish_user_paths $HOME/.cabal/bin $fish_user_paths
end
# # Personal
if test -e $HOME/bin
  set -U fish_user_paths $HOME/bin $fish_user_paths
end

# Universal environment variables
set -Ux HOSTNAME (hostname)
set -Ux EDITOR vim
if type vimpager >/dev/null 2>&1
  set -Ux PAGER vimpager
end

# Keychain
if begin; status --is-interactive; and type keychain >/dev/null 2>&1; end
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
