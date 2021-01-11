export ZSH=$HOME/.oh-my-zsh # Path to installation
ZSH_THEME="avit"          # Found in ~/.oh-my-zsh/themes

export UPDATE_ZSH_DAYS=1   # Ask for update everyday

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Add wisely, as too many plugins slow down shell startup.
plugins=(git npm) # Plugins found in ~/.oh-my-zsh/plugins/

source $ZSH/oh-my-zsh.sh

# Use vim for local and ssh sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='vim'
 fi

#####################################
#       Custom Keybindings          #
#####################################
bindkey -v #vim mode!

#######################################
#   PATH AND ENVIRONMENT VARIABLES    #
#######################################
#

# Load nvm
export NVM_DIR="/Users/michael/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  

export PATH="/usr/local/bin:/usr/Cellar/bin/git:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/Users/michael/bin:/Users/michael/bin:$GOROOT/bin:$PATH:$HOME/.rvm/bin/$PATH:$HOME/Library/Android/sdk/platform-tools"
export GOPATH=/Users/$USER/go
export PATH=$GOPATH/bin:$PATH

# place this after nvm initialization!
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# Ruby and RBENV stuff for openssl versions
local READLINE_PATH=$(brew --prefix readline)
local OPENSSL_PATH=$(brew --prefix openssl)
export LDFLAGS="-L$READLINE_PATH/lib -L$OPENSSL_PATH/lib"
export CPPFLAGS="-I$READLINE_PATH/include -I$OPENSSL_PATH/include"
export PKG_CONFIG_PATH="$READLINE_PATH/lib/pkgconfig:$OPENSSL_PATH/lib/pkgconfig"

# Use the OpenSSL from Homebrew instead of ruby-build
# Note: the Homebrew version gets updated, the ruby-build version doesn't
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$OPENSSL_PATH"

# Place openssl@1.1 at the beginning of your PATH (preempt system libs)
export PATH=$OPENSSL_PATH/bin:$PATH
eval "$(rbenv init -)"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true
