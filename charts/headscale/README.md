# headscale

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.23.0-alpha11](https://img.shields.io/badge/AppVersion-0.23.0--alpha11-informational?style=flat-square)

An open source, self-hosted implementation of the Tailscale control server

**Homepage:** <https://headscale.net/>

## Source Code

* <https://github.com/daluca/helm-charts/tree/main/charts/headscale>

## Requirements

Kubernetes: `>=1.19.0-0`

| Repository | Name | Version |
|------------|------|---------|
| oci://ghcr.io/daluca/charts | common | >=0.1.0 <0.2.0 |
| oci://registry-1.docker.io/bitnamicharts | postgresql | >=15.0.0 <16.0.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| nameOverride | string | `""` |  |
| fullnameOverride | string | `""` |  |
| replicaCount | int | `1` |  |
| image.registry | string | `"ghcr.io"` |  |
| image.repository | string | `"juanfont/headscale"` |  |
| image.tag | string | `""` |  |
| image.sha256 | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| service.type | string | `"ClusterIP"` |  |
| service.port | int | `8080` |  |
| service.containerPort | int | `8080` |  |
| service.annotations | object | `{}` |  |
| ingress.enabled | bool | `false` |  |
| ingress.className | string | `""` |  |
| ingress.annotations | object | `{}` |  |
| ingress.tls[0].secretName | string | `"example.org-tls"` |  |
| ingress.tls[0].hosts[0] | string | `"example.org"` |  |
| ingress.hosts[0].host | string | `"example.org"` |  |
| ingress.hosts[0].paths[0].pathType | string | `"Prefix"` |  |
| ingress.hosts[0].paths[0].path | string | `"/"` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| serviceAccount.annotations | object | `{}` |  |
| resources.requests.cpu | string | `"25m"` |  |
| resources.requests.memory | string | `"92Mi"` |  |
| resources.limits.cpu | string | `"250m"` |  |
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
| config.prefixes.v4 | string | `"100.64.0.0/10"` |  |
| config.derp.urls[0] | string | `"https://controlplane.tailscale.com/derpmap/default"` |  |
| webui.enabled | bool | `false` |  |
| webui.replicaCount | int | `1` |  |
| webui.image.registry | string | `"docker.io"` |  |
| webui.image.repository | string | `"goodieshq/headscale-admin"` |  |
| webui.image.tag | string | `"0.1.12b"` |  |
| webui.image.sha256 | string | `""` |  |
| webui.image.pullPolicy | string | `"IfNotPresent"` |  |
| webui.service.type | string | `"ClusterIP"` |  |
| webui.service.port | int | `80` |  |
| webui.service.containerPort | int | `80` |  |
| webui.service.annotations | object | `{}` |  |
| webui.ingress.enabled | bool | `false` |  |
| webui.ingress.className | string | `""` |  |
| webui.ingress.annotations | object | `{}` |  |
| webui.ingress.tls[0].secretName | string | `"example.org-tls"` |  |
| webui.ingress.tls[0].hosts[0] | string | `"example.org"` |  |
| webui.ingress.hosts[0].host | string | `"example.org"` |  |
| webui.ingress.hosts[0].paths[0].pathType | string | `"Prefix"` |  |
| webui.ingress.hosts[0].paths[0].path | string | `"/admin"` |  |
| webui.resources.requests.cpu | string | `"25m"` |  |
| webui.resources.requests.memory | string | `"92Mi"` |  |
| webui.resources.limits.cpu | string | `"250m"` |  |
| webui.resources.limits.memory | string | `"1Gi"` |  |
| webui.livenessProbe.enabled | bool | `true` |  |
| webui.readinessProbe.enabled | bool | `false` |  |
| webui.startupProbe.enabled | bool | `true` |  |
| webui.startupProbe.periodSeconds | int | `2` |  |
| webui.startupProbe.failureThreshold | int | `30` |  |
| database.external | bool | `false` |  |
| database.type | string | `"postgres"` |  |
| database.name | string | `"headscale"` |  |
| database.host | string | `"localhost"` |  |
| database.port | int | `5432` |  |
| database.username | string | `"headscale_user"` |  |
| database.password | string | `"somethingSecureIPromise"` |  |
| database.existingSecret | string | `""` |  |
| database.arguments.max_open_conns | int | `10` |  |
| database.arguments.max_idle_conns | int | `10` |  |
| database.arguments.conn_max_idle_time_secs | int | `3600` |  |
| database.ssl | bool | `false` |  |
| postgresql.enabled | bool | `true` |  |
| postgresql.auth.username | string | `"headscale"` |  |
| postgresql.auth.password | string | `"headscale"` |  |
| postgresql.auth.database | string | `"headscale"` |  |
| postgresql.service.ports.postgresql | int | `5432` |  |
