local helm = import 'helm.libsonnet';
local js = import 'json-schema/draft/2020-12/schema.libsonnet';
local kube = import 'kubernetes.libsonnet';
local net = import 'networking.libsonnet';

helm.schema(
  schemaId='https://raw.githubusercontent.com/daluca/helm-charts/main/charts/synapse/values.schema.json',
  ingress=false,
) {
  local logLevels = js.enum(['NOTSET', 'DEBUG', 'INFO', 'WARNING', 'ERROR', 'CRITICAL']),

  properties+: {
    ingress: js.object(additionalProperties=false) {
      properties: {
        enabled: js.boolean,
        className: js.string(),
        annotations: js.object(additionalProperties=js.string()) {
          properties:: { hidden: true },
        },
        host: net.hostname,
        tls: js.boolean,
      },
    },
    persistence: js.object(additionalProperties=false) {
      properties: {
        enabled: js.boolean,
        storageClass: js.string(),
        size: js.string(),
        accessModes: js.array(uniqueItems=true, unevaluatedItems=false) {
          items: js.enum(['ReadWriteOnce', 'ReadOnlyMany', 'ReadWriteMany', 'ReadWriteOncePod'])
        },
      },
    },
    admin: js.object(additionalProperties=false) {
      properties: {
        create: js.boolean,
        username: js.string(),
        password: js.string(),
        existingSecret: js.string()
      },
    },
    homeserver: js.object(additionalProperties=true, required=['server_name', 'report_stats']) {
      properties: {
        server_name: net.hostname,
        report_stats: js.boolean,
        existingSecret: js.string(),
      },
    },
    signingKey: js.object(additionalProperties=false) {
      properties: {
        enabled: js.boolean,
        key: js.string(pattern='^(|ed25519 a_[a-zA-Z0-9]{4} .*)$'),
        existingSecret: js.string(),
      }
    },
    mediaStore: js.object(additionalProperties=false) {
      properties: {
        enabled: js.boolean,
        path: js.string(pattern='^/')
      },
    },
    logging: js.object(additionalProperties=false) {
      properties: {
        level: logLevels,
        handlers: js.array(uniqueItems=true, unevaluatedItems=false, minContains=1) {
          items: js.enum(['buffer', 'console']),
        },
        buffer: js.object(additionalProperties=false) {
          properties: {
            level: logLevels,
            location: js.string()
          },
        },
        console: js.object(additionalProperties=false) {
          properties: {
            level: logLevels,
          },
        },
      },
    },
    extraMergeVolumeMounts: js.array(uniqueItems=true, unevaluatedItems=false) {
      items: kube.volumeMount,
    },
    extraVolumes: js.array(uniqueItems=true, unevaluatedItems=false) {
      items: kube.volume,
    },
    delegation: js.object(additionalProperties=false) {
      properties: {
        enabled: js.boolean,
        replicaCount: js.integer(minimum=0),
        image: helm.image,
        service: helm.service,
        ingress: js.object(additionalProperties=false) {
          properties: {
            className: js.string(),
            annotations: js.object(additionalProperties=js.string()) {
              properties:: { hidden: true },
            },
            tls: js.boolean,
          },
        },
        resources: kube.resources,
        livenessProbe: helm.probe,
        readinessProbe: helm.probe,
        startupProbe: helm.probe,
        nginx: js.object(additionalProperties=false) {
          properties: {
            logHealthCheck: js.boolean,
            defaultType: js.string(),
            cors: js.object(additionalProperties=false) {
              properties: {
                enabled: js.boolean,
                origin: js.string(),
                headers: js.string(),
                methods: js.string(),
              },
            },
          },
        },
        slidingSync: js.object(additionalProperties=false) {
          properties: {
            enabled: js.boolean,
            host: net.hostname,
          },
        },
      },
    },
    database: js.object(additionalProperties=false, required=['type']) {
      properties: {
        type: js.enum(['postgresql', 'sqlite']),
        external: js.boolean,
        name: js.string(),
        host: net.hostname,
        port: net.port,
        username: js.string(),
        password: js.string(),
        existingSecret: js.string(),
        arguments: js.object(additionalProperties=js.multipleTypes(['integer', 'null'])) {
          properties:: { hidden: true },
        },
      },
    },
    postgresql: js.object(additionalProperties=true, required=['enabled']) {
      properties: {
        enabled: js.boolean,
      },
    },
  },
}
