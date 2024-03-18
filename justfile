[private]
default:
  @just --list

kubernetes_version := "1.28.6"

create-kind version=kubernetes_version: _create-kind-lock-file
  kind create cluster --name development --config kind-cluster-config.yaml --image kindest/node:v{{ version }}

delete-kind: _delete-kind-lock-file
  kind delete cluster --name development

test chart:
  ct lint-and-install --charts charts/{{ chart }}

test-all:
  ct lint-and-install

update-documentation chart:
  helm-docs --chart-search-root charts/ --template-files ./_templates.gotmpl --template-files README.md.gotmpl --sort-values-order file --chart-to-generate charts/{{ chart }}

update-documentation-all:
  helm-docs --chart-search-root charts/ --template-files ./_templates.gotmpl --template-files README.md.gotmpl --sort-values-order file

generate-values-json chart:
  #!/usr/bin/env bash
  jsonnet --jpath libsonnet/ charts/{{ chart }}/values.schema.jsonnet > charts/{{ chart }}/values.schema.json
  prettier --write charts/{{ chart }}/values.schema.json

[no-exit-message]
_create-kind-lock-file:
  #!/usr/bin/env bash
  set -euo pipefail
  [[ -f .kind-cluster.lock ]] && echo "cluster already created" && exit 1 || touch .kind-cluster.lock

[no-exit-message]
_delete-kind-lock-file:
  #!/usr/bin/env bash
  set -euo pipefail
  [[ ! -f .kind-cluster.lock ]] && echo "no cluster to delete" && exit 1 || rm .kind-cluster.lock
