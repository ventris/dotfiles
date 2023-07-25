# shortcut to this dotfiles path is $ZSH
export DOTFILES="$HOME/code/dotfiles"

# all of our zsh files
typeset -U config_files
config_files=($DOTFILES/**/*.zsh)

# load the path files
for file in ${(M)config_files:#*/path.zsh}
do
  source $file
done

# load everything but the path and completion files
for file in ${${config_files:#*/path.zsh}:#*/completion.zsh}
do
  source $file
done

# initialize autocomplete here, otherwise functions won't be loaded
autoload -Uz compinit
compinit
autoload -U colors
colors

HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=1000000
setopt extendedglob nomatch notify share_history
setopt prompt_subst
unsetopt appendhistory autocd beep

# colors for prompt https://www.ditig.com/256-colors-cheat-sheet
PROMPT=$'%{\e[38;5;214m%}[%{\e[0m%}%m%{\e[38;5;214m%}]%{\e[01;30m%}%{\e[0;0m%} '
RPROMPT=$'[%{\e[38;5;214m%}%~%{\e[0m%}] [$(TZ=Europe/Stockholm date +%H:%M:%S)]'

#TMOUT=1
#TRAPALRM() {
#  zle reset-prompt }
#
#preexec() {
#  print -Pn "\e]0;%~ "
#  echo -n "$1"
#  print -Pn "\a"
#}
#precmd() {
#  print -Pn "\e]0;%~\a"
#}
