mod kind

[private]
default:
  @just --list

test chart:
  ct lint-and-install --charts charts/{{ chart }}

test-all:
  ct lint-and-install

update-dependencies chart:
  helm dependency update charts/{{ chart }}

update-documentation chart:
  helm-docs --chart-search-root charts/ --template-files ./_templates.gotmpl --template-files README.md.gotmpl --sort-values-order file --chart-to-generate charts/{{ chart }}

update-documentation-all:
  helm-docs --chart-search-root charts/ --template-files ./_templates.gotmpl --template-files README.md.gotmpl --sort-values-order file

update-values-json chart:
  #!/usr/bin/env bash
  jsonnet --jpath libsonnet/ charts/{{ chart }}/values.schema.jsonnet > charts/{{ chart }}/values.schema.json
  prettier --write charts/{{ chart }}/values.schema.json
