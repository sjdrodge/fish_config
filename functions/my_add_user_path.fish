function my_add_user_path
	
  #TODO: Actually print to stderr
  #TODO: Sanity check $argv
  #TODO: Good error reporting
  #TODO: Remove previous entry if already present
  if set -q argv[2]
    echo -n "Adding $argv[2] to PATH... "
  end
  if test -e $argv[1]
    set -U fish_user_paths $argv[1] $fish_user_paths
    echo 'Done.'
  else
    echo "No bin directory found at $argv[1]."
  end

end
