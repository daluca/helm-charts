local js = import 'json-schema/draft/2020-12/schema.libsonnet';
local net = import 'networking.libsonnet';
local unix = import 'unix.libsonnet';

{
  local kube = self,

  annotations:: js.object() {
    properties:: { hidden: true },
    additionalProperties: js.string(),
  },
  imagePullPolicy:: js.enum(['Always', 'Never', 'IfNotPresent']),
  resource:: js.object(additionalProperties=false) {
    properties: {
      cpu: js.oneOf([js.string(), js.Null]),
      memory: js.oneOf([js.string(), js.Null]),
    },
    patternProperties: {
      '^hugepages-': js.string(),
    },
  },
  resources:: js.object(additionalProperties=false) {
    properties: {
      requests: js.oneOf([kube.resource, js.Null]),
      limits: js.oneOf([kube.resource, js.Null]),
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
  securityContext:: js.object(additionalProperties=false) {
    properties: {
      allowPrivilegeEscalation: js.boolean,
      capabilities: kube.capabilities,
      privileged: js.boolean,
      procMount: js.string(),
      readOnlyRootFilesystem: js.boolean,
      runAsGroup: unix.gid,
      runAsNonRoot: js.boolean,
      runAsUser: unix.uid,
      seLinuxOptions: kube.SELinuxOptions,
      seccompProfile: kube.seccompProfile,
      windowsOptions: kube.windowsSecurtiyContextOptions,
    },
  },
  podSecurityContext:: js.object(additionalProperties=false) {
    properties: {
      fsGroup: unix.gid,
      fsGroupChangePolicy: js.enum(["OnRootMismatch", "Always"]),
      runAsGroup: unix.gid,
      runAsNonRoot: js.boolean,
      runAsUser: unix.uid,
      seLinuxOptions: kube.SELinuxOptions,
      seccompProfile: kube.seccompProfile,
      supplementalGroups: js.array(unevaluatedItems=false, uniqueItems=true) {
        items: unix.gid,
      },
      sysctls: js.array(unevaluatedItems=false, uniqueItems=true) {
        items: kube.sysctl,
      },
      windowsOptions: kube.windowsSecurtiyContextOptions,
    },
  },
  SELinuxOptions:: js.object(additionalProperties=false) {
    properties: {
      level: js.string(),
      role: js.string(),
      type: js.string(),
      user: js.string(),
    },
  },
  seccompProfile:: js.object(additionalProperties=false) {
    properties: {
      localhostProfile: js.string(),
      type: js.enum(['Localhost', 'RuntimeDefault', 'Unconfined']),
    },
  },
  sysctl:: js.object(additionalProperties=false) {
    properties: {
      name: js.string(),
      value: js.string(),
    },
  },
  windowsSecurtiyContextOptions:: js.object(additionalProperties=false) {
    properties: {
      gmsaCredentialSpec: js.string(),
      gmsaCredentialSpecName: js.string(),
      hostProcess: js.string(),
      runAsUserName: js.string(),
    },
  },
  capabilities:: js.object(additionalProperties=false) {
    properties: {
      add: js.array(unevaluatedItems=false, uniqueItems=true) {
        items: js.string(),
      },
      drop: js.array(unevaluatedItems=false, uniqueItems=true) {
        items: js.string(),
      },
    },
  },
  envVar:: js.object(additionalProperties=false) {
    properties: {
      name: js.string(),
      value: js.string(),
      valueFrom: kube.envVarSource,
    },
  },
  envVarSource:: js.object(additionalProperties=false) {
    properties: {
      configMapKeyRef: kube.configMapKeySelector,
      fieldRef: kube.objectFieldSelector,
      resourceFieldRef: kube.resourceFieldSelector,
      secretKeyRef: kube.secretKeySelector,
    },
  },
  configMapKeySelector:: js.object(additionalProperties=false) {
    properties: {
      key: js.string(),
      name: js.string(),
      optional: js.boolean,
    },
  },
  objectFieldSelector:: js.object(additionalProperties=false) {
    properties: {
      apiVersion: js.string(),
      fieldPath: js.string(),
    },
  },
  resourceFieldSelector:: js.object(additionalProperties=false) {
    properties: {
      containerName: js.string(),
      divisor: js.oneOf([js.integer(), js.string()]),
      resource: js.string(),
    },
  },
  secretKeySelector:: js.object(additionalProperties=false) {
    properties: {
      key: js.string(),
      name: js.string(),
      optional: js.boolean,
    },
  },
}
