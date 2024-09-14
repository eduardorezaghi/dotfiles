# For MacOS M2, need to disable PGGSSENCMODE.
if [[ $(uname) == "Darwin" ]]; then
    export PGGSSENCMODE="disable"
fi

# For WSL2, set the default browser to wslview (makes sure that the browser is opened in Windows).
[[ $(uname -r) == *"microsoft"* ]] && export BROWSER=wslview

export PAGER="nvimpager"

export CRYPTO_CY_PASSWORD="d6G@%a%qNVi4VXXPiPXCT*HxGgBmrLWPhvK"
export CRYPTO_CY_SECRET="d6G@%a%qNVi4VXXPiPXCT*HxGgBmrLWPhvK"

export HISTCONTROL=ignoredups
export HISTSIZE=10000
export HISTFILESIZE=10000

# Set JAVA_HOME if java is installed
if command -v java &> /dev/null; then
    export JAVA_HOME=$(dirname $(dirname $(readlink -f $(which java))))
fi
. "$HOME/.cargo/env"
