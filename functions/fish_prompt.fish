function fish_prompt --description 'Write out the prompt'
	
  set -l last_status $status
  set -l color_venv 'cyan'
  set -l color_cwd
  set -l suffix

  # Just calculate these once, to save a few cycles when displaying the prompt
  if not set -q __fish_prompt_hostname
    set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
  end

  # Print the previous job's exit status, if non-zero.
  if [ $last_status -ne 0 ]
    printf '%s(%d)%s ' (set_color $fish_color_error) $last_status (set_color normal)
  end

  # Print the current python virtual environment, if any.
  if set -q VIRTUAL_ENV
    printf '(%s%s%s) ' (set_color $color_venv) (basename "$VIRTUAL_ENV") (set_color normal)
  end

  # Set the prompt suffix and current working directory color
  switch $USER
    case root
      if set -q fish_color_cwd_root
        set color_cwd $fish_color_cwd_root
      else
        set color_cwd $fish_color_cwd
      end
      set suffix '#'
    case '*'
      set color_cwd $fish_color_cwd
      set suffix ">"
  end

  # Print user@hostname abbreviated_working_dir (git_status)>
  printf '%s@%s ' "$USER" "$__fish_prompt_hostname"
  printf '%s%s%s' (set_color $color_cwd) (prompt_pwd) (set_color normal)
  printf '%s%s ' (__fish_git_prompt) "$suffix"

end
