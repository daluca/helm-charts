local js = import 'json-schema/draft/2020-12/schema.libsonnet';
local kube = import 'kubernetes.libsonnet';
local net = import 'networking.libsonnet';

{
    local helm = self,

    schema(
        schemaId,
        jsonSchemaVersion="",
        ingress=false,
    ):: js.object(additionalProperties=false) {
        '$id': schemaId,
        '$schema': if std.length(jsonSchemaVersion) > 0 then jsonSchemaVersion else js.url,
        properties: {
            nameOverride: net.dnsName,
            fullnameOverride: net.dnsName,
            replicaCount: kube.replicaCount,
            image: helm.image,
            service: helm.service,
            [if ingress then 'ingress']: helm.ingress,
            serviceAccount: helm.serviceAccount,
            resources: kube.resources,
            livenessProbe: helm.probe,
            readinessProbe: helm.probe,
            startupProbe: helm.probe,
        },
    },
    image:: js.object(additionalProperties=false) {
        properties: {
            registry: js.string() {
                description: "Container registry",
            },
            repository: js.string(),
            tag: js.string(),
            sha256: js.string() {
                pattern: '^(|[a-z0-9]{64})$',
            },
            pullPolicy: kube.imagePullPolicy,
        },
    },
    service:: js.object(additionalProperties=false) {
        properties: {
            type: js.enum(['ClusterIP', 'NodePort', 'LoadBalancer']),
            port: net.port,
            containerPort: net.port,
            annotations: kube.annotations,
        },
    },
    ingress:: js.object(additionalProperties=false) {
        properties: {
            enabled: js.boolean,
            className: js.string(),
            annotations: kube.annotations,
            tls: kube.tls,
            hosts: kube.ingressHosts,
        },
    },
    serviceAccount:: js.object(additionalProperties=false) {
        properties: {
            create: js.boolean,
            name: js.string(),
            annotations: kube.annotations,
        },
    },
    probe:: kube.probe {
        properties+: {
            enabled: js.boolean,
        },
    }
}
