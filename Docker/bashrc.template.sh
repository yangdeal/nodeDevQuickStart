# ~/.bashrc: executed by bash(1) for non-login shells.

export LS_OPTIONS='--color=auto'

alias ls='ls $LS_OPTIONS'
alias ll='ls $LS_OPTIONS -l'
alias l='ls $LS_OPTIONS -lA'
alias nt='npm test'

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="[InsideDocker]\[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "