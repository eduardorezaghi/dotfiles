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
    # SSH agent persistence with systemd
    export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

    # if running bash and .bashrc exists, include it
    [[ -n "$BASH_VERSION" && -f "$HOME/.bashrc" ]] && . "$HOME/.bashrc"

    # add user's private bin directories to PATH if they exist
    [[ -d "$HOME/bin" ]] && PATH="$HOME/bin:$PATH"
    [[ -d "$HOME/.local/bin" ]] && PATH="$HOME/.local/bin:$PATH"
fi
