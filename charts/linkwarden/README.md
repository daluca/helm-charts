# linkwarden

![Version: 0.1.1](https://img.shields.io/badge/Version-0.1.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 2.8.4](https://img.shields.io/badge/AppVersion-2.8.4-informational?style=flat-square)

Self-hosted collaborative bookmark manager to collect, organize, and preserve webpages, articles, and more...

**Homepage:** <https://linkwarden.app>

## Source Code

* <https://github.com/daluca/helm-charts/tree/main/charts/linkwarden>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| <oci://ghcr.io/daluca/charts> | common | >=0.1.0 <0.2.0 |
| <oci://registry-1.docker.io/bitnamicharts> | postgresql | >=16.0.0 <17.0.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| nameOverride | string | `""` |  |
| fullnameOverride | string | `""` |  |
| replicaCount | int | `1` |  |
| image.registry | string | `"ghcr.io"` |  |
| image.repository | string | `"linkwarden/linkwarden"` |  |
| image.tag | string | `""` |  |
| image.sha256 | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| service.type | string | `"ClusterIP"` |  |
| service.port | int | `3000` |  |
| service.containerPort | int | `3000` |  |
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
| linkwarden.config | object | `{}` |  |
| linkwarden.secrets.NEXTAUTH_SECRET | string | `"somethingSecureIPromise"` |  |
| linkwarden.existingSecret | string | `""` |  |
| database.external | bool | `false` |  |
| database.name | string | `"linkwarden"` |  |
| database.host | string | `"localhost"` |  |
| database.port | int | `5432` |  |
| database.username | string | `"linkwarden_user"` |  |
| database.password | string | `"somethingSecureIPromise"` |  |
| database.existingSecret | string | `""` |  |
| postgresql.enabled | bool | `true` |  |
| postgresql.auth.username | string | `"linkwarden"` |  |
| postgresql.auth.password | string | `"linkwarden"` |  |
| postgresql.auth.database | string | `"linkwarden"` |  |
| postgresql.service.ports.postgresql | int | `5432` |  |
