# synapse

![Version: 0.9.0](https://img.shields.io/badge/Version-0.9.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.103.0](https://img.shields.io/badge/AppVersion-1.103.0-informational?style=flat-square)

Matrix homeserver written in Python/Twisted

**Homepage:** <https://github.com/matrix-org/synapse>

## Source Code

* <https://github.com/daluca/helm-charts/tree/main/charts/synapse>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| <oci://registry-1.docker.io/bitnamicharts> | postgresql | >=15.0.0 <16.0.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| nameOverride | string | `""` |  |
| fullnameOverride | string | `""` |  |
| replicaCount | int | `1` |  |
| image.registry | string | `"ghcr.io"` |  |
| image.repository | string | `"element-hq/synapse"` |  |
| image.tag | string | `""` |  |
| image.sha256 | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| service.type | string | `"ClusterIP"` |  |
| service.port | int | `8008` |  |
| service.containerPort | int | `8008` |  |
| service.annotations | object | `{}` |  |
| ingress.enabled | bool | `false` |  |
| ingress.className | string | `""` |  |
| ingress.annotations | object | `{}` |  |
| ingress.host | string | `"example.org"` |  |
| ingress.tls | bool | `true` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| serviceAccount.annotations | object | `{}` |  |
| resources.requests.cpu | string | `"100m"` |  |
| resources.requests.memory | string | `"256Mi"` |  |
| resources.limits.cpu | string | `"200m"` |  |
| resources.limits.memory | string | `"512Mi"` |  |
| livenessProbe.enabled | bool | `true` |  |
| readinessProbe.enabled | bool | `false` |  |
| startupProbe.enabled | bool | `true` |  |
| startupProbe.periodSeconds | int | `2` |  |
| startupProbe.failureThreshold | int | `30` |  |
| persistence.enabled | bool | `false` |  |
| persistence.storageClass | string | `""` |  |
| persistence.size | string | `"1Gi"` |  |
| persistence.accessModes[0] | string | `"ReadWriteOnce"` |  |
| admin.create | bool | `true` |  |
| admin.username | string | `""` |  |
| admin.password | string | `""` |  |
| admin.existingSecret | string | `""` | secret must contain the keys `username` and `password` |
| homeserver.server_name | string | `"localhost"` |  |
| homeserver.report_stats | bool | `false` |  |
| homeserver.media_store_path | string | `"/synapse/media_store"` |  |
| homeserver.trusted_key_servers[0].server_name | string | `"matrix.org"` |  |
| homeserver.macaroon_secret_key | string | `""` |  |
| homeserver.registration_shared_secret | string | `""` |  |
| homeserver.form_secret | string | `""` |  |
| homeserver.existingSecret | string | `""` |  |
| signingKey.enabled | bool | `false` |  |
| signingKey.key | string | `""` |  |
| signingKey.existingSecret | string | `""` |  |
| mediaStore.enabled | bool | `true` |  |
| mediaStore.path | string | `"/synapse/media_store"` |  |
| logging.level | string | `"INFO"` |  |
| logging.handlers[0] | string | `"console"` |  |
| logging.buffer.level | string | `"NOTSET"` |  |
| logging.buffer.location | string | `"/synapse/homeserver.log"` |  |
| logging.console.level | string | `"NOTSET"` |  |
| extraMergeVolumeMounts | list | `[]` |  |
| extraVolumes | list | `[]` |  |
| delegation.enabled | bool | `false` |  |
| delegation.replicaCount | int | `1` |  |
| delegation.image.registry | string | `"docker.io"` |  |
| delegation.image.repository | string | `"nginx"` |  |
| delegation.image.tag | string | `"1.25.4-alpine"` |  |
| delegation.image.sha256 | string | `""` |  |
| delegation.image.pullPolicy | string | `"IfNotPresent"` |  |
| delegation.service.type | string | `"ClusterIP"` |  |
| delegation.service.port | int | `80` |  |
| delegation.service.containerPort | int | `80` |  |
| delegation.service.annotations | object | `{}` |  |
| delegation.ingress.className | string | `""` |  |
| delegation.ingress.annotations | object | `{}` |  |
| delegation.ingress.tls | bool | `true` |  |
| delegation.resources.requests.cpu | string | `"50m"` |  |
| delegation.resources.requests.memory | string | `"64Mi"` |  |
| delegation.resources.limits.cpu | string | `"50m"` |  |
| delegation.resources.limits.memory | string | `"64Mi"` |  |
| delegation.livenessProbe.enabled | bool | `true` |  |
| delegation.readinessProbe.enabled | bool | `false` |  |
| delegation.startupProbe.enabled | bool | `true` |  |
| delegation.startupProbe.periodSeconds | int | `2` |  |
| delegation.startupProbe.failureThreshold | int | `15` |  |
| delegation.nginx.logHealthCheck | bool | `false` |  |
| delegation.nginx.defaultType | string | `"application/json; charset=utf-8"` |  |
| delegation.nginx.cors.enabled | bool | `true` |  |
| delegation.nginx.cors.origin | string | `"*"` |  |
| delegation.nginx.cors.headers | string | `"X-Requested-With, Content-Type, Authorization, Date"` |  |
| delegation.nginx.cors.methods | string | `"GET, HEAD, POST, PUT, DELETE, OPTIONS"` |  |
| database.type | string | `"postgresql"` |  |
| database.external | bool | `false` |  |
| database.name | string | `"matrix_synapse"` |  |
| database.host | string | `"localhost"` |  |
| database.port | int | `5432` |  |
| database.username | string | `"synapse_user"` |  |
| database.password | string | `"somethingSecureIPromise"` |  |
| database.existingSecret | string | `""` |  |
| database.arguments.cp_min | int | `5` |  |
| database.arguments.cp_max | int | `10` |  |
| postgresql.enabled | bool | `true` |  |
| postgresql.auth.username | string | `"synapse"` |  |
| postgresql.auth.password | string | `"synapse"` |  |
| postgresql.auth.database | string | `"synapse"` |  |
| postgresql.primary.initdb.args | string | `"--lc-collate=C --lc-ctype=C"` |  |
| postgresql.service.ports.postgresql | int | `5432` |  |
