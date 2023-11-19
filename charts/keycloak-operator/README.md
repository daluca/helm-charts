# keycloak-operator

![Version: 0.1.3](https://img.shields.io/badge/Version-0.1.3-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 22.0.5](https://img.shields.io/badge/AppVersion-22.0.5-informational?style=flat-square)

Open source Identity and Access Management for modern applications and services

**Homepage:** <https://www.keycloak.org>

## Source Code

* <https://github.com/daluca/helm-charts/tree/main/charts/keycloak-operator>
* <https://github.com/keycloak/keycloak/tree/main/operator>
* <https://github.com/keycloak/keycloak>
* <https://github.com/keycloak/keycloak-k8s-resources>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| nameOverride | string | `""` |  |
| fullnameOverride | string | `""` |  |
| replicaCount | int | `1` |  |
| image.registry | string | `"quay.io"` |  |
| image.repository | string | `"keycloak/keycloak-operator"` |  |
| image.tag | string | `""` |  |
| image.sha256 | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| service.type | string | `"ClusterIP"` |  |
| service.port | int | `8080` |  |
| service.containerPort | int | `8080` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| serviceAccount.annotations | object | `{}` |  |
| resources | object | `{}` |  |
| livenessProbe.enabled | bool | `true` |  |
| readinessProbe.enabled | bool | `true` |  |
| startupProbe.enabled | bool | `true` |  |
| startupProbe.periodSeconds | int | `2` |  |
| startupProbe.failureThreshold | int | `15` |  |
| keycloakImage.registry | string | `"quay.io"` |  |
| keycloakImage.repository | string | `"keycloak/keycloak"` |  |
| keycloakImage.tag | string | `""` |  |
| keycloakImage.sha256 | string | `""` |  |
