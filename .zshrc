# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Functions
fpath=(~/.zsh_functions $fpath)
autoload -Uz stable_diffusion

# Github Copilot & other completions.
autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit

# AWS CLI.
complete -C '/usr/local/bin/aws_completer' aws


export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

MEWLINE=$'\n'

# Antigen
source ~/antigen.zsh
antigen init ~/.antigenrc


# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# dotfiles

# colorize ip command output
alias ip='ip -c'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias lgit=lazygit
alias dotfiles='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'

# Check if /snap/bin exists before adding it to PATH
if [ -d "/snap/bin" ]; then
    export PATH=$PATH:/snap/bin
fi


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion




# Check if rbenv is installed
if [ -d "$HOME/.rbenv" ]; then
    export PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(rbenv init -)"
fi

export PATH="$HOME/.local/bin:$PATH"

# MacOS specific settings.
if [ "$(uname)" = "Darwin" ]; then
    # Homebrew
    eval $(/opt/homebrew/bin/brew shellenv)

    # Homebrew ASDF
    source /opt/homebrew/opt/asdf/libexec/asdf.sh
fi

# Pyenv virtualenv command key
if command -v pyenv &>/dev/null; then
    export PYENV_ROOT="$HOME/.pyenv"
    [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi

# Options
setopt autocd              # Automatically change directory when typing a directory name
# setopt correct             # Suggest corrections for mistyped commands
setopt extendedglob        # Enable extended globbing patterns

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
