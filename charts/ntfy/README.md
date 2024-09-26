# ntfy

![Version: 0.1.1](https://img.shields.io/badge/Version-0.1.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 2.11.0](https://img.shields.io/badge/AppVersion-2.11.0-informational?style=flat-square)

Send push notifications to your phone or desktop using PUT/POST

**Homepage:** <https://ntfy.sh/>

## Source Code

* <https://github.com/daluca/helm-charts/tree/main/charts/ntfy>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| <oci://ghcr.io/daluca/charts> | common | >=0.1.0 <0.2.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| nameOverride | string | `""` |  |
| fullnameOverride | string | `""` |  |
| image.registry | string | `"docker.io"` |  |
| image.repository | string | `"binwiederhier/ntfy"` |  |
| image.tag | string | `""` |  |
| image.sha256 | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| service.type | string | `"ClusterIP"` |  |
| service.port | int | `80` |  |
| service.containerPort | int | `80` |  |
| service.annotations | object | `{}` |  |
| ingress.enabled | bool | `false` |  |
| ingress.className | string | `""` |  |
| ingress.annotations | object | `{}` |  |
| ingress.hosts | list | `[]` |  |
| ingress.tls | list | `[]` |  |
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
| extraEnvs | list | `[]` |  |
| config.base_url | string | `"http://localhost"` |  |
| config.cache_duration | string | `"12h"` |  |
| config.cache_batch_size | int | `0` |  |
| config.cache_batch_timeout | string | `"0ms"` |  |
| config.attachment_file_size_limit | string | `"15M"` |  |
| config.attachment_expiry_duration | string | `"3h"` |  |
| config.keepalive_interval | string | `"45s"` |  |
| config.manager_interval | string | `"1m"` |  |
| config.web_root | string | `"/"` |  |
| config.enable_signup | bool | `false` |  |
| config.enable_login | bool | `false` |  |
| config.enable_reservations | bool | `false` |  |
| config.message_size_limit | string | `"4k"` |  |
| config.message_delay_limit | string | `"3d"` |  |
| config.global_topic_limit | int | `15000` |  |
| config.visitor_subscription_limit | int | `30` |  |
| config.visitor_request_limit_burst | int | `60` |  |
| config.visitor_request_limit_replenish | string | `"5s"` |  |
| config.visitor_message_daily_limit | int | `0` |  |
| config.visitor_email_limit_burst | int | `16` |  |
| config.visitor_email_limit_replenish | string | `"1h"` |  |
| config.visitor_attachment_total_size_limit | string | `"100M"` |  |
| config.visitor_attachment_daily_bandwidth_limit | string | `"500M"` |  |
| config.visitor_subscriber_rate_limiting | bool | `false` |  |
| config.enable_metrics | bool | `false` |  |
| config.log_level | string | `"info"` |  |
| config.log_format | string | `"text"` |  |
