# pyenv setup
set -gx PYENV_ROOT $HOME/.pyenv
set -gx PATH $PYENV_ROOT/bin $PATH

set -gx PATH $HOME/.local/bin $PATH

set -gx PGGSSENCMODE "disable"


# Disable the welcome message
set -g fish_greeting ''

# if not functions -q fisher
#     curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher

#     # Source the fish_plugins.fish file to install plugins
#     if test -f ~/.config/fish/fish_plugins.fish
#         source ~/.config/fish/fish_plugins.fish
#     end
# end

if set -q VIRTUAL_ENV
    echo -n -s (set_color -b blue white) "(" (basename "$VIRTUAL_ENV") ")" (set_color normal) " "
end

if status is-interactive
    if command -v pyenv > /dev/null
        # Initialize pyenv
        if test -d $PYENV_ROOT
            pyenv init - | source
            pyenv virtualenv-init - | source
        end
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
end

