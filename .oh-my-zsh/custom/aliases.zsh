#! /bin/sh

alias k="kubectl"

alias kaf="~/go/bin/kaf"

alias flush-dns="sudo systemctl restart systemd-resolved.service"

alias d="sudo -E docker"
alias dc="sudo -E docker-compose"

alias clipboard="xclip -sel clip"

alias wifi="nmtui"

alias xrandr-sd="$HOME/.screenlayout/scaled-docked.sh"
alias xrandr-v="$HOME/.screenlayout/visiontek.sh"
alias xrandr-a="xrandr --auto"

alias git=hub

alias volume=alsamixer

function docker-use-minikube() {
     eval $(minikube docker-env)
}

alias k8s-busybox="kubectl run -i -t busybox --restart=Never --rm=true --image=busybox"


function be() {
     eval $(bosun env use $1)
}
alias b="bosun"

alias kafka-helper="kubectl run -i -t kafka-helper --restart=Never --rm=true --image=docker.n5o.black/utils/kafka-helper --overrides='{ \"apiVersion\": \"v1\", \"spec\": { \"imagePullSecrets\": [{\"name\": \"docker-n5o-black\"}] } }'"
alias cassandra-cqlsh="kubectl run -i -t cassandra-helper --restart=Never --rm=true --image=docker.n5o.black/utils/cqlsh --overrides='{ \"apiVersion\": \"v1\", \"spec\": { \"imagePullSecrets\": [{\"name\": \"docker-n5o-black\"}] } }'"


function kube-proxy-dashboard() {
     name=$(k get -n kube-system pods --selector=app=kubernetes-dashboard -o jsonpath='{$.items[0].metadata.name}')
     k port-forward -n kube-system $name 9090
}

alias edit-aliases="code --wait /home/steve/.oh-my-zsh/custom/aliases.zsh && source /home/steve/.oh-my-zsh/custom/aliases.zsh"
alias reload-aliases="source /home/steve/.oh-my-zsh/custom/aliases.zsh"
alias edit-zsh="code --wait /home/steve/.zshrc && source ~/.zshrc"
alias edit-bosun="code --wait /home/steve/.bosun/bosun.yaml"

alias kube-dnstools="kubectl run -it --rm --restart=Never --image=infoblox/dnstools:latest dnstools"

function show-cert(){
     openssl x509 -text -noout -in $1
}

#alias busybox="kubectl run -it --rm --restart=Never --image=busybox busybox"

function busybox() {
     kubectl run --generator=run-pod/v1 -n ${$1:default} --restart=Never -i --tty --rm --image busybox ${USER}-spy --command sh
}

function busybox-tenants() {
     kubectl run --generator=run-pod/v1 -n tenants  --restart=Never -i --tty --rm --image busybox ${USER}-spy --command sh
}

function alpine() {
     namespace=${1:-default}
     kubectl run --generator=run-pod/v1 -n $namespace -i --tty --rm --image alpine ${USER}-spy --command sh
}
function alpine-tenants() {
     #ns=${$1:-"default"}
     kubectl run --generator=run-pod/v1 -n default -i --tty --rm --image alpine ${USER}-spy --command sh
}

function ubuntu-tenants() {
     #ns=${$1:-"default"}
     kubectl run --generator=run-pod/v1 -n tenants -i --tty --image ubuntu:18.04 ${USER}-ubuntu-spy --command bash
}

function edit(){
     code --wait $1
}

# always run gotop with individual cpus and battery
alias gotop="gotop -b -p -c monokai"

function noipv6(){
 sudo sysctl -w net.ipv6.conf.all.disable_ipv6=1 
 sudo sysctl -w net.ipv6.conf.default.disable_ipv6=1 
 sudo sysctl -w net.ipv6.conf.wlp59s0.disable_ipv6=1 
}

alias ks="kubectl -n kube-system"

alias ls="ls -al --color"

alias git-back="git checkout @{-1}"

alias snip="scrot -s '$HOME/images/shots/%Y-%m-%d-%k-%M-%S.png'"

alias reload-aliases="source /home/steve/.oh-my-zsh/custom/aliases.zsh"

alias kld="k logs -n default --follow --tail 1000"
alias klt="k logs -n tenants --follow --tail 1000"
alias kd="k -n default"
alias kt="k -n tenants"



# BOSUN ALIASES

alias bi="bosun app script bosun install"

# Reset a topic to the end. Argument 1 is the group, argument 2 is the topic.
# The statefulSet which runs the group must be scaled to 0 first.
function reset-topic() {
     group=$1
     topic=$2
     kubectl exec -n default kafka-0 -c kafka-broker -- bash -c "unset JMX_PORT && kafka-consumer-groups --bootstrap-server localhost:9092 --topic $topic --group $group --reset-offsets --to-latest --execute"
}

function oci-token(){
     oci ce cluster generate-token --cluster-id ocid1.cluster.oc1.iad.aaaaaaaaae3dembtg4ytimrqgbstsnzvheytom3dgy3timbrmczweztcgqyd --region us-ashburn-1 | jq .status.token -r
}


# Window info:

alias window-id="xwininfo"
# then get more info using xprop -id 0x3c00003 | grep PID


# Read consumer offsets:
# kafka-console-consumer --consumer-property enable.auto.commit=false --consumer-property exclude.internal.topics=false --formatter "kafka.coordinator.group.GroupMetadataManager\$OffsetsMessageFormatter" --bootstrap-server localhost:9092 --topic __consumer_offsets --from-beginning


alias mk="microk8s kubectl"