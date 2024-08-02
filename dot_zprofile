# SSH agent persistence with systemd
[[ -S "$XDG_RUNTIME_DIR/ssh-agent.socket" ]] && export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"


# Funtoo keychain.
if [ "$(uname)" = "Linux" ]; then
    # If keychain is installed, load the keys.
    (command -v keychain &>/dev/null) && eval $(keychain --eval --quiet id_ed25519 id_rsa) 2>/dev/null
fi



# Set PATH environment variable
# add user's private bin directories to PATH if they exist
[[ -d "$HOME/.local/bin" ]] && PATH="$HOME/.local/bin:$PATH"
[[ -d "$HOME/bin" ]] && PATH="$HOME/bin:$PATH"

# Set default editor
export EDITOR="vim"


# For OpenFortiVPN
alias vpn="openfortivpn-webview --url 'https://vpn.skyone.solutions:10443/remote/saml/start?redirect=0' | sudo openfortivpn vpn.skyone.solutions:10443 -c ~/config.template --cookie-on-stdin"
