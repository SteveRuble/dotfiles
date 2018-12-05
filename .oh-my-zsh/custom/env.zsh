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
        awsProfile=black
        echo "environment set to red/local; AWS set to black."
        ;;
    esac

    export AWS_DEFAULT_PROFILE=$awsProfile
}

function vaultenv() {
    case $1 in
      "blue") 
        vaultAddr=https://vault.n5o.blue 
        vaultToken=$(lpass show --password 3324219216113289275)        
        ;;
    "green") 
        vaultAddr=https://vault.n5o.green 
        vaultToken=root #$(lpass show --password 3745818468311014309)
        ;;
    "black") 
        vaultAddr=https://vault.n5o.blue 
        vaultToken=$(lpass show --password 3324219216113289275)        
        ;;
    "red") 
        vaultAddr=http://vault.n5o.red 
        vaultToken=root
        ;;
    esac

    export VAULT_ADDR=$vaultAddr
    export VAULT_TOKEN=$vaultToken
}

function kubeenv() {
    case $1 in
      "blue") 
        kubeContext=blue
        ;;
    "green") 
        kubeContext=green
        ;;
    "black") 
       kubeContext=black
        ;;
    "red") 
        kubeContext=minikube 
        ;;
    esac

    kubectl config use-context $kubeContext
}

function setenv() {

    awsenv $1
    kubeenv $1
    vaultenv $1

}
