# adminer

![Version: 0.1.1](https://img.shields.io/badge/Version-0.1.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 4.8.1](https://img.shields.io/badge/AppVersion-4.8.1-informational?style=flat-square)

Database management web GUI

**Homepage:** <https://github.com/daluca/helm-charts/tree/main/charts/adminer>

## Source Code

* <https://github.com/vrana/adminer>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| replicaCount | int | `1` |  |
| image.registry | string | `"docker.io"` |  |
| image.repository | string | `"adminer"` |  |
| image.tag | string | `""` |  |
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
| resources.requests.cpu | string | `"50m"` |  |
| resources.requests.memory | string | `"64Mi"` |  |
| resources.limits.cpu | string | `"50m"` |  |
| resources.limits.memory | string | `"64Mi"` |  |
| livenessProbe.enabled | bool | `true` |  |
| readinessProbe.enabled | bool | `true` |  |
| startupProbe.enabled | bool | `true` |  |
| startupProbe.periodSeconds | int | `2` |  |
| startupProbe.failureThreshold | int | `15` |  |
| theme | string | `nil` |  |
| defaultServerType | string | `nil` |  |
| plugins.enabled | bool | `false` |  |
| plugins.list | list | `[]` |  |
| plugins.loginServers | list | `[]` |  |
