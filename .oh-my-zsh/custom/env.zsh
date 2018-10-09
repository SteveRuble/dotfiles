#! /usr/bin/sh

vaultAddr=""
vaultToken=""
kubeContext=""
awsProfile=""


function awsenv() {
    case $1 in
      "blue") 
        awsProfile=blue
        ;;
    "green") 
        awsProfile=green
        ;;
    "black") 
        awsProfile=black
        ;;
    "red") 
        awsProfile=invalid
        echo "environment set to red/local; AWS will not work"
        ;;
    esac
}

function vaultenv() {
    case $1 in
      "blue") 
        vaultAddr=https://vault.n5o.blue 
        vaultToken=$(lpass show --password 3324219216113289275)        
        ;;
    "green") 
        vaultAddr=https://vault.n5o.green 
        vaultToken=$(lpass show --password 3745818468311014309)
        ;;
    "black") 
        vaultAddr=https://vault.n5o.blue 
        vaultToken=$(lpass show --password 3324219216113289275)        
        ;;
    "red") 
        vaultAddr=https://vault.n5o.red 
        vaultToken=root
        ;;
    esac

}

function kubeenv() {
    case $1 in
      "blue") 
        kubeContext=arn:aws:eks:us-east-1:759703860832:cluster/blue 
        ;;
    "green") 
        kubeContext=arn:aws:eks:us-east-1:696021726152:cluster/green
        ;;
    "black") 
       kubeContext=arn:aws:eks:us-east-1:759703860832:cluster/blue 
        ;;
    "red") 
        kubeContext=minikube 
        ;;
    esac
}

function apply(){
    export AWS_DEFAULT_PROFILE=$awsProfile
    export VAULT_ADDR=$vaultAddr
    export VAULT_TOKEN=$vaultToken
    kubectl config use-context $kubeContext
}


function setenv() {

    awsenv $1
    kubeenv $1
    vaultenv $1
    apply

}
