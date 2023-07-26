alias reloadshell="source $HOME/.zshrc"
alias reloaddns="dscacheutil -flushcache && sudo killall -HUP mDNSResponder"
alias ll="/usr/local/opt/coreutils/libexec/gnubin/ls -AhlFo --color --group-directories-first"
alias shrug="echo '¯\_(ツ)_/¯' | pbcopy"
alias c="clear"

# Directories
alias dotfiles="cd $DOTFILES"

# Git
alias g="git"
alias gs="git status"
alias gb="git branch"
alias gsw="git switch"
alias gl="git log --oneline --decorate --color"
alias ga="git commit --amend --no-edit"
alias gc="git commit -m"
alias diff="git diff"
alias force="git push --force"
alias nuke="git clean -df && git reset --hard"
alias pop="git stash pop"
alias gpl="git pull"
alias gpu="git push"
alias resolve="git add . && git commit --no-edit"
alias stash="git stash -u"
alias unstage="git restore --staged ."

# MTR
alias mtr='sudo /usr/local/sbin/mtr'

# Alias vim to nvim
alias vim="nvim"
alias v="nvim"

alias ls='ls -G'
alias ll='ls -al'


# TMUX
alias t="tmux"
alias tls="tmux list-session"
alias tat="tmux attach-session -d -t"

alias mux="tmuxp load -y "

alias less="less -R"
