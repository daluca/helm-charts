# miniflux

![Version: 0.7.2](https://img.shields.io/badge/Version-0.7.2-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 2.1.4](https://img.shields.io/badge/AppVersion-2.1.4-informational?style=flat-square)

Minimalist and opinionated feed reader

**Homepage:** <https://miniflux.app>

## Source Code

* <https://github.com/daluca/helm-charts/tree/main/charts/miniflux>
* <https://github.com/miniflux/v2>

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
| serviceAccount.name | string | `""` |  |
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
| cronJobs.refreshFeedsSchedule | string | `"0 * * * *"` | Runs every hour on the hour |
| cronJobs.cleanupTasksSchedule | string | `"30 2 * * *"` | Runs every day at 2:30am UTC |
| config.SCHEDULER_ROUND_ROBIN_MIN_INTERVAL | string | `"59"` |  |
| config.WATCHDOG | string | `"false"` |  |
| secrets | object | `{}` |  |
| existingSecret | string | `""` |  |
| admin.enabled | bool | `true` |  |
| admin.username | string | `"admin"` |  |
| admin.password | string | `"password"` |  |
| admin.existingSecret | string | `""` |  |
| database.external | bool | `false` |  |
| database.name | string | `"miniflux_db"` |  |
| database.host | string | `"localhost"` |  |
| database.port | int | `5432` |  |
| database.username | string | `"miniflux_user"` |  |
| database.password | string | `"somethingSecureIPromise"` |  |
| database.existingSecret | string | `""` |  |
| postgresql.enabled | bool | `true` |  |
| postgresql.auth.username | string | `"miniflux"` |  |
| postgresql.auth.password | string | `"miniflux"` |  |
| postgresql.auth.database | string | `"miniflux"` |  |
| postgresql.primary.initdb.scripts."miniflux.sql" | string | `"CREATE EXTENSION hstore;"` |  |
| postgresql.service.ports.postgresql | int | `5432` |  |
