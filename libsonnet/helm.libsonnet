local js = import 'json-schema/draft/2020-12/schema.libsonnet';
local kube = import 'kubernetes.libsonnet';
local net = import 'networking.libsonnet';

{
  local helm = self,

  schema(
    schemaId,
    jsonSchemaVersion='',
    commonLibrary=false,
    ingress=false,
    persistence=false,
  ):: js.object(additionalProperties=false) {
    '$id': schemaId,
    '$schema': if std.length(jsonSchemaVersion) > 0 then jsonSchemaVersion else js.url,
    properties: {
      [if commonLibrary then 'common']: helm.commonLibrary,
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
      [if persistence then 'persistence']: helm.persistence,
    },
  },
  image:: js.object(additionalProperties=false) {
    properties: {
      registry: js.string(),
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
  },
  persistence: js.object(additionalProperties=false) {
    properties: {
      enabled: js.boolean,
      storageClass: js.string(),
      size: js.string(),
      accessModes: js.array(uniqueItems=true, unevaluatedItems=false) {
        items: js.enum(['ReadWriteOnce', 'ReadOnlyMany', 'ReadWriteMany', 'ReadWriteOncePod']),
      },
    },
  },
  externalDatabase(
    types=[]
  ):: js.object(additionalProperties=false, required=['external']) {
    properties: {
      [if std.length(types) >= 2 then 'type']: js.enum(types),
      external: js.boolean,
      name: js.string(),
      host: net.hostname,
      port: net.port,
      username: js.string(),
      password: js.string(),
      existingSecret: js.string(),
    },
  },
  postgresql:: js.object(additionalProperties=true, required=['enabled']) {
    properties: {
      enabled: js.boolean,
      auth: js.object(additionalProperties=true) {
        properties: {
          username: js.string(),
          password: js.string(),
          database: js.string(),
        },
      },
      service: js.object(additionalProperties=true) {
        properties: {
          ports: js.object(additionalProperties=true) {
            properties: {
              postgresql: net.port,
            },
          },
        },
      },
    },
  },
  commonLibrary:: js.object(additionalProperties=false) {
    properties: {
      global: js.object(additionalProperties=true) {
        properties:: { hidden: true },
      },
    },
  },
}
