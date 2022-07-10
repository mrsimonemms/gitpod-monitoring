HELM_DIR = chart
MONITORING_DIR = ${HELM_DIR}/gitpod-monitoring
NAMESPACE ?= monitoring
GITPOD_NAMESPACE ?= gitpod
HELM_NAME ?= gitpod

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
		--set gitpodNamespace="${GITPOD_NAMESPACE}" \
		--wait \
		${HELM_NAME} \
		${MONITORING_DIR}
.PHONY: install

port-forward:
	kubectl port-forward -n ${NAMESPACE} statefulsets/prometheus-${HELM_NAME}-prometheus-prometheus 9090:9090 &
		kubectl port-forward -n ${NAMESPACE} deployments/${HELM_NAME}-grafana 3000:3000
.PHONY: port-forward

uninstall:
	helm uninstall -n "${NAMESPACE}" ${HELM_NAME} || true
.PHONY: uninstall
