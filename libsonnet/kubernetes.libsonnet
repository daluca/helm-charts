local js = import 'json-schema/draft/2020-12/schema.libsonnet';
local net = import 'networking.libsonnet';

{
    local kube = self,

    annotations:: js.object() {
        properties:: { hidden: true },
        additionalProperties: js.string(),
    },
    imagePullPolicy:: js.enum(['Always', 'Never', 'IfNotPresent']),
    resource:: js.object(additionalProperties=false) {
        properties: {
            cpu: js.string(),
            memory: js.string(),
        },
        patternProperties: {
            '^hugepages-': js.string(),
        },
    },
    resources:: js.object(additionalProperties=false) {
        properties: {
            requests: kube.resource,
            limits: kube.resource,
        },
    },
    probe:: js.object(additionalProperties=false) {
        properties: {
            initialDelaySeconds: js.integer(minimum=0),
            periodSeconds: js.integer(minimum=1),
            timeoutSeconds: js.integer(minimum=1),
            successThreshold: js.integer(minimum=1),
            failureThreshold: js.integer(minimum=1),
            terminationGracePeriodSeconds: js.integer(minimum=1),
        },
    },
    replicaCount:: js.integer(minimum=0),
    tls:: js.array(uniqueItems=true) {
        items: js.object(additionalProperties=false, required=['hosts', 'secretName']) {
            properties: {
                hosts: js.array(uniqueItems=true, minItems=1) {
                    items: net.hostname,
                },
                secretName: js.string(),
            },
        },
    },
    ingressHosts:: js.array(uniqueItems=true) {
        items: js.object(additionalProperties=false, required=['host', 'paths']) {
            properties: {
                host: net.hostname,
                paths: js.array(uniqueItems=true, minItems=1) {
                    items: js.object(additionalProperties=false, required=['path', 'pathType']) {
                        properties: {
                            path: js.string(pattern='^/'),
                            pathType: js.enum(['Prefix', 'Exact', 'ImplementationSpecific']),
                        },
                    },
                },
            },
        },
    },
}
