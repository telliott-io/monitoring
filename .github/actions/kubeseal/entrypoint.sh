#!/bin/bash

kubectl create secret generic $INPUT_NAME --namespace=$INPUT_NAMESPACE --dry-run --from-literal=$INPUT_KEY=$INPUT_VALUE -o json >mysecret.json

if $(echo $INPUT_CERT | base64 --decode > seal.crt); then
    echo "Using base64 encoded cert"
else
    echo "Using non-base64 cert"
    echo $INPUT_CERT > seal.crt
fi

kubeseal --cert seal.crt -o yaml <mysecret.json >$INPUT_OUTPUT
rm mysecret.json seal.crt