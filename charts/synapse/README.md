# synapse

![Version: 0.2.0](https://img.shields.io/badge/Version-0.2.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.96.1](https://img.shields.io/badge/AppVersion-1.96.1-informational?style=flat-square)

Matrix homeserver written in Python/Twisted

**Homepage:** <https://github.com/matrix-org/synapse>

## Source Code

* <https://github.com/daluca/helm-charts/tree/main/charts/synapse>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| <oci://registry-1.docker.io/bitnamicharts> | postgresql | >=13.0.0 <14.0.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| nameOverride | string | `""` |  |
| fullnameOverride | string | `""` |  |
| replicaCount | int | `1` |  |
| image.registry | string | `"docker.io"` |  |
| image.repository | string | `"matrixdotorg/synapse"` |  |
| image.tag | string | `""` |  |
| image.sha256 | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| service.type | string | `"ClusterIP"` |  |
| service.port | int | `8008` |  |
| service.containerPort | int | `8008` |  |
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
| homeserver.macaroon_secret_key | string | `""` |  |
| homeserver.registration_shared_secret | string | `""` |  |
| homeserver.form_secret | string | `""` |  |
| homeserver.existingSecret | string | `""` |  |
| signingKey.enabled | bool | `false` |  |
| signingKey.key | string | `""` |  |
| signingKey.existingSecret | string | `""` |  |
| logging.level | string | `"INFO"` |  |
| logging.handlers[0] | string | `"console"` |  |
| logging.buffer.level | string | `"NOTSET"` |  |
| logging.buffer.location | string | `"/synapse/homeserver.log"` |  |
| logging.console.level | string | `"NOTSET"` |  |
| delegation.enabled | bool | `false` |  |
| delegation.className | string | `""` |  |
| delegation.annotations | object | `{}` |  |
| delegation.tls | bool | `true` |  |
| database.type | string | `"postgresql"` |  |
| database.external | bool | `false` |  |
| database.name | string | `"synapse"` |  |
| database.host | string | `"localhost"` |  |
| database.port | int | `5432` |  |
| database.username | string | `"synapse"` |  |
| database.password | string | `"synapse"` |  |
| database.existingSecret | string | `""` |  |
| database.arguments.cp_min | int | `5` |  |
| database.arguments.cp_max | int | `10` |  |
| postgresql.enabled | bool | `true` |  |
| postgresql.auth.username | string | `"synapse"` |  |
| postgresql.auth.password | string | `"synapse"` |  |
| postgresql.auth.database | string | `"synapse"` |  |
| postgresql.primary.initdb.args | string | `"--lc-collate=C --lc-ctype=C"` |  |
