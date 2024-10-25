# mealie

![Version: 0.2.0](https://img.shields.io/badge/Version-0.2.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 2.0.0](https://img.shields.io/badge/AppVersion-2.0.0-informational?style=flat-square)

Mealie is a self hosted recipe manager and meal planner

**Homepage:** <https://mealie.io/>

## Source Code

* <https://github.com/daluca/helm-charts/tree/main/charts/mealie>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| <oci://ghcr.io/daluca/charts> | common | >=0.1.0 <0.2.0 |
| <oci://registry-1.docker.io/bitnamicharts> | postgresql | >=15.0.0 <16.0.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| nameOverride | string | `""` |  |
| fullnameOverride | string | `""` |  |
| replicaCount | int | `1` |  |
| image.registry | string | `"ghcr.io"` |  |
| image.repository | string | `"mealie-recipes/mealie"` |  |
| image.tag | string | `""` |  |
| image.sha256 | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| service.type | string | `"ClusterIP"` |  |
| service.port | int | `9000` |  |
| service.containerPort | int | `9000` |  |
| service.annotations | object | `{}` |  |
| ingress.enabled | bool | `false` |  |
| ingress.className | string | `""` |  |
| ingress.annotations | object | `{}` |  |
| ingress.hosts | list | `[]` |  |
| ingress.tls | list | `[]` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| serviceAccount.annotations | object | `{}` |  |
| resources.requests.cpu | string | `"250m"` |  |
| resources.requests.memory | string | `"256Mi"` |  |
| resources.limits.cpu | string | `"1"` |  |
| resources.limits.memory | string | `"1Gi"` |  |
| livenessProbe.enabled | bool | `true` |  |
| readinessProbe.enabled | bool | `false` |  |
| startupProbe.enabled | bool | `true` |  |
| startupProbe.periodSeconds | int | `2` |  |
| startupProbe.failureThreshold | int | `30` |  |
| persistence.enabled | bool | `false` |  |
| persistence.storageClass | string | `""` |  |
| persistence.size | string | `"1Gi"` |  |
| persistence.accessModes[0] | string | `"ReadWriteOnce"` |  |
| extraEnvs | list | `[]` |  |
| config.PUID | int | `65534` |  |
| config.PGID | int | `65534` |  |
| config.LOG_LEVEL | string | `"info"` |  |
| config.SMTP_AUTH_STRATEGY | string | `"NONE"` |  |
| existingSecret | string | `""` |  |
| database.type | string | `"postgres"` |  |
| database.external | bool | `false` |  |
| database.name | string | `"mealie"` |  |
| database.host | string | `"localhost"` |  |
| database.port | int | `5432` |  |
| database.username | string | `"mealie_user"` |  |
| database.password | string | `"somethingSecureIPromise"` |  |
| database.existingSecret | string | `""` |  |
| postgresql.enabled | bool | `true` |  |
| postgresql.auth.username | string | `"mealie"` |  |
| postgresql.auth.password | string | `"mealie"` |  |
| postgresql.auth.database | string | `"mealie"` |  |
| postgresql.service.ports.postgresql | int | `5432` |  |
