#!/bin/bash

kubectl create secret generic $INPUT_NAME --namespace=$INPUT_NAMESPACE --dry-run --from-literal=$INPUT_KEY=$INPUT_VALUE -o json >mysecret.json

if $(echo $INPUT_CERT | base64 --decode > seal.crt); then
    echo "Using base64 encoded cert"
else
    echo "Could not decode signing cert"
    exit 2
fi

kubeseal --cert seal.crt -o yaml <mysecret.json > "$INPUT_OUTPUT"
RESULT=$?
rm mysecret.json seal.crt

exit $RESULT