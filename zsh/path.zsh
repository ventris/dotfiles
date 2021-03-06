# Dotfiles path
export DOTFILES="$HOME/code/dotfiles"

# Fuzzy find 
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

# Binutils
export PATH="/opt/homebrew/opt/binutils/bin:$PATH"

# Load binaries from dotfiles
export PATH="$DOTFILES/bin/scripts:$PATH"
export PATH="$DOTFILES/private/bin:$PATH"
export PATH="$DOTFILES/baffinbay/bin:$PATH"

# Homebrew paths
export PATH="/opt/homebrew/opt/curl/bin:$PATH"
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"
export PATH="/opt/homebrew/opt/node@18/bin:$PATH"

# Golang paths
export GOPATH=$HOME/go
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"

# Curl
