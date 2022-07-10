# Gitpod Monitoring

My self-hosted Gitpod metrics. Based upon the [Gitpod docs](https://www.gitpod.io/docs/self-hosted/latest/monitoring).

## Quick Start

This assumes that you are installing both your Gitpod and Monitoring application into the `gitpod` namespace - you may change this to your own requirements if necessary.

```shell
NAMESPACE=gitpod
GITPOD_NAMESPACE=gitpod

helm upgrade \
  --atomic \
  --cleanup-on-fail \
  --create-namespace \
  --install \
  --namespace="${NAMESPACE}" \
  --repo=https://helm.simonemms.com \
  --reset-values \
  --set gitpodNamespace="${GITPOD_NAMESPACE}" \
  --wait \
  monitoring \
  gitpod-monitoring
```

This will install an instance of [kube-prometheus-stack](https://github.com/prometheus-community/helm-charts/tree/main/charts/kube-prometheus-stack) customised for Gitpod monitoring.

## Applications

### Prometheus

```shell
kubectl port-forward -n ${NAMESPACE} statefulsets/prometheus-monitoring-prometheus-prometheus 9090:9090
```

This will open up the Prometheus instance on [port 9090](http://localhost:9090).

### Grafana

```shell
kubectl port-forward -n ${NAMESPACE} deployments/monitoring-grafana 3000:3000
```

This will open up the Grafana instance on [port 3000](http://localhost:3000). The username is `admin` and the password is whatever's set by `prometheus.grafana.adminPassword` (by default, it's `password`).
