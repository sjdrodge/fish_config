function my_fish_user_variables
	
  set -U my_fish_user_vars_initialized 1
  set -e fish_user_paths

  # PATH - Rubygems
  echo -n 'Adding local Ruby Gems to PATH... '
  if begin; type ruby >/dev/null 2>&1; and type gem >/dev/null 2>&1; end
    my_add_user_path (ruby -rubygems -e 'puts Gem.user_dir')/bin
  else
    echo 'Rubygems is not installed.'
  end

  # PATH - Node/NPM
  echo -n 'Setting NPM_PACKAGES and NODE_PATH... '
  set -Ux NPM_PACKAGES $HOME/.npm-packages
  set -Ux NODE_PATH $NPM_PACKAGES/lib/node_modules $NODE_PATH
  echo 'Done.'
  my_add_user_path $NPM_PACKAGES/bin 'local NPM packages'

  # PATH - Cabal
  my_add_user_path $HOME/.cabal/bin 'local cabal packages'

  # PATH - Personal
  my_add_user_path $HOME/bin '$HOME/bin'

  # Universal environment variables
  echo -n 'Setting HOSTNAME... '
  set -Ux HOSTNAME (hostname)
  echo 'Done.'

  echo -n 'Setting EDITOR... '
  set -Ux EDITOR vim
  echo 'Done.'

  echo -n 'Setting PAGER... '
  if type vimpager >/dev/null 2>&1
    set -Ux PAGER vimpager
    echo 'Done.'
  else
    echo 'vimpager is not installed.'
  end

end
