function my_fish_user_variables

  set -U my_fish_user_vars_initialized 1
  set -e fish_user_paths

  # PATH - Node/NPM
  echo -n 'Setting NPM_PACKAGES and NODE_PATH... '
  set -Ue NPM_PACKAGES
  set -Ux NPM_PACKAGES $HOME/.npm-packages
  set -Ue NODE_PATH
  set -Ux NODE_PATH $NPM_PACKAGES/lib/node_modules $NODE_PATH
  echo 'Done.'
  my_add_user_path $NPM_PACKAGES/bin 'local NPM packages'

  # PATH - Cabal
  my_add_user_path $HOME/.cabal/bin 'local cabal packages'


  # PATH - Rust
  my_add_user_path $HOME/.cargo/bin 'local rust installation'

  # PATH - Personal
  my_add_user_path $HOME/bin '$HOME/bin'
  my_add_user_path $HOME/.local/bin '$HOME/.local/bin'

  # Universal environment variables
  echo -n 'Setting HOSTNAME... '
  set -Ue HOSTNAME
  set -Ux HOSTNAME (hostname)
  echo 'Done.'

  echo -n 'Setting TERMINAL... '
  set -Ue TERMINAL
  set -Ux TERMINAL konsole
  echo 'Done.'

  echo -n 'Setting EDITOR... '
  set -Ue EDITOR
  set -Ux EDITOR nvim
  echo 'Done.'

  echo -n 'Setting PAGER... '
  set -Ue PAGER
  if type vimpager >/dev/null 2>&1
    set -Ux PAGER vimpager
    echo 'Done.'
  else
    echo 'vimpager is not installed.'
  end

end
