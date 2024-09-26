#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# MacOS specific settings.
if [[ "$(uname)" == "Darwin" ]]; then

    # For Macs with M2, need to disable PGGSSENCMODE.
    export PGGSSENCMODE="disable"

    # Homebrew
    eval $(/opt/homebrew/bin/brew shellenv)

    # Homebrew ASDF
    source /opt/homebrew/opt/asdf/libexec/asdf.sh

elif [[ "$(uname)" == "Linux" ]]; then
    (command -v keychain &>/dev/null) && eval $(keychain --eval --quiet id_ed25519 id_rsa) 2>/dev/null

    # if running bash and .bashrc exists, include it
    [[ -n "$BASH_VERSION" && -f "$HOME/.bashrc" ]] && . "$HOME/.bashrc"

    # add user's private bin directories to PATH if they exist
    [[ -d "$HOME/bin" ]] && PATH="$HOME/bin:$PATH"
    [[ -d "$HOME/.local/bin" ]] && PATH="$HOME/.local/bin:$PATH"
fi
. "$HOME/.cargo/env"

# Use socat to create a socket for ssh-agent
if [ test -e ~/.local/bin/wsl-ssh-agent-relay ]; then
    wsl-ssh-agent-relay start
    export SSH_AUTH_SOCK=$HOME/.ssh/wsl-ssh-agent.sock
fi
