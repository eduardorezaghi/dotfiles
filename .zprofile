# SSH agent persistence with systemd
[[ -S "$XDG_RUNTIME_DIR/ssh-agent.socket" ]] && export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"


# Set PATH environment variable
# add user's private bin directories to PATH if they exist
[[ -d "$HOME/.local/bin" ]] && PATH="$HOME/.local/bin:$PATH"
[[ -d "$HOME/bin" ]] && PATH="$HOME/bin:$PATH"

# Set default editor
export EDITOR="vim"