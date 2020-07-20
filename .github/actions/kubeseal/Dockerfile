FROM golang:1.14.3

# Get Kubeseal
RUN GO111MODULE=on go get -v github.com/bitnami-labs/sealed-secrets/cmd/kubeseal@v0.12.4

# Install kubectl from Docker Hub.
COPY --from=lachlanevenson/k8s-kubectl:v1.16.3 /usr/local/bin/kubectl /usr/local/bin/kubectl

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]