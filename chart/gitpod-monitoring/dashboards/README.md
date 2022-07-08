# Dashboards

[Grafana dashboards](https://grafana.com/grafana/dashboards/) are a way of visualising data. To create a new dashboard, add to the `/dasboards` folder.

These are loaded using the [Grafana sidecar](https://github.com/grafana/helm-charts/tree/main/charts/grafana#sidecar-for-dashboards) which takes a few seconds to load.

## Pre-loaded dashboards

The default Grafana dashboards are pre-installed by default to observe your cluster health.

- `gitpod.json` - this is based upon the [Gitpod overview](https://github.com/gitpod-io/gitpod/blob/main/operations/observability/mixins/self-hosted/dashboards/examples/overview.json) dashboard, with some customisation.
