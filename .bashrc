# pyenv

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PYENV_ROOT/shims:$PATH"

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

pyenv activate py36env >/dev/null 2>&1

alias l="ls -lah --color=auto"
alias ..="cd .."
alias h="cd ~"
alias n="vim "
