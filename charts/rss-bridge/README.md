# rss-bridge

![Version: 0.4.0](https://img.shields.io/badge/Version-0.4.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 2024-02-02](https://img.shields.io/badge/AppVersion-2024--02--02-informational?style=flat-square)

The RSS feed for websites missing it

**Homepage:** <https://rss-bridge.github.io/rss-bridge>

## Source Code

* <https://github.com/RSS-Bridge/rss-bridge>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| <oci://registry-1.docker.io/bitnamicharts> | memcached | >=6.0.0 <7.0.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| nameOverride | string | `""` |  |
| fullnameOverride | string | `""` |  |
| replicaCount | int | `1` |  |
| image.registry | string | `"docker.io"` |  |
| image.repository | string | `"rssbridge/rss-bridge"` |  |
| image.tag | string | `""` |  |
| image.sha256 | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| service.type | string | `"ClusterIP"` |  |
| service.port | int | `3000` |  |
| service.containerPort | int | `3000` |  |
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
| rssBridge.system.bridges[0] | string | `"FeedMerge"` |  |
| rssBridge.system.bridges[1] | string | `"FeedReducerBridge"` |  |
| rssBridge.system.bridges[2] | string | `"Filter"` |  |
| rssBridge.system.bridges[3] | string | `"GettrBridge"` |  |
| rssBridge.system.bridges[4] | string | `"MastodonBridge"` |  |
| rssBridge.system.bridges[5] | string | `"Reddit"` |  |
| rssBridge.system.bridges[6] | string | `"RumbleBridge"` |  |
| rssBridge.system.bridges[7] | string | `"SoundcloudBridge"` |  |
| rssBridge.system.bridges[8] | string | `"Telegram"` |  |
| rssBridge.system.bridges[9] | string | `"ThePirateBay"` |  |
| rssBridge.system.bridges[10] | string | `"TikTokBridge"` |  |
| rssBridge.system.bridges[11] | string | `"Twitch"` |  |
| rssBridge.system.bridges[12] | string | `"Twitter"` |  |
| rssBridge.system.bridges[13] | string | `"Vk"` |  |
| rssBridge.system.bridges[14] | string | `"XPathBridge"` |  |
| rssBridge.system.bridges[15] | string | `"Youtube"` |  |
| rssBridge.system.bridges[16] | string | `"YouTubeCommunityTabBridge"` |  |
| rssBridge.system.timezone | string | `"UTC"` |  |
| rssBridge.system.message | string | `""` |  |
| rssBridge.system.debug.enabled | bool | `false` |  |
| rssBridge.system.debug.whitelist[0] | string | `"127.0.0.1"` |  |
| rssBridge.system.debug.whitelist[1] | string | `"192.168.1.10"` |  |
| rssBridge.system.maintenanceMode | bool | `false` |  |
| rssBridge.http.timeout | int | `60` |  |
| rssBridge.http.retries | int | `2` |  |
| rssBridge.http.useragent | string | `"Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101 Firefox/102.0"` |  |
| rssBridge.http.maxFilesize | int | `20` |  |
| rssBridge.cache.type | string | `"file"` |  |
| rssBridge.cache.customTimeout | bool | `false` |  |
| rssBridge.admin.email | string | `nil` | format: email |
| rssBridge.admin.telegram | string | `""` |  |
| rssBridge.admin.donations | bool | `true` |  |
| rssBridge.proxy.url | string | `nil` | format: uri |
| rssBridge.proxy.name | string | `"Hidden proxy name"` |  |
| rssBridge.proxy.byBridge | bool | `false` |  |
| rssBridge.authentication.enabled | bool | `false` |  |
| rssBridge.authentication.username | string | `"admin"` |  |
| rssBridge.authentication.password | string | `"somethingSecureIPromise"` |  |
| rssBridge.authentication.token | string | `nil` |  |
| rssBridge.error.output | string | `"feed"` |  |
| rssBridge.error.reportLimit | int | `1` |  |
| rssBridge.fileCache.path | string | `""` |  |
| rssBridge.fileCache.enablePurge | bool | `true` |  |
| rssBridge.sqliteCache.file | string | `"cache.sqlite"` |  |
| rssBridge.sqliteCache.enablePurge | bool | `true` |  |
| rssBridge.sqliteCache.timeout | int | `5000` |  |
| rssBridge.memcachedCache.host | string | `"localhost"` | format: hostname |
| rssBridge.memcachedCache.port | integer | `11211` | minimum: 0, maximum: 65535 |
| rssBridge.discogsBridge.presonalAccessToken | string | `""` |  |
| memcached.enabled | bool | `true` |  |
