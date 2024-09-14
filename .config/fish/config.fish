# pyenv setup
set -gx PYENV_ROOT $HOME/.pyenv
set -gx PATH $PYENV_ROOT/bin $PATH
set -gx PATH $HOME/.local/bin $PATH
set -gx PGGSSENCMODE "disable"
set -Ux PAGER "less"
set -Ux SSH_AUTH_SOCK $HOME/.ssh/wsl-ssh-agent.sock

# Disable the welcome message
set -g fish_greeting ''

if status is-interactive
    if command -v fzf > /dev/null
        # Set fzf key bindings
        fzf --fish | source
    end

    if command -v pyenv > /dev/null
        pyenv init - | source
    end

    if command -v fzf > /dev/null
        # Set fzf key bindings
        fzf --fish | source
    end
 
    # Initialize asdf if present
    if test -f ~/.asdf/asdf.fish
        source ~/.asdf/asdf.fish
    end

    # Initialize rbenv if present
    if command -v rbenv > /dev/null
        . (rbenv init - | psub)
    end

    # Add homebrew to the path
    if test -d /opt/homebrew/bin
        set -gx PATH /opt/homebrew/bin $PATH
    end

    # Use socat to create a socket for ssh-agent
    if test -e ~/.local/bin/wsl-ssh-agent-relay
        wsl-ssh-agent-relay start
    end
end

status --is-interactive; and pyenv virtualenv-init - | source

