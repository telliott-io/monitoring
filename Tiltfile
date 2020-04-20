k8s_yaml("namespace.yaml")
k8s_yaml("opentelemetry/collector.yaml")
k8s_yaml("jaeger/jaeger.yaml")
k8s_yaml(kustomize("grafana"))
k8s_yaml(kustomize("prometheus"))


k8s_resource('jaeger', port_forwards=16686)
k8s_resource('grafana', port_forwards=3000)
k8s_resource('prometheus-deployment', port_forwards=9090)