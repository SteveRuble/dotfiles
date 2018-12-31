#! /bin/sh

alias k="kubectl"

alias flush-dns="sudo /etc/init.d/dns-clean restart"

alias d="sudo -E docker"
alias dc="sudo -E docker-compose"

alias clipboard="xclip -sel clip"

alias wifi="nmtui"

alias xrandr-sd="$HOME/.screenlayout/scaled-docked.sh"
alias xrandr-a="xrandr --auto"

alias git=hub

alias volume=alsamixer

alias useMinikubeDocker="eval $(minikube docker-env)"

alias bounce-traefik="k delete pod -n kube-system --selector=app=traefik"

alias docker-use-minikube="eval $(minikube docker-env)"

alias bosun-red="eval $(bosun env red)"
alias bosun-green="eval $(bosun env green)"
alias b="bosun"

alias kafka-helper="kubectl run -i -t kafka-helper --restart=Never --rm=true --image=docker.n5o.black/utils/kafka-helper --overrides='{ \"apiVersion\": \"v1\", \"spec\": { \"imagePullSecrets\": [{\"name\": \"docker-n5o-black\"}] } }'"
alias cassandra-cqlsh="kubectl run -i -t cassandra-helper --restart=Never --rm=true --image=docker.n5o.black/utils/cqlsh --overrides='{ \"apiVersion\": \"v1\", \"spec\": { \"imagePullSecrets\": [{\"name\": \"docker-n5o-black\"}] } }'"


function kube-proxy-dashboard() {
     name=$(k get -n kube-system pods --selector=app=kubernetes-dashboard -o jsonpath='{$.items[0].metadata.name}')
     k port-forward -n kube-system $name 9090
}
