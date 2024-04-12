kubernetes_version := "1.29.2"

create version=kubernetes_version: _create-kind-lock-file
  kind create cluster --image kindest/node:v{{ version }} --config multi-node-cluster.yaml

delete: _delete-kind-lock-file
  kind delete cluster --name development

[no-exit-message]
_create-kind-lock-file:
  #!/usr/bin/env bash
  set -euo pipefail
  [[ -f .cluster.lock ]] && echo "cluster already created" && exit 1 || touch .cluster.lock

[no-exit-message]
_delete-kind-lock-file:
  #!/usr/bin/env bash
  set -euo pipefail
  [[ ! -f .cluster.lock ]] && echo "no cluster to delete" && exit 1 || rm .cluster.lock
