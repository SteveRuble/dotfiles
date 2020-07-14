# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=/home/steve/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="spaceship"



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
setopt INC_APPEND_HISTORY

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git docker npm docker-compose vault systemd 
  ssh-agent 
  aws 
  kubectl 
  helm zsh-completions
  zsh-autosuggestions
)

# skip_global_compinit=1

autoload -U compinit && compinit

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

export GOBIN="$HOME/go/bin"
export GOPATH="$HOME/go"
export GOROOT="/usr/local/go"
export PATH="$GOBIN:$GOROOT/bin:$HOME/.local/bin:$PATH"


source $HOME/.oh-my-zsh/custom/bosun-spaceship.zsh

# SPACESHIP_PROMPT_ORDER=(
#   #time          # Time stamps section
#   user          # Username section
#   dir           # Current directory section
#   host          # Hostname section
#   git           # Git section (git_branch + git_status)
#   hg            # Mercurial section (hg_branch  + hg_status)
#   package       # Package version
#   node          # Node.js section
#   ruby          # Ruby section
#   elixir        # Elixir section
#   xcode         # Xcode section
#   swift         # Swift section
#   golang        # Go section
#   php           # PHP section
#   rust          # Rust section
#   haskell       # Haskell Stack section
#   julia         # Julia section
#  # docker        # Docker section
#   aws           # Amazon Web Services section
#   venv          # virtualenv section
#   conda         # conda virtualenv section
#   pyenv         # Pyenv section
#   dotnet        # .NET section
#   ember         # Ember.js section
#   kubecontext   # Kubectl context section
#   bosun
#   exec_time     # Execution time
#   line_sep      # Line break
#   battery       # Battery level and status
#   #vi_mode       # Vi-mode indicator
#   jobs          # Background jobs indicator
#   exit_code     # Exit code section
#   char          # Prompt character
# )

SPACESHIP_RPROMPT_ORDER=(
  time
)

SPACESHIP_TIME_SHOW=true

SPACESHIP_BATTERY_THRESHOLD=25
SPACESHIP_BATTERY_SHOW=true
SPACESHIP_EXIT_CODE_SHOW=true

SPACESHIP_KUBECONTEXT_PREFIX=""


# https://github.com/denysdovhan/spaceship-prompt/blob/master/docs/Options.md

export NVM_DIR="/usr/share/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias rz="source ~/.zshrc"

export VAULT_ADDR=https://vault.n5o.green

export EDITOR="code --wait"

export SPARK_HOME=/usr/local/spark
export PATH=$SPARK_HOME/bin:$PATH

export KAFKA_BIN=$HOME/bin/kafka/
export SPARK_BIN=/opt/spark/bin
export PATH=$KAFKA_BIN:$SPARK_BIN:$PATH:

export PATH=$HOME/bin:/snap/bin:/usr/sbin:$PATH

function forget() {
  LC_ALL=C sed -i "/$1/d" $HISTFILE
  fc -R
}

export LD_LIBRARY_PATH=/usr/lib/oracle/12.2/client64/lib/${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}

export ORACLE_HOME=/usr/lib/oracle/12.2/client64

export PATH=$PATH:$ORACLE_HOME/bin

export LPASS_HOME="${HOME}/.local/share/lpass"

fpath=($fpath "/home/steve/.zfunctions")

export DATAFLOW_CONTRACTS_PATH=/home/steve/src/github.com/naveego/dataflow-contracts
export DEVOPS_PATH=/home/steve/src/github.com/naveegoinc/devops

export DOTNET_SKIP_FIRST_TIME_EXPERIENCE=true

export GOMAXPROCS=6

#source ~/.config/hub.env

#nvm use v10.4.0 >> /dev/null

#$(bosun env current)
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/steve/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/home/steve/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/steve/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/steve/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

export PATH=/home/steve/bin:$PATH

[[ -e "/home/steve/bin/oracle-cli/lib/python3.6/site-packages/oci_cli/bin/oci_autocomplete.sh" ]] && source "/home/steve/bin/oracle-cli/lib/python3.6/site-packages/oci_cli/bin/oci_autocomplete.sh"

eval "$(starship init zsh)"
eval $(bosun env use current)
