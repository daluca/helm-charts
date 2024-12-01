mod kind

[private]
default:
    @just --list

test chart: (update-values-json chart)
    ct lint-and-install --charts charts/{{ chart }}

update-dependencies chart:
    helm dependency update charts/{{ chart }}

update-documentation chart:
    helm-docs --chart-search-root charts/ --template-files ./_templates.gotmpl --template-files README.md.gotmpl --sort-values-order file --chart-to-generate charts/{{ chart }}

update-values-json chart: && (prettier-values-json chart)
    jsonnet --jpath libsonnet/ charts/{{ chart }}/values.schema.jsonnet > charts/{{ chart }}/values.schema.json

[private]
prettier-values-json chart:
    prettier --write charts/{{ chart }}/values.schema.json

update chart: (update-dependencies chart) (update-documentation chart) (update-values-json chart)
    @echo "Everything updated for {{ chart }}"

install chart: (update-dependencies chart) (update-values-json chart) (lint chart)
    helm upgrade --install {{ chart }} charts/{{ chart }} --namespace {{ chart }} --create-namespace

uninstall chart: && (delete-namespace chart)
    helm uninstall {{ chart }} --namespace {{ chart }}

debug chart: (update chart)
    helm upgrade --install --debug --dry-run {{ chart }} charts/{{ chart }} --namespace {{ chart }}

lint chart:
    helm lint charts/{{ chart }}

[private]
delete-namespace chart:
    kubectl delete namespace {{ chart }}
