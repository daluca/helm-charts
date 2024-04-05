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
  volumeMount:: js.object(additionalProperties=false, required=['mountPath', 'name']) {
    properties: {
      mountPath: js.string(pattern='^/'),
      mountPropagation: js.multipleTypes(['string', 'null']),
      name: js.string(),
      readOnly: js.boolean,
      subPath: js.multipleTypes(['string', 'null']),
      subPathExpr: js.multipleTypes(['string', 'null']),
    },
  },
  volume:: js.object(additionalProperties={ type: 'object' }, required=['name']) {
    properties: {
      name: js.string(),
      configMap: js.object(additionalProperties=false, required=['name']) {
        properties: {
          defaultModes: js.integer(),
          items: js.array(uniqueItems=true, unevaluatedItems=false) {
            type: ['array', 'null'],
            items: js.object(additionalProperties=false, required=['key', 'path']) {
              properties: {
                key: js.string(),
                path: js.string(),
                mode: js.integer(),
              },
            },
          },
          name: js.string(),
          optional: js.boolean,
        },
      },
      emptyDir: js.object(additionalProperties=false) {
        properties: {
          medium: js.multipleTypes(['string', 'null']),
          sizeLimit: js.oneOf([js.multipleTypes(['string', 'null']), js.integer()])
        },
      },
      hostPath: js.object(additionalProperties=false, required=['path']) {
        properties: {
          path: js.string(pattern='^/'),
          type: js.multipleTypes(['string', 'null']),
        },
      },
      persistentVolumeClaim: js.object(additionalProperties=false, required=['claimName']) {
        properties: {
          claimName: js.string(),
          readOnly: js.boolean,
        },
      },
      secret: js.object(additionalProperties=false, required=['secretName']) {
        properties: {
          defaultModes: js.integer(),
          items: js.array(uniqueItems=true, unevaluatedItems=false) {
            type: ['array', 'null'],
            items: js.object(additionalProperties=false, required=['key', 'path']) {
              properties: {
                key: js.string(),
                path: js.string(),
                mode: js.integer(),
              },
            },
          },
          optional: js.boolean,
          secretName: js.string(),
        },
      },
    },
  },
}
