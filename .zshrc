# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=/home/steve/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="bureau"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

setopt histignorespace

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git docker node npm archlinux docker-compose vault systemd ssh-agent aws kubectl helm
)

fpath=(~/.completions $fpath)


source $ZSH/oh-my-zsh.sh

# enable ssh agent forwarding
zstyle :omz:plugins:ssh-agent agent-forwarding on
zstyle :omz:plugins:ssh-agent lifetime 8h

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='nano'
 else
   export EDITOR='nano'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
 export SSH_KEY_PATH="~/.ssh/id_rsa"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias rz="source ~/.zshrc"

alias docker="sudo -E docker"
alias d="sudo -E docker"
alias docker-compose="sudo -E docker-compose"
alias dc="sudo -E docker-compose"

export VAULT_ADDR=https://vault.n5o.green


export GOBIN="$HOME/go/bin"
export GOPATH="$HOME/go"
export GOROOT="/usr/local/go"
export PATH="$GOBIN:$GOROOT/bin:$HOME/.local/bin:$PATH"

alias startdev="aws ec2 start-instances --instance-ids i-0690ba7980cedaf0f"
alias stopdev="aws ec2 stop-instances --instance-ids i-0690ba7980cedaf0f"


alias vaultblue="export VAULT_ADDR=https://vault.n5o.blue VAULT_TOKEN=\$(lpass show --password 3324219216113289275)"
alias vaultgreen="export VAULT_ADDR=https://vault.n5o.green VAULT_TOKEN=\$(lpass show --password 3745818468311014309)"
alias vaultred="export VAULT_ADDR=http://vault.n5o.red VAULT_TOKEN=root"
alias vaulttoken="vault token lookup --format=json | jq -r .data.id"

export SPARK_HOME=~/sdks/spark
export PATH=$SPARK_HOME/bin:$PATH

export KAFKA_BIN=~/bin/spark/bin
export PATH=$KAFKA_BIN:$PATH

export PATH=$HOME/bin:/snap/bin:$PATH


alias k="kubectl"

alias flush-dns="sudo systemd-resolve --flush-caches"

function setenv() {

case $1 in
  "blue") 
    vaultblue
    export AWS_DEFAULT_PROFILE=blue
    echo "environment set to blue"
    ;;
  "green") 
    vaultgreen 
    export AWS_DEFAULT_PROFILE=green
    echo "environment set to green"
    ;;
  "red") 
    vaultred 
    export AWS_DEFAULT_PROFILE=green
    echo "environment set to red/local; AWS will not work"
    ;;
esac

}

function forget() {
  LC_ALL=C sed -i "/$1/d" $HISTFILE
}
