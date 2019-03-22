#! /bin/sh

alias k="kubectl"

alias kaf="~/go/bin/kaf"

alias flush-dns="sudo /etc/init.d/dns-clean restart"

alias d="sudo -E docker"
alias dc="sudo -E docker-compose"

alias clipboard="xclip -sel clip"

alias wifi="nmtui"

alias xrandr-sd="$HOME/.screenlayout/scaled-docked.sh"
alias xrandr-a="xrandr --auto"

alias git=hub

alias volume=alsamixer

function docker-use-minikube() {
     eval $(minikube docker-env)
}


function bosun-env() {
     eval $(bosun env $1)
}
alias b="bosun"

alias kafka-helper="kubectl run -i -t kafka-helper --restart=Never --rm=true --image=docker.n5o.black/utils/kafka-helper --overrides='{ \"apiVersion\": \"v1\", \"spec\": { \"imagePullSecrets\": [{\"name\": \"docker-n5o-black\"}] } }'"
alias cassandra-cqlsh="kubectl run -i -t cassandra-helper --restart=Never --rm=true --image=docker.n5o.black/utils/cqlsh --overrides='{ \"apiVersion\": \"v1\", \"spec\": { \"imagePullSecrets\": [{\"name\": \"docker-n5o-black\"}] } }'"


function kube-proxy-dashboard() {
     name=$(k get -n kube-system pods --selector=app=kubernetes-dashboard -o jsonpath='{$.items[0].metadata.name}')
     k port-forward -n kube-system $name 9090
}

alias edit-aliases="code --wait /home/steve/.oh-my-zsh/custom/aliases.zsh && source /home/steve/.oh-my-zsh/custom/aliases.zsh"
alias edit-zsh="code --wait /home/steve/.zshrc && source ~/.zshrc"
alias edit-bosun="code --wait /home/steve/.bosun/bosun.yaml"

alias kube-dnstools="kubectl run -it --rm --restart=Never --image=infoblox/dnstools:latest dnstools"

function show-cert(){
     openssl x509 -text -noout -in $1
}

alias busybox="kubectl run -it --rm --restart=Never --image=busybox busybox"