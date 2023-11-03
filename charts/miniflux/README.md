# miniflux

![Version: 0.4.0](https://img.shields.io/badge/Version-0.4.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 2.0.49](https://img.shields.io/badge/AppVersion-2.0.49-informational?style=flat-square)

Minimalist and opinionated feed reader

**Homepage:** <https://github.com/daluca/helm-charts/tree/main/charts/miniflux>

## Source Code

* <https://github.com/miniflux/v2>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| [oci://registry-1.docker.io/bitnamicharts](oci://registry-1.docker.io/bitnamicharts) | postgresql | >=12.0.0 <13.0.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| nameOverride | string | `""` |  |
| fullnameOverride | string | `""` |  |
| replicaCount | int | `1` |  |
| image.registry | string | `"docker.io"` |  |
| image.repository | string | `"miniflux/miniflux"` |  |
| image.tag | string | `""` |  |
| image.sha | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| service.type | string | `"ClusterIP"` |  |
| service.port | int | `8080` |  |
| service.containerPort | int | `8080` |  |
| ingress.enabled | bool | `false` |  |
| ingress.className | string | `""` |  |
| ingress.annotations | object | `{}` |  |
| ingress.tls | list | `[]` |  |
| ingress.hosts | list | `[]` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.annotations | object | `{}` |  |
| resources.requests.cpu | string | `"25m"` |  |
| resources.requests.memory | string | `"92Mi"` |  |
| resources.limits.cpu | string | `"250m"` |  |
| resources.limits.memory | string | `"256Mi"` |  |
| livenessProbe.enabled | bool | `true` |  |
| readinessProbe.enabled | bool | `true` |  |
| startupProbe.enabled | bool | `true` |  |
| startupProbe.periodSeconds | int | `2` |  |
| startupProbe.failureThreshold | int | `15` |  |
| config.WATCHDOG | string | `"false"` |  |
| secrets | object | `{}` |  |
| existingSecret | string | `""` |  |
| admin.enabled | bool | `true` |  |
| admin.username | string | `"admin"` |  |
| admin.password | string | `"password"` |  |
| admin.existingSecret | string | `""` |  |
| externalDatabase.enabled | bool | `false` |  |
| externalDatabase.url | string | `nil` |  |
| externalDatabase.existingSecret | string | `""` |  |
| postgresql.enabled | bool | `true` |  |
| postgresql.primary.initdb.scripts."miniflux.sql" | string | `"CREATE EXTENSION hstore;\nCREATE USER miniflux WITH ENCRYPTED PASSWORD 'password';\nCREATE DATABASE miniflux WITH OWNER miniflux;"` |  |
