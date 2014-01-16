function fish_prompt --description 'Write out the prompt'
	
    set -l last_status $status
    set -l user_prompt '>'

    # Just calculate these once, to save a few cycles when displaying the prompt
    if not set -q __fish_prompt_hostname
        set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
    end

    if not set -q __fish_prompt_normal
        set -g __fish_prompt_normal (set_color normal)
    end

    if not set -q __fish_prompt_error
        set -g __fish_prompt_error (set_color $fish_color_error)
    end

    if not set -q __fish_prompt_venv
        set -g __fish_prompt_venv (set_color cyan)
    end


    # Print the previous job's exit status, if non-zero.
    if [ $last_status -ne 0 ]
        printf '%s(%d)%s ' "$__fish_prompt_error" $last_status "$__fish_prompt_normal"
    end

    # Print the current python virtual environment, if any.
    if set -q VIRTUAL_ENV
        printf '(%s%s%s) ' "$__fish_prompt_venv" (basename "$VIRTUAL_ENV") "$__fish_prompt_normal"
    end

    # Set our root colors, if we're root :)
    switch $USER
        case root
            set user_prompt '#'
            if not set -q __fish_prompt_cwd
                if set -q fish_color_cwd_root
                    set -g __fish_prompt_cwd (set_color $fish_color_cwd_root)
                else
                    set -g __fish_prompt_cwd (set_color $fish_color_cwd)
                end
            end
        case '*'
            if not set -q __fish_prompt_cwd
                set -g __fish_prompt_cwd (set_color $fish_color_cwd)
            end
    end

    # Print user@hostname abbreviated_working_dir (git_status)>
    printf '%s@%s ' "$USER" "$__fish_prompt_hostname"
    printf '%s%s%s' "$__fish_prompt_cwd" (prompt_pwd) "$__fish_prompt_normal"
    printf '%s%s ' (__fish_git_prompt) "$user_prompt"

end
