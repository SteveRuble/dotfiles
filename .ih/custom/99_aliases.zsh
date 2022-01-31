alias rz="source ~/.zshrc"
alias edit-zsh="code --wait ~/.zshrc && source ~/.zshrc"
alias edit-aliases="code --wait /Users/steve.ruble/.oh-my-zsh/custom/aliases.zsh && source /Users/steve.ruble/.oh-my-zsh/custom/aliases.zsh"

alias edit-karabiner="code --wait ~/.config/karabiner/karabiner.json"

alias ls="ls -lah"

# Remove alias set by git zsh plugin
if [[ $(type gr) =~ alias ]]; then
    unalias gr
fi

# GR Helpers
alias uat="aws-environment uat developer"

# Git
alias git-back="git checkout @{-1}"
alias git-push-first="git push -u origin HEAD"

# Kubectl
alias k="kubectl"

# docker
alias d="docker"

alias dc="docker-compose"

# Shell

function find_function {
    shopt -s extdebug
    declare -F "$1"
    shopt -u extdebug
}

# aws-environment
alias aws-up="aws-environment uat platform"
alias aws-ud="aws-environment uat developer"
alias aws-ip="aws-environment integration3 platform"
alias aws-op="aws-environment operations platform"

# ih-setup
alias ih-setup="/usr/local/Homebrew/Library/Taps/consultingmd/homebrew-ih-public/bin/ih-setup"

function gr-deploy-current(){
    local repo
    if ! git rev-parse --show-toplevel; then
        return 1
    fi
    repo=$(git rev-parse --show-toplevel)
    repo=$(basepath "$repo")
    gr deploy run "$repo" "$(git rev-parse HEAD)"
}