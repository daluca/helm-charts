# eturnal

![Version: 0.1.2](https://img.shields.io/badge/Version-0.1.2-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 1.12.0](https://img.shields.io/badge/AppVersion-1.12.0-informational?style=flat-square)

STUN / TURN standalone server

**Homepage:** <https://eturnal.net/>

## Source Code

* <https://github.com/daluca/helm-charts/tree/main/charts/eturnal>

## Requirements

Kubernetes: `>=1.19.0-0`

| Repository | Name | Version |
|------------|------|---------|
| oci://ghcr.io/daluca/charts | common | >=0.1.0 <0.2.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| nameOverride | string | `""` |  |
| fullnameOverride | string | `""` |  |
| replicaCount | int | `1` |  |
| image.registry | string | `"ghcr.io"` |  |
| image.repository | string | `"processone/eturnal"` |  |
| image.tag | string | `""` |  |
| image.sha256 | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| service.type | string | `"ClusterIP"` |  |
| service.port | int | `3478` |  |
| service.containerPort | int | `3478` |  |
| service.annotations | object | `{}` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| serviceAccount.annotations | object | `{}` |  |
| resources.requests.cpu | string | `"25m"` |  |
| resources.requests.memory | string | `"92Mi"` |  |
| resources.limits.cpu | string | `"250m"` |  |
| resources.limits.memory | string | `"1Gi"` |  |
| livenessProbe.enabled | bool | `false` |  |
| readinessProbe.enabled | bool | `false` |  |
| startupProbe.enabled | bool | `false` |  |
| startupProbe.periodSeconds | int | `2` |  |
| startupProbe.failureThreshold | int | `30` |  |
| podSecurityContext.fsGroup | int | `9000` |  |
| securityContext.allowPrivilegeEscalation | bool | `false` |  |
| securityContext.readOnlyRootFilesystem | bool | `true` |  |
| securityContext.runAsUser | int | `9000` |  |
| securityContext.runAsGroup | int | `9000` |  |
| securityContext.runAsNonRoot | bool | `true` |  |
| securityContext.privileged | bool | `false` |  |
| securityContext.capabilities.drop | list | `["ALL"]` | "" |
| securityContext.capabilities.add | list | `["NET_BIND_SERVICE"]` | "" |
| extraVolumeMounts | list | `[]` |  |
| extraVolumes | list | `[]` |  |
| existingSecret | string | `""` | Name of a secret with a key containing `shared-secret` |
| config.blacklist_clients | list | `[]` |  |
| config.blacklist_peers | list | `["recommended"]` | "" |
| config.credentials | object | `{}` |  |
| config.listen | list | `[{"transport":"udp"},{"transport":"tcp"}]` | two transport options can be set at any given time udp and either tcp, tls or auto tcp is unencripted tcp tls is encrypted tcp auto allows for both encrypted and unencrypted tcp traffic |
| config.log_dir | string | `"stdout"` | stdout make more sense as a default in containers : eturnal default (log) |
| config.log_level | string | `"info"` |  |
| config.log_rotate_count | int | `10` | Ignored by default due to being ignored when config.log_dir is set to 'stdout' |
| config.log_rotate_size | string | `"unlimited"` |  |
| config.max_bps | string | `"unlimited"` |  |
| config.max_permissions | int | `10` |  |
| config.modules | object | `{}` |  |
| config.realm | string | `"eturnal.net"` | This option is virtually meaningless due to shared secret authentication |
| config.relay_max_port | int | `65535` |  |
| config.relay_min_port | int | `49152` |  |
| config.run_dir | string | `"run"` |  |
| config.secret | string | `"somethingSecureIPromise"` |  |
| config.software_name | string | `"eturnal"` |  |
| config.strict_expiry | bool | `false` |  |
| config.tls_ciphers | list | `["HIGH","!aNULL","@STRENGTH"]` | "" |
| config.tls_options | list | `["cipher_server_preference"]` | "" |
| config.whitelist_clients | list | `[]` |  |
| config.whitelist_peers | list | `[]` |  |
