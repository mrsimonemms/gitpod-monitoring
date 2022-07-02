HELM_DIR = charts
MONITORING_DIR = ${HELM_DIR}/monitoring
NAMESPACE ?= gitpod

all: uninstall deps install

deps:
	helm dependency update ${MONITORING_DIR}
.PHONY: deps

install:
	helm upgrade \
		--atomic \
		--cleanup-on-fail \
		--create-namespace \
		--install \
		--namespace="${NAMESPACE}" \
		--reset-values \
		--wait \
		monitoring \
		${MONITORING_DIR}
.PHONY: install

port-forward:
	kubectl port-forward -n ${NAMESPACE} statefulsets/prometheus-monitoring-prometheus-prometheus 9090:9090 &
		kubectl port-forward -n ${NAMESPACE} deployments/monitoring-grafana 3000:3000
.PHONY: port-forward

uninstall:
	helm uninstall -n "${NAMESPACE}" monitoring || true
.PHONY: uninstall
